From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v13 11/14] clk: mediatek: Add hdmi_ref HDMI PHY PLL reference
 clock output
Date: Tue,  8 Mar 2016 14:27:26 +0100
Message-ID: <1457443649-12133-12-git-send-email-p.zabel@pengutronix.de>
References: <1457443649-12133-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1457443649-12133-1-git-send-email-p.zabel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, kernel@pengutronix.de, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Emil Velikov <emil.l.velikov@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

VGhlIGNvbmZpZ3VyYWJsZSBoZG1pX3JlZiBvdXRwdXQgb2YgdGhlIFBMTCBibG9jayBpcyBkZXJp
dmVkIGZyb20KdGhlIHR2ZHBsbF81OTRtIGNsb2NrIHNpZ25hbCB2aWEgYSBjb25maWd1cmFibGUg
UExMIHBvc3QtZGl2aWRlci4KSXQgaXMgdXNlZCBhcyB0aGUgUExMIHJlZmVyZW5jZSBpbnB1dCB0
byB0aGUgSERNSSBQSFkgbW9kdWxlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4KQWNrZWQtYnk6IEphbWVzIExpYW8gPGphbWVzamoubGlhb0Bt
ZWRpYXRlay5jb20+CkFja2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGNvZGVhdXJvcmEub3Jn
PgotLS0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyAgICAgIHwgNSArKysrKwog
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDgxNzMtY2xrLmggfCAzICsrLQogMiBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
bXQ4MTczLmMKaW5kZXggODVjMGJmYy4uY2Y0ZmNiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10ODE3My5jCisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgx
NzMuYwpAQCAtMTA5NSw2ICsxMDk1LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtdGtfYXBtaXhl
ZHN5c19pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKIAkJY2xrX2RhdGEtPmNsa3NbY2t1
LT5pZF0gPSBjbGs7CiAJfQogCisJY2xrID0gY2xrX3JlZ2lzdGVyX2RpdmlkZXIoTlVMTCwgImhk
bWlfcmVmIiwgInR2ZHBsbF81OTRtIiwgMCwKKwkJCQkgICBiYXNlICsgMHg0MCwgMTYsIDMsIENM
S19ESVZJREVSX1BPV0VSX09GX1RXTywKKwkJCQkgICBOVUxMKTsKKwljbGtfZGF0YS0+Y2xrc1tD
TEtfQVBNSVhFRF9IRE1JX1JFRl0gPSBjbGs7CisKIAlyID0gb2ZfY2xrX2FkZF9wcm92aWRlcihu
b2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7CiAJaWYgKHIpCiAJCXByX2Vy
cigiJXMoKTogY291bGQgbm90IHJlZ2lzdGVyIGNsb2NrIHByb3ZpZGVyOiAlZFxuIiwKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4MTczLWNsay5oIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9tdDgxNzMtY2xrLmgKaW5kZXggNzk1NmJhMS4uNjA5NGJmNyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDgxNzMtY2xrLmgKKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDgxNzMtY2xrLmgKQEAgLTE3Niw3ICsxNzYsOCBAQAog
I2RlZmluZSBDTEtfQVBNSVhFRF9MVkRTUExMCQkxMwogI2RlZmluZSBDTEtfQVBNSVhFRF9NU0RD
UExMMgkJMTQKICNkZWZpbmUgQ0xLX0FQTUlYRURfUkVGMlVTQl9UWAkJMTUKLSNkZWZpbmUgQ0xL
X0FQTUlYRURfTlJfQ0xLCQkxNgorI2RlZmluZSBDTEtfQVBNSVhFRF9IRE1JX1JFRgkJMTYKKyNk
ZWZpbmUgQ0xLX0FQTUlYRURfTlJfQ0xLCQkxNwogCiAvKiBJTkZSQV9TWVMgKi8KIAotLSAKMi43
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
