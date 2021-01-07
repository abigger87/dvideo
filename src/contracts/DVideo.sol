pragma solidity ^0.5.0;

contract DVideo {
    uint256 public videoCount = 0;
    string public name = "DVideo";
    mapping(uint256 => Video) public videos;

    struct Video {
        uint256 id;
        string hash;
        string title;
        address author;
    }

    event VideoStored(uint256 id, string hash, string title, address author);

    constructor() public {}

    function uploadVideo(string calldata _videoHash, string calldata _title)
        external
    {
        // Make sure the video hash exists
        require(bytes(_videoHash).length > 0, "Video Hash must not be empty.");

        // Make sure video title exists
        require(bytes(_title).length > 0, "Video Title must not be empty.");

        // Make sure uploader address exists
        require(msg.sender != address(0x0), "Video Hash must not be empty.");

        // Increment video id
        ++videoCount;

        // Add video to the contract
        videos[videoCount] = Video(videoCount, _videoHash, _title, msg.sender);

        // Trigger an event
        emit VideoStored(videoCount, _videoHash, _title, msg.sender);
    }
}
