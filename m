From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 0/4] media: sun6i: Add support for the H3 CSI controller
Date: Tue, 26 Jun 2018 14:42:11 +0530
Message-ID: <CAMty3ZBRYtTBiYjQNZj07Ni_bi6qH+L1xga_kcHVrW0tZ0-hLQ@mail.gmail.com>
References: <20180305100432.15009-1-maxime.ripard@bootlin.com>
 <CAMty3ZBQXyvOnzy_9RLDW-QO9qnAC4SR5UJnWYmhiPrP23z_vg@mail.gmail.com>
 <20180626082330.pvq3gi6mmokky5vl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180626082330.pvq3gi6mmokky5vl@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mylene Josserand <mylene.josserand@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMTo1MyBQTSwgTWF4aW1lIFJpcGFyZAo8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4gSGksCj4KPiBPbiBUdWUsIEp1biAyNiwgMjAxOCBh
dCAxMTo0MTo1NkFNICswNTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+PiBPbiBNb24sIE1hciA1LCAy
MDE4IGF0IDM6MzQgUE0sIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+
IHdyb3RlOgo+PiA+IFRoZSBIMyBhbmQgSDUgaGF2ZSBhIENTSSBjb250cm9sbGVyIGJhc2VkIG9u
IHRoZSBvbmUgcHJldmlvdXNseSBmb3VuZAo+PiA+IGluIHRoZSBBMzEsIHRoYXQgaXMgY3VycmVu
dGx5IHN1cHBvcnRlZCBieSB0aGUgc3VuNmktY3NpIGRyaXZlci4KPj4gPgo+PiA+IEFkZCB0aGUg
Y29tcGF0aWJsZXMgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGFuZCB0byB0aGUgZHJpdmVy
IHRvCj4+ID4gbWFrZSBpdCB3b3JrIHByb3Blcmx5Lgo+PiA+Cj4+ID4gVGhpcyBvYnZpb3VzbHkg
ZGVwZW5kcyBvbiB0aGUgc2VyaWUgIkluaXRpYWwgQWxsd2lubmVyIFYzcyBDU0kKPj4gPiBTdXBw
b3J0IiBieSBZb25nIERlbmcuCj4+ID4KPj4gPiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluaywK
Pj4gPiBNYXhpbWUKPj4gPgo+PiA+IE1heGltZSBSaXBhcmQgKDIpOgo+PiA+ICAgZHQtYmluZGlu
Z3M6IG1lZGlhOiBzdW42aTogQWRkIEEzMSBhbmQgSDMgY29tcGF0aWJsZXMKPj4gPiAgIG1lZGlh
OiBzdW42aTogQWRkIEEzMSBjb21wYXRpYmxlCj4+ID4KPj4gPiBNeWzDqG5lIEpvc3NlcmFuZCAo
Mik6Cj4+ID4gICBBUk06IGR0czogc3VuOGk6IEFkZCB0aGUgSDMvSDUgQ1NJIGNvbnRyb2xsZXIK
Pj4gPiAgIFtETyBOT1QgTUVSR0VdIEFSTTogZHRzOiBzdW44aTogQWRkIENBTTUwMEIgY2FtZXJh
IG1vZHVsZSB0byB0aGUgTmFubwo+PiA+ICAgICBQaSBNMSsKPj4KPj4gSnVzdCB0cnlpbmcgdG8g
dW5kZXJzdGFuZCB3aGF0IGludGVyZmFjZSBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBucGktbTErLAo+
PiBpcyBpdCBEVlAgKHBhcmFsbGVsKSBpbnRlcmZhY2U/Cj4KPiBZZXMKPgo+PiBJJ3ZlIEJhbmFu
YXBpIDVNUFsxXSBhbmQgdHJ5aW5nIHRvIHRlc3Qgb24gdG9wLCBhbmQgbG9vayBsaWtlIGl0cwo+
PiBNSVBJIENTSTIuIEkgZ3Vlc3MgWW9uZyBwYXRjaFsyXSBkb2Vzbid0IHN1cHBvcnQgQ1NJMiB5
ZXQsIGFtIEkKPj4gY29ycmVjdD8KPgo+IFRoaXMgaXMgd2hhdCBZb25nJ3MgY292ZXIgbGV0dGVy
IGlzIHNheWluZyB5ZXMgOikKClRoYW5rcywgYW5kIHRoaXMgb3Y1NjQwIHRlc3RlZCBvbiAtbmV4
dCBvciBhbnkgc3BlY2lmaWMgY29kZT8gcGxlYXNlCnByb3ZpZGUgaWYgeW91IGhhdmUgZGlmZmVy
ZW50IGNvZGUgYmFzZS4KCkphZ2FuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
