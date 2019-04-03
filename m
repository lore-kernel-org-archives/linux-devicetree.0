From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 02/15] phy: mvebu-cp110-comphy: Add SMC call support
Date: Wed, 3 Apr 2019 11:24:09 +0200
Message-ID: <20190403112409.1eb19335@xps13>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
 <20190401165131.23370-3-miquel.raynal@bootlin.com>
 <CAH76GKOJkrQnMVYFCQJKrvX++5kH4be95ytR7CaL8V5duL27yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAH76GKOJkrQnMVYFCQJKrvX++5kH4be95ytR7CaL8V5duL27yw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <mw@semihalf.com>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgR3J6ZWdvcnosCgpHcnplZ29yeiBKYXN6Y3p5ayA8amF6QHNlbWloYWxmLmNvbT4gd3JvdGUg
b24gV2VkLCAzIEFwciAyMDE5IDExOjAyOjE1CiswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gcG9u
LiwgMSBrd2kgMjAxOSBvIDE4OjUyIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+IG5hcGlzYcWCKGEpOgo+ID4gK3N0YXRpYyBpbnQgbXZlYnVfY29tcGh5X3Bvd2VyX29u
KHN0cnVjdCBwaHkgKnBoeSkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBtdmVidV9jb21waHlf
bGFuZSAqbGFuZSA9IHBoeV9nZXRfZHJ2ZGF0YShwaHkpOwo+ID4gKyAgICAgICBzdHJ1Y3QgbXZl
YnVfY29tcGh5X3ByaXYgKnByaXYgPSBsYW5lLT5wcml2Owo+ID4gKyAgICAgICB1MzIgZndfcGFy
YW0gPSAwOwo+ID4gKyAgICAgICBpbnQgZndfbW9kZTsKPiA+ICsgICAgICAgaW50IHJldDsKPiA+
ICsKPiA+ICsgICAgICAgZndfbW9kZSA9IG12ZWJ1X2NvbXBoeV9nZXRfZndfbW9kZShsYW5lLT5p
ZCwgbGFuZS0+cG9ydCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsYW5lLT5tb2RlLCBsYW5lLT5zdWJtb2RlKTsKPiA+ICsgICAgICAgaWYgKGZ3X21vZGUg
PCAwKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gdHJ5X2xlZ2FjeTsKPiA+ICsKPiA+ICsgICAg
ICAgLyogVHJ5IFNNQyBmbG93IGZpcnN0ICovCj4gPiArICAgICAgIHN3aXRjaCAobGFuZS0+bW9k
ZSkgewo+ID4gKyAgICAgICBjYXNlIFBIWV9NT0RFX0VUSEVSTkVUOgo+ID4gKyAgICAgICAgICAg
ICAgIGRldl9kYmcocHJpdi0+ZGV2LCAic2V0IGxhbmUgJWQgdG8gRXRoZXJuZXQgbW9kZVxuIiwg
bGFuZS0+aWQpOwo+ID4gKyAgICAgICAgICAgICAgIHN3aXRjaCAobGFuZS0+c3VibW9kZSkgewo+
ID4gKyAgICAgICAgICAgICAgIGNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX1NHTUlJOgo+ID4gKyAg
ICAgICAgICAgICAgIGNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFXzI1MDBCQVNFWDoKPiA+ICsgICAg
ICAgICAgICAgICBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV8xMEdLUjoKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGZ3X3BhcmFtID0gQ09NUEhZX0ZXX1BBUkFNKGZ3X21vZGUsIGxhbmUtPnBv
cnQpOwo+IAo+IEl0IHNlZW1zIGl0IHdpbGwgbm90IHdvcmsgZm9yIFNHTUlJIGFuZCAyNTAwQkFT
RVguIEl0IGlzIGJlY2F1c2UgeW91Cj4gYXJlIHNldHRpbmcgbWF4IHNwZWVkIGZvciBhbGwgY29t
cGh5IG1vZGVzIGluc2lkZSBDT01QSFlfRldfUEFSQU0KPiBtYWNybyB3aGljaCBpcyB3cm9uZy4g
RGlkIHlvdSB0ZXN0IGl0PwoKSSBtaXNyZWFkIEFURiBpbXBsZW1lbnRhdGlvbiwgSSB3YXMgc3Vy
ZSB0aGUgc3BlZWQgd2FzIGRlcml2ZWQgZnJvbSB0aGUKdHlwZSBhbmQgdGhpcyBwYXJhbWV0ZXIg
d2FzIHVzZWxlc3MuIEknbGwgZG8gdGhlIG1vZGlmaWNhdGlvbi4KCj4gQlRXIGNhbiB5b3UgcG9p
bnQgdG8gc29tZSBwdWJsaWMgdGVtcG9yYXJ5IGdpdCBicmFuY2ggd2hlcmUgdGhpcwo+IHBhdGNo
c2V0IGNhbiBiZSBmb3VuZD8KCkp1c3QgcHVzaGVkIHRoZXJlIGlmIHlvdSB3YW50IHRvIHRha2Ug
YSBsb29rOgpodHRwczovL2dpdGh1Yi5jb20vbWlxdWVscmF5bmFsL2xpbnV4LmdpdCBtYXJ2ZWxs
LzUuMS1yYzEvY3AxMTAtY29tcGh5CgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQpNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==
