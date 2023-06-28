import java.util.*;

class Solution {
    public int[] solution(int[] num_list) {
        int num = 5;
        int[] answer = new int[num_list.length - num];
        
        Arrays.sort(num_list);
        
        for(int i = num; i < num_list.length; i++){
            answer[i - num] = num_list[i];
        }
        
        return answer;
    }
}