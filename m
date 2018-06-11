From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 24/28] drm/mediatek: add DSI2 support for mutex
Date: Mon, 11 Jun 2018 11:26:16 +0800
Message-ID: <1528687580-549-25-git-send-email-stu.hsieh@mediatek.com>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGQgdGhlIERTSTIgc3VwcG9ydCBmb3IgbXV0ZXgKClNpZ25lZC1vZmYtYnk6
IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDU5MTZm
YzExNjkzYS4uMWU3ZTM4NzJlY2NjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYwpAQCAtNzcsNiArNzcsNyBAQAogI2RlZmluZSBNVVRFWF9TT0ZfRFNJMQkJCTIKICNkZWZp
bmUgTVVURVhfU09GX0RQSTAJCQkzCiAjZGVmaW5lIE1VVEVYX1NPRl9EUEkxCQkJNAorI2RlZmlu
ZSBNVVRFWF9TT0ZfRFNJMgkJCTUKIAogI2RlZmluZSBPVkwwX01PVVRfRU5fQ09MT1IwCQkweDEK
ICNkZWZpbmUgT0RfTU9VVF9FTl9SRE1BMAkJMHgxCkBAIC0zODMsNiArMzg0LDkgQEAgdm9pZCBt
dGtfZGlzcF9tdXRleF9hZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAogCWNh
c2UgRERQX0NPTVBPTkVOVF9EU0kxOgogCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMDsKIAkJYnJlYWs7
CisJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTI6CisJCXJlZyA9IE1VVEVYX1NPRl9EU0kyOworCQli
cmVhazsKIAljYXNlIEREUF9DT01QT05FTlRfRFBJMDoKIAkJcmVnID0gTVVURVhfU09GX0RQSTA7
CiAJCWJyZWFrOwpAQCAtNDIwLDYgKzQyNCw3IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfcmVtb3Zl
X2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAlzd2l0Y2ggKGlkKSB7CiAJY2Fz
ZSBERFBfQ09NUE9ORU5UX0RTSTA6CiAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTE6CisJY2FzZSBE
RFBfQ09NUE9ORU5UX0RTSTI6CiAJY2FzZSBERFBfQ09NUE9ORU5UX0RQSTA6CiAJY2FzZSBERFBf
Q09NUE9ORU5UX0RQSTE6CiAJCXdyaXRlbF9yZWxheGVkKE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwK
LS0gCjIuMTIuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
