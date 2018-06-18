From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 3/8] drm/bridge/synopsys: dsi: defer probing if panel not
 available in bridge-attach
Date: Mon, 18 Jun 2018 12:28:01 +0200
Message-ID: <20180618102806.15650-4-heiko@sntech.de>
References: <20180618102806.15650-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180618102806.15650-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, briannorris@chromium.org, hoegsberg@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com, linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com, robh+dt@kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, mka@chromium.org
List-Id: devicetree@vger.kernel.org

V2hlbiB0aGUgcGFuZWwtZHJpdmVyIGlzIGJ1aWxkIGFzIGEgbW9kdWxlIGl0IGN1cnJlbnRseSBm
YWlscyBoYXJkIGFzIHRoZQpwYW5lbCBjYW5ub3QgYmUgcHJvYmVkIGRpcmVjdGx5OgoKZHdfbWlw
aV9kc2lfYmluZCgpCiAgX19kd19taXBpX2RzaV9wcm9iZSgpCiAgICBjcmVhdGVzIGRzaSBidXMK
ICAgIGNyZWF0ZXMgcGFuZWwgZGV2aWNlCiAgICB0cmlnZ2VycyBwYW5lbCBtb2R1bGUgbG9hZAog
ICAgcGFuZWwgbm90IHByb2JlZCAobW9kdWxlIG5vdCBsb2FkZWQgb3IgcGFuZWwgcHJvYmUgc2xv
dykKICBkcm1fYnJpZGdlX2F0dGFjaAogICAgZmFpbHMgd2l0aCAtRUlOVkFMIGR1ZSB0byBlbXB0
eSBwYW5lbF9icmlkZ2UKClNvIGVtaXQgYSAtRVBST0JFX0RFRkVSIGluIHRoYXQgY2FzZSB0byBn
aXZlIHRoZSBkcml2ZXIgYW5vdGhlcgpjaGFuY2UgYXQgZ2V0dGluZyB0aGUgZGlzcGxheSBsYXRl
ci4KClNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgMyArKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKaW5kZXggYmI0YWVjYTVjMGY5Li5iZDUwM2YwMDBlZDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2ku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKQEAg
LTgzNSw2ICs4MzUsOSBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX2JyaWRnZV9hdHRhY2goc3Ry
dWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAkJcmV0dXJuIC1FTk9ERVY7CiAJfQogCisJaWYgKCFk
c2ktPnBhbmVsX2JyaWRnZSkKKwkJcmV0dXJuIC1FUFJPQkVfREVGRVI7CisKIAkvKiBTZXQgdGhl
IGVuY29kZXIgdHlwZSBhcyBjYWxsZXIgZG9lcyBub3Qga25vdyBpdCAqLwogCWJyaWRnZS0+ZW5j
b2Rlci0+ZW5jb2Rlcl90eXBlID0gRFJNX01PREVfRU5DT0RFUl9EU0k7CiAKLS0gCjIuMTcuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
