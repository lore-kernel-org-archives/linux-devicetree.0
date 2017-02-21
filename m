From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [RESEND PATCH v7 6/7] drm/rockchip/dsi: fix insufficient
 bandwidth of some panel
Date: Tue, 21 Feb 2017 10:40:10 -0500
Message-ID: <20170221154010.GB25168@art_vandelay>
References: <1487577744-2855-1-git-send-email-zyw@rock-chips.com>
 <1487577744-2855-7-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1487577744-2855-7-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, yzq@rock-chips.com, linux-kernel@vger.kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org, tfiga@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBGZWIgMjAsIDIwMTcgYXQgMDQ6MDI6MjJQTSArMDgwMCwgQ2hyaXMgWmhvbmcgd3Jv
dGU6Cj4gU2V0IHRoZSBsYW5lcyBicHMgdG8gMSAvIDAuOSB0aW1lcyBvZiBwY2xrLCB0aGUgbWFy
Z2luIGlzIG5vdCBlbm91Z2gKPiBmb3Igc29tZSBwYW5lbCwgaXQgd2lsbCBjYXVzZSB0aGUgc2Ny
ZWVuIGRpc3BsYXkgaXMgbm90IG5vcm1hbCwgc28KPiBpbmNyZWFzZXMgdGhlIGJhZG53aWR0aCB0
byAxIC8gMC44Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFpob25nIDx6eXdAcm9jay1jaGlw
cy5jb20+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cgo+
IC0tLQo+IAo+IENoYW5nZXMgaW4gdjY6IE5vbmUKPiBDaGFuZ2VzIGluIHY1OiBOb25lCj4gQ2hh
bmdlcyBpbiB2NDogTm9uZQo+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiAKPiAgZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
ZHctbWlwaS1kc2kuYwo+IGluZGV4IGMyZDc2NzQuLmE2NTMzODQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvZHctbWlwaS1kc2kuYwo+IEBAIC01MzIsOCArNTMyLDggQEAgc3RhdGljIGlu
dCBkd19taXBpX2RzaV9nZXRfbGFuZV9icHMoc3RydWN0IGR3X21pcGlfZHNpICpkc2ksCj4gIAo+
ICAJbXBjbGsgPSBESVZfUk9VTkRfVVAobW9kZS0+Y2xvY2ssIE1TRUNfUEVSX1NFQyk7Cj4gIAlp
ZiAobXBjbGspIHsKPiAtCQkvKiB0YWtlIDEgLyAwLjksIHNpbmNlIG1icHMgbXVzdCBiaWcgdGhh
biBiYW5kd2lkdGggb2YgUkdCICovCj4gLQkJdG1wID0gbXBjbGsgKiAoYnBwIC8gZHNpLT5sYW5l
cykgKiAxMCAvIDk7Cj4gKwkJLyogdGFrZSAxIC8gMC44LCBzaW5jZSBtYnBzIG11c3QgYmlnIHRo
YW4gYmFuZHdpZHRoIG9mIFJHQiAqLwo+ICsJCXRtcCA9IG1wY2xrICogKGJwcCAvIGRzaS0+bGFu
ZXMpICogMTAgLyA4Owo+ICAJCWlmICh0bXAgPCBtYXhfbWJwcykKPiAgCQkJdGFyZ2V0X21icHMg
PSB0bXA7Cj4gIAkJZWxzZQo+IC0tIAo+IDIuNi4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
