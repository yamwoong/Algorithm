class Solution {
    public String solution(String my_string) {
        String answer = my_string;
        String[] arr = {"a", "e", "i", "o", "u"};
        
        for(String str : arr){
            answer = answer.replaceAll(str, "");
        }
        
        return answer;
    }
}