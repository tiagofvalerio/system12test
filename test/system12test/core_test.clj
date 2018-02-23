(ns system12test.core-test
  (:require [clojure.test :refer :all]
            [system12test.core :refer :all]
            [clj-http.client :as client]
            [clojure.data.json :as json]))

(deftest a-test
  (testing "should system2 send a successfuly message to system1"
    (let [response-system2 (client/post "http://127.0.0.1:8081/v1/create-test"
                             {:body (json/write-str "teste")
                              :content-type :json})
          response-system1 (client/get "http://127.0.0.1:8080/v1/test")
          body-response-system1 (json/read-str (:body response-system1) :key-fn keyword)]
      (is (= (:status response-system2) 200))
      (is (= (:status response-system1) 200))
      (is (= (:description (get body-response-system1 0) "teste"))))))
