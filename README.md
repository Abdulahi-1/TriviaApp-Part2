# Trivia_IOS_Part2

Submitted by: Abdulahi Abdi

Trivia_IOS is an iOS application that allows users to test their knowledge by answering a set of trivia questions. The app fetches questions from the Open Trivia Database API and presents them in a simple interface where users can select answers, track their progress, and view their score at the end of the game. It demonstrates networking, JSON decoding, UI updates, and data passing in iOS using Swift and Storyboard.

Time spent: 6 hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] User can view and answer at least 5 trivia questions.
- [X] App retrieves question data from the Open Trivia Database API.
- [X] Fetch a different set of questions if the user indicates they would like to reset the game.
- [X] Users can see score after submitting all questions.
- [X] True or False questions only have two options.


The following **optional** features are implemented:

  
- [X] Allow the user to choose a specific category of questions.
- [X] Provide the user feedback on whether each question was correct before navigating to the next.

The following **additional** features are implemented:

- [X] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

https://www.loom.com/share/8a7c97d5751142cca06547dbbac185e1?sid=a7dbbd61-4206-42d0-855a-1940345b2f54

## Notes

I initially struggled with how stack views interacted with constraints and how changes in one view affected others. To resolve this, I experimented with constraint priorities, adjusted spacing, and used alignment settings in Interface Builder to ensure the layout adapted correctly across different screen sizes. The outcome was a clean and responsive UI where questions, answers, and buttons are consistently aligned, making the app easier to navigate and more visually appealing.

## License

    Copyright 2025 Abdulahi Abdi

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
