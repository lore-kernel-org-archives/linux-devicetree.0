From: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>
Subject: RE: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC
 strength and ECC step size
Date: Tue, 11 Feb 2014 15:49:24 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6F815@DBDE04.ent.ti.com>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140211141914.GC23150@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140211141914.GC23150@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgRXplcXVpZWwsDQoNCj5Gcm9tOiBFemVxdWllbCBHYXJjaWEgW21haWx0bzplemVxdWllbC5n
YXJjaWFAZnJlZS1lbGVjdHJvbnMuY29tXQ0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL25hbmQudHh0DQo+PiBpbmRleCAwMzg1NWM4Li42ODNhMzEwIDEwMDY0
NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLnR4
dA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLnR4
dA0KPj4gQEAgLTMsNSArMyw5IEBADQo+PiAgLSBuYW5kLWVjYy1tb2RlIDogU3RyaW5nLCBvcGVy
YXRpb24gbW9kZSBvZiB0aGUgTkFORCBlY2MgbW9kZS4NCj4+ICAgIFN1cHBvcnRlZCB2YWx1ZXMg
YXJlOiAibm9uZSIsICJzb2Z0IiwgImh3IiwgImh3X3N5bmRyb21lIiwgImh3X29vYl9maXJzdCIs
DQo+PiAgICAic29mdF9iY2giLg0KPj4NClNob3VsZCBuYW5kLWVjYy1tb2RlIGFsc28gYmUgbWFy
a2VkIGFzIDxkZXByZWNhdGVkPiwgYW5kIGJ1dCB3ZSBjb250aW51ZQ0Kc3VwcG9ydGluZyBpdCBp
biBrZXJuZWwgY29kZSA/IElmIHllcywgdGhlbiB3aGF0IGlzIHRoZSBsaWZlLXRpbWUgb2YgdGhl
c2UNCjxkZXByZWNhdGVkPiBiaW5kaW5ncy4gSSBtZWFuIGV4YWN0bHkgaG93IG1hbnkga2VybmVs
IHZlcnNpb25zIHNob3VsZA0KY29udGludWUgc3VwcG9ydCBkZXByZWNhdGVkIGJpbmRpbmdzID8N
Cg0KPj4gKy0gbmFuZC1lY2Mtc3RyZW5ndGggOiBpbnRlZ2VyIEVDQyByZXF1aXJlZCBzdHJlbmd0
aC4NCg0KV2l0aCByZWNlbnQgcGF0Y2hlcyBmcm9tICdCb3JpcyBCUkVaSUxMT04gPGIuYnJlemls
bG9uLmRldkBnbWFpbC5jb20+Jw0KIltSRkMgUEFUQ0hdIG10ZDogYWRkIHBlciBOQU5EIHBhcnRp
dGlvbiBFQ0MgY29uZmlnIg0KV291bGQgeW91IGxpa2UgJ25hbmQtZWNjLXN0cmVuZ3RoJyB0byBi
ZSBwZXIgcGFydGl0aW9uIGJhc2VkID8NCg0Kd2l0aCByZWdhcmRzLCBwZWtvbg0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
