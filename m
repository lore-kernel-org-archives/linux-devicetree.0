From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v6 11/29] drm/mediatek: add connection from OD1 to RDMA1
Date: Tue, 19 Jun 2018 15:34:12 +0800
Message-ID: <1529393670-26862-12-git-send-email-stu.hsieh@mediatek.com>
References: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIGNvbm5lY3Rpb24gZnJvbSBPRDEgdG8gUkRNQTEgZm9yIGV4dCBw
YXRoLgoKU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgpS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggNThl
NDQzNDllMzE1Li44YmZjMGRlYmQyYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jCkBAIC03NSw2ICs3NSw3IEBACiAKICNkZWZpbmUgT1ZMMF9NT1VUX0VOX0NPTE9SMAkJ
MHgxCiAjZGVmaW5lIE9EX01PVVRfRU5fUkRNQTAJCTB4MQorI2RlZmluZSBPRDFfTU9VVF9FTl9S
RE1BMQkJQklUKDE2KQogI2RlZmluZSBVRk9FX01PVVRfRU5fRFNJMAkJMHgxCiAjZGVmaW5lIENP
TE9SMF9TRUxfSU5fT1ZMMAkJMHgxCiAjZGVmaW5lIE9WTDFfTU9VVF9FTl9DT0xPUjEJCTB4MQpA
QCAtMTUxLDYgKzE1Miw5IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9tb3V0X2VuKGVu
dW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5U
X0dBTU1BICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgewogCQkqYWRkciA9IERJU1Bf
UkVHX0NPTkZJR19ESVNQX0dBTU1BX01PVVRfRU47CiAJCXZhbHVlID0gR0FNTUFfTU9VVF9FTl9S
RE1BMTsKKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX09EMSAmJiBuZXh0ID09IERE
UF9DT01QT05FTlRfUkRNQTEpIHsKKwkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9PRF9N
T1VUX0VOOworCQl2YWx1ZSA9IE9EMV9NT1VUX0VOX1JETUExOwogCX0gZWxzZSBpZiAoY3VyID09
IEREUF9DT01QT05FTlRfUkRNQTEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQSTApIHsKIAkJ
KmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMV9NT1VUX0VOOwogCQl2YWx1ZSA9IFJE
TUExX01PVVRfRFBJMDsKLS0gCjIuMTIuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
