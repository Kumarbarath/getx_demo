class SiteModal {
  List<Hits>? hits;

  SiteModal({this.hits});

  SiteModal.fromJson(Map<String, dynamic> json) {
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(new Hits.fromJson(v));
      });
    }
  }
}

class Hits {
  String? id;

  String? name;
  String? alias;
  String? description;
  String? url;

  List<Images>? images;
  List<Location>? location;

  //List<dynamic>? podcasts;

  String? objectID;

  Hits(
      {this.id,
      this.name,
      this.alias,
      this.description,
      this.url,
      this.images,
     // this.podcasts,
      this.location});

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    url = json['url'];

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    } else {
      json['images'] = [];
    }

    if (json['locations'] != null) {
      location = <Location>[];
      json['locations'].forEach((v) {
        location!.add(new Location.fromJson(v));
      });
    } else {
      json['locations'] = [];
    }

   // podcasts = json['podcasts'];
    objectID = json['objectID'];
  }
}

class Images {
  String? imageUrl;

  Images({
    this.imageUrl,
  });

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }
}

class Location {
  String? address;

  Location({
    this.address,
  });

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }
}


