From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v11 10/12] drm/mediatek: add non-continuous clock mode and EOT
 packet control
Date: Wed, 11 Jan 2017 14:51:11 +0800
Message-ID: <1484117473-46644-11-git-send-email-yt.shen@mediatek.com>
References: <1484117473-46644-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484117473-46644-1-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCB3aWxsIHVwZGF0ZSBkc2kgY2xvY2sgY29udHJvbCBtZXRob2QuCjEuIGRzaSBu
b24tY29udGludWUgY2xvY2sgbW9kZSB3aWxsIGVuaGFuY2UgYW50aXN0YXRpYyBlZmZlY3QgZm9y
IHBhbmVsCjIuIEVPVCBwYWNrZXQgY29udHJvbCB3aWxsIGp1ZGdlIHdoZXRoZXIgZHNpIHNlbmQg
ZW5kIG9mIHBhY2tldCBvciBub3QKYnkgY3VzdG9taXplCgpTaWduZWQtb2ZmLWJ5OiBzaGFvbWlu
ZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVrLmNvbT4KU2lnbmVkLW9mZi1ieTogWVQgU2hl
biA8eXQuc2hlbkBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMKaW5kZXggYjNjN2ZkOC4uODVmMjJkMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC00MzEsNiArNDMxLDkgQEAgc3RhdGljIHZvaWQgbXRrX2Rz
aV9yeHR4X2NvbnRyb2woc3RydWN0IG10a19kc2kgKmRzaSkKIAkJYnJlYWs7CiAJfQogCisJdG1w
X3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfQ0xPQ0tfTk9OX0NPTlRJTlVPVVMp
IDw8IDY7CisJdG1wX3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9FT1Rf
UEFDS0VUKSA+PiAzOworCiAJd3JpdGVsKHRtcF9yZWcsIGRzaS0+cmVncyArIERTSV9UWFJYX0NU
UkwpOwogfQogCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
