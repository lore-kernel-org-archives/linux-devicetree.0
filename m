From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Wed, 03 Dec 2014 17:20:15 +0100
Message-ID: <1417623615.5124.19.camel@pengutronix.de>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mento
List-Id: devicetree@vger.kernel.org

SGkgQW5keSwKCkFtIERvbm5lcnN0YWcsIGRlbiAwNC4xMi4yMDE0LCAwMDowNCArMDgwMCBzY2hy
aWViIEFuZHkgWWFuOgo+IE9uIDIwMTTlubQxMuaciDAz5pelIDIzOjM4LCBSdXNzZWxsIEtpbmcg
LSBBUk0gTGludXggd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAwMywgMjAxNCBhdCAxMToyOToyNlBN
ICswODAwLCBBbmR5IFlhbiB3cm90ZToKPiA+PiAraW50IGlteF9oZG1pX2JpbmQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gPj4gKwkJICB2b2lkICpkYXRhLCBz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gPj4gKwkJICBjb25zdCBzdHJ1Y3QgaW14X2hk
bWlfcGxhdF9kYXRhICpwbGF0X2RhdGEpCj4gPj4gICB7Cj4gPj4gICAJc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwo+ID4+IC0JY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCAqb2ZfaWQgPQo+ID4+IC0JCQkJb2ZfbWF0Y2hfZGV2aWNlKGlteF9o
ZG1pX2R0X2lkcywgZGV2KTsKPiA+PiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGF0YTsK
PiA+PiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+ID4+ICAgCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqZGRjX25vZGU7Cj4gPj4gQEAgLTE1OTQsMTkgKzE1NjYsMTYgQEAg
c3RhdGljIGludCBpbXhfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ID4+ICAgCXN0cnVjdCByZXNvdXJjZSAqaW9yZXM7Cj4g
Pj4gICAJaW50IHJldCwgaXJxOwo+ID4+ICAgCj4gPj4gLQloZG1pID0gZGV2bV9remFsbG9jKGRl
diwgc2l6ZW9mKCpoZG1pKSwgR0ZQX0tFUk5FTCk7Cj4gPj4gKwloZG1pID0gZGV2bV9remFsbG9j
KCZwZGV2LT5kZXYsIHNpemVvZigqaGRtaSksIEdGUF9LRVJORUwpOwo+ID4+ICAgCWlmICghaGRt
aSkKPiA+PiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gPj4gICAKPiA+PiAtCWhkbWktPmRldiA9IGRl
djsKPiA+PiArCWhkbWktPnBsYXRfZGF0YSA9IHBsYXRfZGF0YTsKPiA+PiArCWhkbWktPmRldiA9
ICZwZGV2LT5kZXY7Cj4gPj4gKwloZG1pLT5kZXZfdHlwZSA9IHBsYXRfZGF0YS0+ZGV2X3R5cGU7
Cj4gPj4gICAJaGRtaS0+c2FtcGxlX3JhdGUgPSA0ODAwMDsKPiA+PiAgIAloZG1pLT5yYXRpbyA9
IDEwMDsKPiA+PiAtCj4gPj4gLQlpZiAob2ZfaWQpIHsKPiA+PiAtCQljb25zdCBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlX2lkICpkZXZpY2VfaWQgPSBvZl9pZC0+ZGF0YTsKPiA+PiAtCj4gPj4gLQkJ
aGRtaS0+ZGV2X3R5cGUgPSBkZXZpY2VfaWQtPmRyaXZlcl9kYXRhOwo+ID4+IC0JfQo+ID4+ICsJ
aGRtaS0+ZW5jb2RlciA9IGVuY29kZXI7Cj4gPiBJJ2Qgc3VnZ2VzdCBjaGFuZ2luZyBpbXhfaGRt
aV9iaW5kKCkgdG8gdGFrZSB0aGUgc3RydWN0IHJlc291cmNlIGFuZCBpcnEKPiA+IG51bWJlciwg
YW5kIGF2b2lkaW5nIHRoZSBwbGF0Zm9ybSBkZXZpY2Ugc3R1ZmYgYWx0b2dldGhlciBpbiBoZXJl
Lgo+ID4KPiAgICAgQWN0dWFsbHkgdGhpcyBpcyB3aGF0IHRoZSBjdXJyZW50IGNvZGUgZG86IHRo
ZSByZXNvdXJjZSBhbmQgaXJxIG51bWJlcgo+IGFyZSBhbGwgaGFuZGxlZCBpbiBpbXhfaGRtaV9i
aW5kCgpJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhlIGJpbmQgZnVuY3Rpb24gd291bGQgbm90IGhh
dmUgdG8gY2FyZSBhYm91dApwbGF0Zm9ybSByZXNvdXJjZXMsIHRoYXQgc2hvdWxkIGJlIGhhbmRs
ZWQgaW4gdGhlIHByb2JlIGZ1bmN0aW9uLiBJIGhhZAphIHBhdGNoIHRvIG1vdmUgdGhlbToKCmh0
dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTQtTWF5LzA1
OTYzMC5odG1sCgpNYXliZSB5b3UgY291bGQgaW5jb3Jwb3JhdGUgc29tZXRoaW5nIGxpa2UgdGhp
cz8KCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5v
cmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpdmVyZGV2LWRldmVsCg==
