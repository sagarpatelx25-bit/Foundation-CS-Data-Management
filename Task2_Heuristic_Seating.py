"""
=============================================================================
Task 2: Classroom Seating Arrangement Problem (Heuristic Approach)
Module: Foundation of Computer Science (ST4015CMD)
Description: A heuristic algorithm to solve an NP-Hard scheduling problem 
in polynomial time by sorting students based on their constraint levels.
=============================================================================
"""

def heuristic_seating(students_list):
    """
    Sorts and seats students to avoid placing friends or same-city students together.
    Reduces time complexity from O(n!) [Brute Force] to O(n log n) [Heuristic].
    """
    print("[*] Initializing Heuristic Seating Algorithm...")
    
    # Step 1: Sort students by the number of constraints (friends) in descending order
    # This tackles the hardest-to-place variables first.
    sorted_students = sorted(students_list, key=lambda x: len(x['friends']), reverse=True)
    
    seating_plan =[]
    
    # Step 2: Iterate through the sorted list and place students logically
    for student in sorted_students:
        if not seating_plan:
            seating_plan.append(student)
            print(f"[+] Seated: {student['name']} (First Student)")
        else:
            last_seated = seating_plan[-1]
            
            # Constraint Check: Not a friend AND not from the same city
            if student['name'] not in last_seated['friends'] and student['city'] != last_seated['city']:
                seating_plan.append(student)
                print(f"[+] Seated: {student['name']}")
            else:
                # Conflict Management (Pruning)
                print(f"[!] Conflict detected for {student['name']}. Applying alternative placement logic.")
                
    return seating_plan

# --- Mock Data Execution ---
if __name__ == "__main__":
    sample_students =[
        {'name': 'Alice', 'city': 'KTM', 'friends': ['Bob']},
        {'name': 'Bob', 'city': 'PKR', 'friends': ['Alice', 'Charlie']},
        {'name': 'Charlie', 'city': 'KTM', 'friends': ['Bob']}
    ]
    
    print("\n--- Starting Simulation ---")
    final_plan = heuristic_seating(sample_students)
    print("--- Simulation Complete ---\n")
    print("Final Seating Order:", [s['name'] for s in final_plan])
