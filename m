From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v6 0/6] drm: add support for Cadence MHDP DPI/DP bridge.
Date: Mon, 5 Nov 2018 12:09:35 +0100
Message-ID: <d6db03aa-6f61-f902-85f6-2245547186bc@samsung.com>
References: <1539034953-11274-1-git-send-email-dkos@cadence.com>
 <CY1PR0701MB166434BBB71DB76593E0F513CDCA0@CY1PR0701MB1664.namprd07.prod.outlook.com>
 <3056496.a8qoricJmv@avalon>
 <CGME20181105103448epcas1p29a9889a9a19fc56629dcc7e24785556c@epcas1p2.samsung.com>
 <CY1PR0701MB16644A2C7EF670F5AC732BF8CDCA0@CY1PR0701MB1664.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CY1PR0701MB16644A2C7EF670F5AC732BF8CDCA0@CY1PR0701MB1664.namprd07.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Damian Kos <dkos@cadence.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "quentin.schulz@bootlin.com" <quentin.schulz@bootlin.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Quentin Schulz <quentin.schulz@free-electrons.com>, Rafal Ciepiela <rafalc@cadence.com>, Rob Herring <robh+dt@kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, Sean Paul <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Piotr Sroka <piotrs@cadence.com>
List-Id: devicetree@vger.kernel.org

T24gMDUuMTEuMjAxOCAxMTozMywgRGFtaWFuIEtvcyB3cm90ZToKPiBIaSBMYXVyZW50LAo+Cj4g
VW5kZXJzdG9vZC4gVGhhbmtzLgoKCkkgd2lsbCBsb29rIGF0IGl0IHRvZGF5IG9yIHRvbW9ycm93
LgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+Cj4gRGFtaWFuCj4KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4gCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA1LCAyMDE4IDExOjMwCj4gVG86
IERhbWlhbiBLb3MgPGRrb3NAY2FkZW5jZS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYXJrIFJ1dGxh
bmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgQXJjaGl0IFRhbmVqYSA8YXJjaGl0dEBjb2RlYXVy
b3JhLm9yZz47IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+OyBHdXN0YXZvIFBh
ZG92YW4gPGd1c3Rhdm9AcGFkb3Zhbi5vcmc+OyBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+OyBT
YW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPjsgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT47IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBmcmVlLWVsZWN0cm9ucy5j
b20+OyBQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgUmFmYWwgQ2llcGllbGEgPHJhZmFsY0Bj
YWRlbmNlLmNvbT47IHF1ZW50aW4uc2NodWx6QGJvb3RsaW4uY29tOyBqYmVyZ3NhZ2VsQHRpLmNv
bQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMC82XSBkcm06IGFkZCBzdXBwb3J0IGZvciBDYWRl
bmNlIE1IRFAgRFBJL0RQIGJyaWRnZS4KPgo+IEVYVEVSTkFMIE1BSUwKPgo+Cj4gSGkgRGFtaWFu
LAo+Cj4gT24gTW9uZGF5LCA1IE5vdmVtYmVyIDIwMTggMTE6NDQ6NTMgRUVUIERhbWlhbiBLb3Mg
d3JvdGU6Cj4+IEhpIEd1eXMsCj4+Cj4+IEknbSB3b25kZXJpbmcgaWYgdGhpcyB0aW1lIHBhdGNo
IGlzIHNvIGdvb2QgdGhhdCB0aGVyZSdyZSBubyBjaGFuZ2UgCj4+IHJlcXVlc3RzLCBvciBpcyBp
dCBzbyBiYWQgdGhhdCBpdCB3YXMgcmVqZWN0ZWQgd2l0aG91dCBhIGNvbW1lbnQgOiApIAo+PiBQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBwYXRjaCBpcyBiZWluZyBpbiByZXZpZXcgb3Igd2Fz
IHJlamVjdGVkIAo+PiBhbmQsIGlmIHNvLCB3aGF0IG5lZWRzIHRvIGJlIGNoYW5nZWQuCj4gSSB1
bmZvcnR1bmF0ZWx5IGRvbid0IGhhdmUgdGltZSB0byByZXZpZXcgeW91ciBzZXJpZXMgZm9yIHRo
ZSB0aW1lIGJlaW5nLiAKPiBIb3BlZnVsbHkgc29tZW9uZSBlbHNlIHdpbGwgaGF2ZSBhIGJldHRl
ciByZXZpZXcgYmFuZHdpZHRoIDotKSBTb3JyeSBhYm91dCB0aGF0Lgo+Cj4gLS0KPiBSZWdhcmRz
LAo+Cj4gTGF1cmVudCBQaW5jaGFydAo+Cj4KPgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
