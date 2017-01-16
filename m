From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 11/11] drm/rockchip/dsi: fix insufficient bandwidth of some
 panel
Date: Mon, 16 Jan 2017 18:08:31 +0800
Message-ID: <1484561311-494-12-git-send-email-zyw@rock-chips.com>
References: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2V0IHRoZSBsYW5lcyBicHMgdG8gMSAvIDAuOSB0aW1lcyBvZiBwY2xrLCB0aGUgbWFyZ2luIGlz
IG5vdCBlbm91Z2gKZm9yIHNvbWUgcGFuZWwsIGl0IHdpbGwgY2F1c2UgdGhlIHNjcmVlbiBkaXNw
bGF5IGlzIG5vdCBub3JtYWwsIHNvCmluY3JlYXNlcyB0aGUgYmFkbndpZHRoIHRvIDEgLyAwLjgu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBaaG9uZyA8enl3QHJvY2stY2hpcHMuY29tPgoKLS0tCgog
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvZHctbWlwaS1kc2kuYwppbmRleCA5ZGZhNzNkLi41YTk3M2ZlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvZHctbWlwaS1kc2kuYwpAQCAtNTAxLDggKzUwMSw4IEBAIHN0YXRpYyBpbnQg
ZHdfbWlwaV9kc2lfZ2V0X2xhbmVfYnBzKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQogCiAJbXBj
bGsgPSBESVZfUk9VTkRfVVAoZHNpLT5tb2RlLT5jbG9jaywgTVNFQ19QRVJfU0VDKTsKIAlpZiAo
bXBjbGspIHsKLQkJLyogdGFrZSAxIC8gMC45LCBzaW5jZSBtYnBzIG11c3QgYmlnIHRoYW4gYmFu
ZHdpZHRoIG9mIFJHQiAqLwotCQl0bXAgPSBtcGNsayAqIChicHAgLyBkc2ktPmxhbmVzKSAqIDEw
IC8gOTsKKwkJLyogdGFrZSAxIC8gMC44LCBzaW5jZSBtYnBzIG11c3QgYmlnIHRoYW4gYmFuZHdp
ZHRoIG9mIFJHQiAqLworCQl0bXAgPSBtcGNsayAqIChicHAgLyBkc2ktPmxhbmVzKSAqIDEwIC8g
ODsKIAkJaWYgKHRtcCA8IG1heF9tYnBzKQogCQkJdGFyZ2V0X21icHMgPSB0bXA7CiAJCWVsc2UK
LS0gCjIuNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
