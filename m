From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH v3 1/8] drm/sun4i: tcon: Pass encoder to RGB setup function
Date: Wed,  7 Nov 2018 19:18:36 +0100
Message-ID: <20181107181843.27628-2-contact@paulk.fr>
References: <20181107181843.27628-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181107181843.27628-1-contact@paulk.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mark Van den Borre <mark@fosdem.org>, Gerry Demaret <gerry@fosdem.org>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

UGFzc2luZyB0aGUgZW5jb2RlciB0byB0aGUgVENPTiBSR0Igc2V0dXAgZnVuY3Rpb25zIGFsbG93
cyBhY2Nlc3NpbmcgdGhlCmNvbm5lY3RvciBmcm9tIHRoZSBlbmNvZGVyIGRpcmVjdGx5IGluc3Rl
YWQgb2YgcmVseWluZyBvbiB0aGUgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtv
d3NraSA8Y29udGFjdEBwYXVsay5mcj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlf
dGNvbi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRleCBmOTQ5Mjg3ZDkyNmMuLjVl
MWY3NjJmYzNkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBAIC00NzgsNiArNDc4
LDcgQEAgc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRfbHZkcyhzdHJ1Y3Qgc3VuNGlf
dGNvbiAqdGNvbiwKIH0KIAogc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRfcmdiKHN0
cnVjdCBzdW40aV90Y29uICp0Y29uLAorCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyLAogCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUp
CiB7CiAJdW5zaWduZWQgaW50IGJwLCBoc3luYywgdnN5bmM7CkBAIC02ODQsNyArNjg1LDcgQEAg
dm9pZCBzdW40aV90Y29uX21vZGVfc2V0KHN0cnVjdCBzdW40aV90Y29uICp0Y29uLAogCQlzdW40
aV90Y29uMF9tb2RlX3NldF9sdmRzKHRjb24sIGVuY29kZXIsIG1vZGUpOwogCQlicmVhazsKIAlj
YXNlIERSTV9NT0RFX0VOQ09ERVJfTk9ORToKLQkJc3VuNGlfdGNvbjBfbW9kZV9zZXRfcmdiKHRj
b24sIG1vZGUpOworCQlzdW40aV90Y29uMF9tb2RlX3NldF9yZ2IodGNvbiwgZW5jb2RlciwgbW9k
ZSk7CiAJCXN1bjRpX3Rjb25fc2V0X211eCh0Y29uLCAwLCBlbmNvZGVyKTsKIAkJYnJlYWs7CiAJ
Y2FzZSBEUk1fTU9ERV9FTkNPREVSX1RWREFDOgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
