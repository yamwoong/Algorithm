class Solution {
    public String solution(String my_string, int[] index_list) {
        String answer = "";
        char[] arr = new char[index_list.length];
        int num = 0;
        
        for(int i = 0; i < index_list.length; i++){
            num = index_list[i];
            arr[i] = my_string.charAt(num);
        }
        answer = new String(arr);
        return answer;
    }
}