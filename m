From: Chris Zhong <zyw@rock-chips.com>
Subject: [RESEND PATCH v7 6/7] drm/rockchip/dsi: fix insufficient bandwidth of
 some panel
Date: Mon, 20 Feb 2017 16:02:22 +0800
Message-ID: <1487577744-2855-7-git-send-email-zyw@rock-chips.com>
References: <1487577744-2855-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1487577744-2855-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: john@metanate.com, dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2V0IHRoZSBsYW5lcyBicHMgdG8gMSAvIDAuOSB0aW1lcyBvZiBwY2xrLCB0aGUgbWFyZ2luIGlz
IG5vdCBlbm91Z2gKZm9yIHNvbWUgcGFuZWwsIGl0IHdpbGwgY2F1c2UgdGhlIHNjcmVlbiBkaXNw
bGF5IGlzIG5vdCBub3JtYWwsIHNvCmluY3JlYXNlcyB0aGUgYmFkbndpZHRoIHRvIDEgLyAwLjgu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBaaG9uZyA8enl3QHJvY2stY2hpcHMuY29tPgotLS0KCkNo
YW5nZXMgaW4gdjY6IE5vbmUKQ2hhbmdlcyBpbiB2NTogTm9uZQpDaGFuZ2VzIGluIHY0OiBOb25l
CkNoYW5nZXMgaW4gdjM6IE5vbmUKCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1k
c2kuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ku
YyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5jCmluZGV4IGMyZDc2NzQu
LmE2NTMzODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRz
aS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5jCkBAIC01MzIs
OCArNTMyLDggQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9nZXRfbGFuZV9icHMoc3RydWN0IGR3
X21pcGlfZHNpICpkc2ksCiAKIAltcGNsayA9IERJVl9ST1VORF9VUChtb2RlLT5jbG9jaywgTVNF
Q19QRVJfU0VDKTsKIAlpZiAobXBjbGspIHsKLQkJLyogdGFrZSAxIC8gMC45LCBzaW5jZSBtYnBz
IG11c3QgYmlnIHRoYW4gYmFuZHdpZHRoIG9mIFJHQiAqLwotCQl0bXAgPSBtcGNsayAqIChicHAg
LyBkc2ktPmxhbmVzKSAqIDEwIC8gOTsKKwkJLyogdGFrZSAxIC8gMC44LCBzaW5jZSBtYnBzIG11
c3QgYmlnIHRoYW4gYmFuZHdpZHRoIG9mIFJHQiAqLworCQl0bXAgPSBtcGNsayAqIChicHAgLyBk
c2ktPmxhbmVzKSAqIDEwIC8gODsKIAkJaWYgKHRtcCA8IG1heF9tYnBzKQogCQkJdGFyZ2V0X21i
cHMgPSB0bXA7CiAJCWVsc2UKLS0gCjIuNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
