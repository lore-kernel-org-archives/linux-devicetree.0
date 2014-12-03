From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Wed, 3 Dec 2014 16:11:22 +0000
Message-ID: <20141203161122.GF11285@n2100.arm.linux.org.uk>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <547F3495.9070206@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgMDQsIDIwMTQgYXQgMTI6MDQ6MzdBTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6
Cj4gSGkgUnVzc2VsbDoKPiAKPiBPbiAyMDE05bm0MTLmnIgwM+aXpSAyMzozOCwgUnVzc2VsbCBL
aW5nIC0gQVJNIExpbnV4IHdyb3RlOgo+ID5PbiBXZWQsIERlYyAwMywgMjAxNCBhdCAxMToyOToy
NlBNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPiA+PitpbnQgaW14X2hkbWlfYmluZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPiA+PisJCSAgdm9pZCAqZGF0YSwg
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ID4+KwkJICBjb25zdCBzdHJ1Y3QgaW14X2hk
bWlfcGxhdF9kYXRhICpwbGF0X2RhdGEpCj4gPj4gIHsKPiA+PiAgCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKPiA+Pi0JY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCAqb2ZfaWQgPQo+ID4+LQkJCQlvZl9tYXRjaF9kZXZpY2UoaW14X2hkbWlf
ZHRfaWRzLCBkZXYpOwo+ID4+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRhdGE7Cj4gPj4g
IAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+ID4+ICAJc3RydWN0IGRl
dmljZV9ub2RlICpkZGNfbm9kZTsKPiA+PkBAIC0xNTk0LDE5ICsxNTY2LDE2IEBAIHN0YXRpYyBp
bnQgaW14X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rl
ciwgdm9pZCAqZGF0YSkKPiA+PiAgCXN0cnVjdCByZXNvdXJjZSAqaW9yZXM7Cj4gPj4gIAlpbnQg
cmV0LCBpcnE7Cj4gPj4tCWhkbWkgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmhkbWkpLCBH
RlBfS0VSTkVMKTsKPiA+PisJaGRtaSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2Yo
KmhkbWkpLCBHRlBfS0VSTkVMKTsKPiA+PiAgCWlmICghaGRtaSkKPiA+PiAgCQlyZXR1cm4gLUVO
T01FTTsKPiA+Pi0JaGRtaS0+ZGV2ID0gZGV2Owo+ID4+KwloZG1pLT5wbGF0X2RhdGEgPSBwbGF0
X2RhdGE7Cj4gPj4rCWhkbWktPmRldiA9ICZwZGV2LT5kZXY7Cj4gPj4rCWhkbWktPmRldl90eXBl
ID0gcGxhdF9kYXRhLT5kZXZfdHlwZTsKPiA+PiAgCWhkbWktPnNhbXBsZV9yYXRlID0gNDgwMDA7
Cj4gPj4gIAloZG1pLT5yYXRpbyA9IDEwMDsKPiA+Pi0KPiA+Pi0JaWYgKG9mX2lkKSB7Cj4gPj4t
CQljb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkICpkZXZpY2VfaWQgPSBvZl9pZC0+ZGF0
YTsKPiA+Pi0KPiA+Pi0JCWhkbWktPmRldl90eXBlID0gZGV2aWNlX2lkLT5kcml2ZXJfZGF0YTsK
PiA+Pi0JfQo+ID4+KwloZG1pLT5lbmNvZGVyID0gZW5jb2RlcjsKPiA+SSdkIHN1Z2dlc3QgY2hh
bmdpbmcgaW14X2hkbWlfYmluZCgpIHRvIHRha2UgdGhlIHN0cnVjdCByZXNvdXJjZSBhbmQgaXJx
Cj4gPm51bWJlciwgYW5kIGF2b2lkaW5nIHRoZSBwbGF0Zm9ybSBkZXZpY2Ugc3R1ZmYgYWx0b2dl
dGhlciBpbiBoZXJlLgo+ID4KPiAgICBBY3R1YWxseSB0aGlzIGlzIHdoYXQgdGhlIGN1cnJlbnQg
Y29kZSBkbzogdGhlIHJlc291cmNlIGFuZCBpcnEgbnVtYmVyCj4gYXJlIGFsbCBoYW5kbGVkIGlu
IGlteF9oZG1pX2JpbmQKCkkgbWVhbnQgdGhhdCBpbXhfaGRtaV9iaW5kIHNob3VsZCBiZSBwYXNz
ZWQgdGhlc2UsIHNvIHRoYXQgaXQgbmVlZHMgdG8Ka25vdyBub3RoaW5nIGFib3V0IHRoZSBzdHJ1
Y3QgZGV2aWNlIGJleW9uZCB0aGUgZ2VuZXJpYyBkZXZpY2Ugc3RydWN0dXJlLgpJbiBvdGhlciB3
b3JkcywgdGhlIGR3LWhkbWkgY29yZSBzaG91bGQgbm90IGFzc3VtZSB0aGF0IHRoZSBzdHJ1Y3Qg
ZGV2aWNlCmlzIHBhcnQgb2YgYSBwbGF0Zm9ybSBkZXZpY2UuCgotLSAKRlRUQyBicm9hZGJhbmQg
Zm9yIDAuOG1pbGUgbGluZTogY3VycmVudGx5IGF0IDkuNU1icHMgZG93biA0MDBrYnBzIHVwCmFj
Y29yZGluZyB0byBzcGVlZHRlc3QubmV0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9q
ZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK
