class TopApps {
  Feed feed;

  TopApps({this.feed});

  TopApps.fromJson(Map<String, dynamic> json) {
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feed != null) {
      data['feed'] = this.feed.toJson();
    }
    return data;
  }
}

class Feed {
  Author author;
  List<Entry> entry;
  Updated updated;
  Rights rights;
  Title title;
  FeedIcon icon;
  List<Link> link;
  Self self;

  Feed(
      {this.author,
      this.entry,
      this.updated,
      this.rights,
      this.title,
      this.icon,
      this.link,
      this.self});

  Feed.fromJson(Map<String, dynamic> json) {
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['entry'] != null) {
      entry = new List<Entry>();
      json['entry'].forEach((v) {
        entry.add(new Entry.fromJson(v));
      });
    }
    updated =
        json['updated'] != null ? new Updated.fromJson(json['updated']) : null;
    rights =
        json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    icon = json['icon'] != null ? new FeedIcon.fromJson(json['icon']) : null;
    if (json['link'] != null) {
      link = new List<Link>();
      json['link'].forEach((v) {
        link.add(new Link.fromJson(v));
      });
    }
    self = json['id'] != null ? new Self.fromJson(json['id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.entry != null) {
      data['entry'] = this.entry.map((v) => v.toJson()).toList();
    }
    if (this.updated != null) {
      data['updated'] = this.updated.toJson();
    }
    if (this.rights != null) {
      data['rights'] = this.rights.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link.map((v) => v.toJson()).toList();
    }
    if (this.self != null) {
      data['id'] = this.self.toJson();
    }
    return data;
  }
}

class Author {
  Name name;
  Uri uri;

  Author({this.name, this.uri});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    uri = json['uri'] != null ? new Uri.fromJson(json['uri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.uri != null) {
      data['uri'] = this.uri.toJson();
    }
    return data;
  }
}

class Name {
  String label;

  Name({this.label});

  Name.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Uri {
  String label;

  Uri({this.label});

  Uri.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Entry {
  ImName imName;
  List<ImImage> imImage;
  Summary summary;
  ImPrice imPrice;
  ImContentType imContentType;
  Rights rights;
  Title title;
  Link link;
  Id id;
  ImArtist imArtist;
  Category category;
  ImReleaseDate imReleaseDate;

  List<int> imImageBytes;
  int dbId;

  Entry(
      {this.dbId,
      this.imName,
      this.imImage,
      this.summary,
      this.imPrice,
      this.imContentType,
      this.rights,
      this.title,
      this.link,
      this.id,
      this.imArtist,
      this.category,
      this.imReleaseDate
      });

  Entry.fromJson(Map<String, dynamic> json) {
    imName =
        json['im:name'] != null ? new ImName.fromJson(json['im:name']) : null;
    if (json['im:image'] != null) {
      imImage = new List<ImImage>();
      json['im:image'].forEach((v) {
        imImage.add(new ImImage.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    imPrice = json['im:price'] != null
        ? new ImPrice.fromJson(json['im:price'])
        : null;
    imContentType = json['im:contentType'] != null
        ? new ImContentType.fromJson(json['im:contentType'])
        : null;
    rights =
        json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    imArtist = json['im:artist'] != null
        ? new ImArtist.fromJson(json['im:artist'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    imReleaseDate = json['im:releaseDate'] != null
        ? new ImReleaseDate.fromJson(json['im:releaseDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imName != null) {
      data['im:name'] = this.imName.toJson();
    }
    if (this.imImage != null) {
      data['im:image'] = this.imImage.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    if (this.imPrice != null) {
      data['im:price'] = this.imPrice.toJson();
    }
    if (this.imContentType != null) {
      data['im:contentType'] = this.imContentType.toJson();
    }
    if (this.rights != null) {
      data['rights'] = this.rights.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.imArtist != null) {
      data['im:artist'] = this.imArtist.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.imReleaseDate != null) {
      data['im:releaseDate'] = this.imReleaseDate.toJson();
    }
    return data;
  }

  Map<dynamic, dynamic> toMap() {
    Map map = {
      "id": dbId,
      "app_label": imName.label,
      "app_summary" : summary.label,
    };
    return map;
  }
}

class ImName {
  String label;

  ImName({this.label});

  ImName.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Attributes {
  String height;

  Attributes({this.height});

  Attributes.fromJson(Map<String, dynamic> json) {
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    return data;
  }
}

class ImImage {
  String label;
  ImgAttributes attributes;

  ImImage({this.label, this.attributes});

  ImImage.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? new ImgAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class ImgAttributes {
  String height;

  ImgAttributes({this.height});

  ImgAttributes.fromJson(Map<String, dynamic> json) {
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    return data;
  }
}

class Summary {
  String label;

  Summary({this.label});

  Summary.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class ImPrice {
  String label;
  PriceAttributes attributes;

  ImPrice({this.label, this.attributes});

  ImPrice.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? new PriceAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class PriceAttributes {
  String amount;
  String currency;

  PriceAttributes({this.amount, this.currency});

  PriceAttributes.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class ImContentType {
  ImContentTypeAttributes attributes;

  ImContentType({this.attributes});

  ImContentType.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new ImContentTypeAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class ImContentTypeAttributes {
  String term;
  String label;

  ImContentTypeAttributes({this.term, this.label});

  ImContentTypeAttributes.fromJson(Map<String, dynamic> json) {
    term = json['term'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['term'] = this.term;
    data['label'] = this.label;
    return data;
  }
}

class Rights {
  String label;

  Rights({this.label});

  Rights.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Title {
  String label;

  Title({this.label});

  Title.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Link {
  LinkAttributes attributes;

  Link({this.attributes});

  Link.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new LinkAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class LinkAttributes {
  String rel;
  String type;
  String href;

  LinkAttributes({this.rel, this.type, this.href});

  LinkAttributes.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['type'] = this.type;
    data['href'] = this.href;
    return data;
  }
}

class Id {
  String label;
  IdAttributes attributes;

  Id({this.label, this.attributes});

  Id.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? new IdAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class IdAttributes {
  String imid;
  String imbundleid;

  IdAttributes({this.imid, this.imbundleid});

  IdAttributes.fromJson(Map<String, dynamic> json) {
    imid = json['im:id'];
    imbundleid = json['im:bundleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['im:id'] = this.imid;
    data['im:bundleid'] = this.imbundleid;
    return data;
  }
}

class ImArtist {
  String label;
  ImArtistAttributes attributes;

  ImArtist({this.label, this.attributes});

  ImArtist.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? new ImArtistAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class ImArtistAttributes {
  String href;

  ImArtistAttributes({this.href});

  ImArtistAttributes.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Category {
  CategoryAttributes attributes;

  Category({this.attributes});

  Category.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new CategoryAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class CategoryAttributes {
  String imid;
  String term;
  String scheme;
  String label;

  CategoryAttributes({this.imid, this.term, this.scheme, this.label});

  CategoryAttributes.fromJson(Map<String, dynamic> json) {
    imid = json['im:id'];
    term = json['term'];
    scheme = json['scheme'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['im:id'] = this.imid;
    data['term'] = this.term;
    data['scheme'] = this.scheme;
    data['label'] = this.label;
    return data;
  }
}

class ImReleaseDate {
  String label;
  Attributes attributes;

  ImReleaseDate({this.label, this.attributes});

  ImReleaseDate.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class Updated {
  String label;

  Updated({this.label});

  Updated.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class FeedIcon {
  String label;

  FeedIcon({this.label});

  FeedIcon.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Self {
  String label;

  Self({this.label});

  Self.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}
