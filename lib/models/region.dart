class Region {
  int id;
  List<Locations> locations;
  MainGeneration mainGeneration;
  String name;
  List<Names> names;
  List<Pokedexes> pokedexes;
  List<VersionGroups> versionGroups;

  Region(
      {this.id,
      this.locations,
      this.mainGeneration,
      this.name,
      this.names,
      this.pokedexes,
      this.versionGroups});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['locations'] != null) {
      locations = new List<Locations>();
      json['locations'].forEach((v) {
        locations.add(new Locations.fromJson(v));
      });
    }
    mainGeneration = json['main_generation'] != null
        ? new MainGeneration.fromJson(json['main_generation'])
        : null;
    name = json['name'];
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['pokedexes'] != null) {
      pokedexes = new List<Pokedexes>();
      json['pokedexes'].forEach((v) {
        pokedexes.add(new Pokedexes.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = new List<VersionGroups>();
      json['version_groups'].forEach((v) {
        versionGroups.add(new VersionGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.locations != null) {
      data['locations'] = this.locations.map((v) => v.toJson()).toList();
    }
    if (this.mainGeneration != null) {
      data['main_generation'] = this.mainGeneration.toJson();
    }
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.pokedexes != null) {
      data['pokedexes'] = this.pokedexes.map((v) => v.toJson()).toList();
    }
    if (this.versionGroups != null) {
      data['version_groups'] =
          this.versionGroups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
  String name;
  String url;

  Locations({this.name, this.url});

  Locations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class MainGeneration {
  String name;
  String url;

  MainGeneration({this.name, this.url});

  MainGeneration.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Names {
  Language language;
  String name;

  Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Language {
  String name;
  String url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Pokedexes {
  String name;
  String url;

  Pokedexes({this.name, this.url});

  Pokedexes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class VersionGroups {
  String name;
  String url;

  VersionGroups({this.name, this.url});

  VersionGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
