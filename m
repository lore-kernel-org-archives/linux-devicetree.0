From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Wed, 26 Jul 2017 07:38:02 +0000
Message-ID: <f2908e38-dc4d-3886-4058-52a7ad845415@st.com>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
 <20170722065133.GT3053@localhost>
 <2b916330-9b65-f4d5-817f-79b66cc236b3@st.com>
 <20170726052930.GF3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170726052930.GF3053@localhost>
Content-Language: en-US
Content-ID: <B433A82BE688B64A94720B93069992C7@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie DELAUNAY <amelie.delaunay@st.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA3LzI2LzIwMTcgMDc6MjkgQU0sIFZpbm9kIEtvdWwgd3JvdGU6DQo+IE9uIE1vbiwg
SnVsIDI0LCAyMDE3IGF0IDAxOjU1OjEwUE0gKzAwMDAsIFBpZXJyZSBZdmVzIE1PUkRSRVQgd3Jv
dGU6DQo+IA0KPj4+PiArDQo+Pj4+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYs
IElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4+Pj4gKwlpZiAoIXJlcykNCj4+Pj4gKwkJcmV0dXJuIC1F
Tk9ERVY7DQo+Pj4+ICsNCj4+Pj4gKwlpb21lbSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRl
di0+ZGV2LCByZXMpOw0KPj4+PiArCWlmICghaW9tZW0pDQo+Pj4+ICsJCXJldHVybiAtRU5PTUVN
Ow0KPj4+PiArDQo+Pj4+ICsJc3Bpbl9sb2NrX2luaXQoJnN0bTMyX2RtYW11eC0+bG9jayk7DQo+
Pj4+ICsNCj4+Pj4gKwlzdG0zMl9kbWFtdXgtPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2
LCBOVUxMKTsNCj4+Pj4gKwlpZiAoSVNfRVJSKHN0bTMyX2RtYW11eC0+Y2xrKSkgew0KPj4+PiAr
CQlkZXZfaW5mbygmcGRldi0+ZGV2LCAiTWlzc2luZyBjb250cm9sbGVyIGNsb2NrXG4iKTsNCj4+
Pg0KPj4+IENhbiB5b3UgY2hlY2sgZm9yIEVQUk9CRV9ERUZFUiBhbmQgcHJpbnQgb25seSBmb3Ig
aWYgdGhhdCBpcyBub3QgdGhlIGVycm9yDQo+Pj4gb3RoZXJ3aXNlIHdlIGVuZCB1cCBzYXBtbWlu
ZyB3aXRoIGRlZmVyZWQgcHJvYmUgaXNzdWVzDQo+Pj4NCj4+DQo+PiBUaGlzIGlzIHdoYXQgeW91
IG1lYW50ID8NCj4+IAlpZiAoSVNfRVJSKHN0bTMyX2RtYW11eC0+Y2xrKSAhPSBFUFJPQkVfREVG
RVIpIHsNCj4+IAkJZGV2X2luZm8oJnBkZXYtPmRldiwgIk1pc3NpbmcgY29udHJvbGxlciBjbG9j
a1xuIik7DQo+PiAJCXJldHVybiBQVFJfRVJSKHN0bTMyX2RtYW11eC0+Y2xrKTsNCj4+IAl9DQo+
Pg0KPj4gT1INCj4+DQo+PiAJaWYgKElTX0VSUihzdG0zMl9kbWFtdXgtPmNsaykpIHsNCj4+IAkJ
aWYgKElTX0VSUihzdG0zMl9kbWFtdXgtPmNsaykgIT0gRVBST0JFX0RFRkVSKQ0KPj4gCQkJZGV2
X2luZm8oJnBkZXYtPmRldiwgIk1pc3NpbmcgY29udHJvbGxlciBjbG9ja1xuIik7DQo+PiAJCXJl
dHVybiBQVFJfRVJSKHN0bTMyX2RtYW11eC0+Y2xrKTsNCj4+IAl9DQo+IA0KPiBUaGlzIG9uZSBw
bGVhc2UNCj4gDQoNCm9rDQoNCj4+DQo+Pj4+ICsNCj4+Pj4gKyNpZm5kZWYgX19ETUFfU1RNMzJf
RE1BTVVYX0gNCj4+Pj4gKyNkZWZpbmUgX19ETUFfU1RNMzJfRE1BTVVYX0gNCj4+Pj4gKw0KPj4+
PiArI2lmIGRlZmluZWQoQ09ORklHX1NUTTMyX0RNQU1VWCkNCj4+Pj4gK2ludCBzdG0zMl9kbWFt
dXhfc2V0X2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKnJvdXRlX2RhdGEsIHUzMiBj
aGFuX2lkKTsNCj4+Pg0KPj4+IFdoeSBkbyB3ZSBuZWVkIGEgY3VzdG9tIEFQSSBpbiB0aGlzIGNh
c2U/DQo+Pj4NCj4+DQo+PiBUaGlzIEFQSSBpcyBjYWxsZWQgYnkgRE1BIHdoZW4gYSBzbGF2ZSBp
cyByZXF1ZXN0ZWQgYnkgY2xpZW50LiBETUEgY2FuIHdvcmsNCj4+IHdpdGhvdXQgRE1BTVVYIHRo
aXMgQVBJIGhhcyBiZWVuIHB1dCBpbiBwbGFjZSB0byBjb25maWd1cmUgRE1BTVVYIHdoZXRoZXIg
Y2xpZW50DQo+PiBpcyByZXF1ZXN0aW5nIGEgRE1BTVVYIENoYW5uZWwgaW5zdGVhZCBvZiBhIERN
QSBvbmUuDQo+IA0KPiBZb3UgbWVhbiB0aGUgZG1hZW5naW5lIGRyaXZlciByaWdodD8NCj4gDQoN
Clllcy4gVGhlIEFQSSBpcyBtYWlubHkgY2FsbGVkIGJ5ICJkZXZpY2VfY29uZmlnIiB0aHJvdWdo
IG91dCBTVE0zMiBETUEgRHJpdmVyDQp3aGVuIGEgcm91dGVyIGlzIGluIHBsYWNlIGZvciBjbGll
bnQuDQpQbGVhc2UgcmVmZXIgdG8gUGF0Y2ggNC81IG9uIHRoaXMgc2V0Lg0KDQpUaGFua3MNClB5
