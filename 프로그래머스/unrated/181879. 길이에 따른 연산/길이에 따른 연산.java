class Solution {
    public int solution(int[] num_list) {
        int answer = num_list[0];
        int arrLen = num_list.length;
        for(int i = 1; i < arrLen; i++){
            if(arrLen > 10){
                answer += num_list[i];
            } else {
                answer *= num_list[i];
            }
        }
        
        return answer;
    }
}