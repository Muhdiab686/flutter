class Group {
  final int id;
  final String groupName;
  final int ownerId;
  final String owner;
  final int membersCount;

  Group(
      {required this.id, required this.groupName, required this.ownerId, required this.owner, required this.membersCount});


  factory Group.fromJson(json) {
    return Group(id: json['id']??0,
      groupName: json['group_name'],
      ownerId: json['owner_id'],
      owner: json['owner'],
      membersCount: json['members_count'],);
  }



}

