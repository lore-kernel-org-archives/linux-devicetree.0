From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v6 2/3] drm: bridge: Add thc63lvd1024 LVDS decoder driver
Date: Tue, 27 Mar 2018 10:36:40 +0200
Message-ID: <8115587a-4925-5602-43db-4285a3de7b0e@samsung.com>
References: <1521213399-31947-1-git-send-email-jacopo+renesas@jmondi.org>
 <1521213399-31947-3-git-send-email-jacopo+renesas@jmondi.org>
 <CGME20180327062437epcas5p3389cb070d15669febeb6f504cff2cf6f@epcas5p3.samsung.com>
 <30381869-9bc8-b6aa-a37a-598d9c8f280d@mentor.com>
 <df124c8f-7c71-7941-9969-977dd19c7d1b@samsung.com>
 <CAMuHMdVWJhmxXS+mvuwjrCOzurArFurqKwQ2PJD-eRCqbLRAng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMuHMdVWJhmxXS+mvuwjrCOzurArFurqKwQ2PJD-eRCqbLRAng@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Airlie <airlied@linux.ie>, DRI Development <dri-devel@lists.freedesktop.org>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

T24gMjcuMDMuMjAxOCAwOTozNiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEFuZHJ6
ZWosCj4KPiBPbiBUdWUsIE1hciAyNywgMjAxOCBhdCA5OjI4IEFNLCBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPiB3cm90ZToKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYwo+Pj4+ICtzdGF0aWMgdm9pZCB0
aGM2M19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPj4+PiArewo+Pj4+ICsgICAg
c3RydWN0IHRoYzYzX2RldiAqdGhjNjMgPSB0b190aGM2MyhicmlkZ2UpOwo+Pj4+ICsgICAgc3Ry
dWN0IHJlZ3VsYXRvciAqdmNjOwo+Pj4+ICsgICAgaW50IGk7Cj4+PiB1bnNpZ25lZCBpbnQgaTsK
Pj4gV2h5PyBZb3UgYXJlIGludHJvZHVjaW5nIHNpbGx5IGJ1ZyB0aGlzIHdheSwgc2VlIGZldyBs
aW5lcyBiZWxvdy4KPj4KPj4+PiArCj4+Pj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RSh0aGM2My0+dmNjcyk7IGkrKykgewo+Pj4+ICsgICAgICAgICAgICB2Y2MgPSB0aGM2My0+dmNj
c1tpXTsKPj4+PiArICAgICAgICAgICAgaWYgKCF2Y2MpCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgICAgICBpZiAocmVndWxhdG9yX2VuYWJs
ZSh2Y2MpKQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyb3JfdmNjX2VuYWJsZTsK
Pj4+PiArICAgIH0KPj4+PiArCj4+Pj4gKyAgICBpZiAodGhjNjMtPnBkd24pCj4+Pj4gKyAgICAg
ICAgICAgIGdwaW9kX3NldF92YWx1ZSh0aGM2My0+cGR3biwgMCk7Cj4+Pj4gKwo+Pj4+ICsgICAg
aWYgKHRoYzYzLT5vZSkKPj4+PiArICAgICAgICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlKHRoYzYzLT5v
ZSwgMSk7Cj4+Pj4gKwo+Pj4+ICsgICAgcmV0dXJuOwo+Pj4+ICsKPj4+PiArZXJyb3JfdmNjX2Vu
YWJsZToKPj4+PiArICAgIGRldl9lcnIodGhjNjMtPmRldiwgIkZhaWxlZCB0byBlbmFibGUgcmVn
dWxhdG9yICVzXG4iLAo+Pj4+ICsgICAgICAgICAgICB0aGM2M19yZWdfbmFtZXNbaV0pOwo+Pj4+
ICsKPj4+PiArICAgIGZvciAoaSA9IGkgLSAxOyBpID49IDA7IGktLSkgewo+PiBIZXJlLCB0aGUg
bG9vcCB3aWxsIG5vdCBlbmQgaWYgeW91IGRlZmluZSBpIHVuc2lnbmVkLgo+IFRydWUuCj4KPj4g
SSBrbm93IG9uZSBjYW4gY2hhbmdlIHRoZSBsb29wLCB0byBtYWtlIGl0IHdvcmtpbmcgd2l0aCB1
bnNpZ25lZC4gQnV0Cj4+IHRoaXMgY2xlYXJseSBzaG93cyB0aGF0IHVzaW5nIHVuc2lnbmVkIGlz
IG1vcmUgcmlza3kuCj4+IFdoYXQgYXJlIGFkdmFudGFnZXMgb2YgdW5zaWduZWQgdnMgaW50IGlu
IHRoaXMgY2FzZS4gQXJlIHRoZXJlIHNvbWUKPj4gZ3VpZGVsaW5lcy9kaXNjdXNzaW9ucyBhYm91
dCBpdD8KPiBTb21lIHBlb3BsZSBjb25zaWRlciBzaWduZWQgaW50ZWdlcnMgaGFybWZ1bCwgYXMg
dGhleSBtYXkgYmUgY29udmVydGVkCj4gc2lsZW50bHkgYnkgdGhlIGNvbXBpbGVyIHRvIHRoZSAi
bGFyZ2VyIiB1bnNpZ25lZCB0eXBlIHdoZW4gbmVlZGVkLgoKV293LCBpdCBzb3VuZHMgY3Jhenks
IHNoYWxsIHdlIGV4cGVjdCBnaWdhbnRpYyBwYXRjaHNldHMsIGNvbnZlcnRpbmcgYWxsCm9jY3Vy
cmVuY2VzIG9mIGludCB0byAidW5zaWduZWQgaW50IiA/IDopCkkga25vdyBib3RoIHR5cGVzIGhh
dmUgdGhlaXIgcHJvcyBhbmQgY29ucyBhbmQgY2FuIGJlaGF2ZSB1bmV4cGVjdGVkbHkKaW4gY29y
bmVyIGNhc2VzLCBidXQgSSBkbyBub3Qgc2VlIHdoeSB1bnNpZ25lZCBzaG91bGQgYmUgcHJlZmVy
cmVkIG92ZXIKc2lnbmVkIGluIGdlbmVyYWwsIG9yIGluIHRoaXMgcGFydGljdWxhciBjYXNlLgpJ
IGd1ZXNzIHRoZXJlIHdlcmUgc29tZXdoZXJlIGRpc2N1c3Npb24gYWJvdXQgaXQsIGNvdWxkIHlv
dSBwb2ludCBtZSB0bwppdCBpZiBwb3NzaWJsZSwgdG8gYXZvaWQgdW5uZWNlc3Nhcnkgbm9pc2Ug
aW4gdGhpcyB0aHJlYWQuCgpSZWdhcmRzCkFuZHJ6ZWoKCj4KPiBHcntvZXRqZSxlZXRpbmd9cywK
Pgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
