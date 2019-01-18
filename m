From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 05/10] phy: add A3700 UTMI PHY driver
Date: Fri, 18 Jan 2019 17:36:36 +0100
Message-ID: <87zhrxly7f.fsf@FE-laptop>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-6-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190111133133.24803-6-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Fri, 11 Jan 2019 14:31:28 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Igal Liberman <igall@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWlxdWVsLAoKSSBoYXZlIG9ubHkgYSBmZXcgc21hbGxpc2ggcmVtYXJrczoKCiBPbiB2ZW4u
LCBqYW52LiAxMSAyMDE5LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PiB3cm90ZToKCj4gTWFydmVsbCBBcm1hZGEgMzcwMCBTb0MgaGFzIHR3byBVU0IgY29udHJvbGxl
cnMsIGVhY2ggb2YgdGhlbSBiZWluZwo+IHdpcmVkIHRvIGFuIGludGVybmFsIFVUTUkgUEhZLiBB
ZGQgYSBkcml2ZXIgdG8gY29udHJvbCB0aGVtLgo+Cj4gSWdhbCBMaWJlcm1hbiB3b3JrZWQgb24g
c3VwcG9ydGluZyB0aGUgUEhZLCBJIHRvb2sgdGhlIHdoaWxlICdyZWdpc3Rlcgo+IGNvbmZpZ3Vy
YXRpb24nIGZyb20gaGlzIHdvcmsgYW5kIHJld3JvdGUgYWxtb3N0IGVudGlyZWx5IHRoZQo+IGRy
aXZlci9iaW5kaW5ncyBhcm91bmQgaXQuCj4KPiBDby1kZXZlbG9wZWQtYnk6IElnYWwgTGliZXJt
YW4gPGlnYWxsQG1hcnZlbGwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWdhbCBMaWJlcm1hbiA8
aWdhbGxAbWFydmVsbC5jb20+Cj4gLS0tClsuLi5dCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bo
eS9tYXJ2ZWxsL3BoeS1tdmVidS1hMzcwMC11dG1pLmMgYi9kcml2ZXJzL3BoeS9tYXJ2ZWxsL3Bo
eS1tdmVidS1hMzcwMC11dG1pLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uOTdkODIzNWQ2NjFkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcGh5
L21hcnZlbGwvcGh5LW12ZWJ1LWEzNzAwLXV0bWkuYwo+IEBAIC0wLDAgKzEsMjk3IEBACj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdodCAo
QykgMjAxOCBNYXJ2ZWxsCj4gKyAqCj4gKyAqIEF1dGhvcnM6Cj4gKyAqICAgRXZhbiBXYW5nIDx4
c3dhbmdAbWFydmVsbC5jb20+Cj4gKyAqICAgTWlxdcOobCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CgpJZiBpdCBpcyBjby1kZXZlbG9wZWQgd2l0aCBJZ2FsIExpYmVybWFuLCBz
aG91bGRuJ3QgYmUgYWRkZWQgaGVyZSB0b28/ClsuLi5dCgo+ICtzdGF0aWMgaW50IG12ZWJ1X2Ez
NzAwX3V0bWlfcGh5X3Bvd2VyX29uKHN0cnVjdCBwaHkgKnBoeSkKPiArewo+ICsJc3RydWN0IG12
ZWJ1X2EzNzAwX3V0bWkgKnV0bWkgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsKPiArCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwaHktPmRldjsKPiArCWludCB1c2IzMiA9IHV0bWktPmNhcHMtPnVzYjMy
Owo+ICsJaW50IHJldCA9IDA7Cj4gKwl1MzIgcmVnOwo+ICsKPiArCWlmICghdXRtaSkKPiArCQly
ZXR1cm4gLUVOT0RFVjsKPiArCj4gKwkvKgo+ICsJICogU2V0dXAgUExMLiA0ME1IeiBjbG9jayB1
c2VkIHRvIGJlIHRoZSBkZWZhdWx0LCBiZWluIDI1TUh6IG5vdy4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJlaW4/Cj4gKwkgKiBTZWUg
IlBMTCBTZXR0aW5ncyBmb3IgVHlwaWNhbCBSRUZDTEsiIHRhYmxlLgoKWy4uLl0KCj4gKwo+ICsJ
LyogV2FpdCBmb3Igc3F1ZXRjaCBjYWxpYnJhdGlvbiAqLwogICAgICAgICAgICAgICAgICAgIHNx
dWV0Y2g/CgpHcmVnb3J5CgotLSAKR3JlZ29yeSBDbGVtZW50LCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cDovL2Jvb3RsaW4uY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
