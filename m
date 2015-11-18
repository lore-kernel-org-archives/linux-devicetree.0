From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 11/12] clk: mediatek: Add hdmi_ref HDMI PHY PLL reference
 clock output
Date: Wed, 18 Nov 2015 18:34:19 +0100
Message-ID: <1447868060-11620-12-git-send-email-p.zabel@pengutronix.de>
References: <1447868060-11620-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1447868060-11620-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

VGhlIGNvbmZpZ3VyYWJsZSBoZG1pX3JlZiBvdXRwdXQgb2YgdGhlIFBMTCBibG9jayBpcyBkZXJp
dmVkIGZyb20KdGhlIHR2ZHBsbF81OTRtIGNsb2NrIHNpZ25hbCB2aWEgYSBjb25maWd1cmFibGUg
UExMIHBvc3QtZGl2aWRlci4KSXQgaXMgdXNlZCBhcyB0aGUgUExMIHJlZmVyZW5jZSBpbnB1dCB0
byB0aGUgSERNSSBQSFkgbW9kdWxlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTcz
LmMgICAgICB8IDUgKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4MTczLWNsay5o
IHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jIGIvZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jCmluZGV4IGIzMDVmYTIuLmQ3ZWFkZGEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYworKysgYi9kcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ4MTczLmMKQEAgLTEwOTEsNiArMTA5MSwxMSBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgbXRrX2FwbWl4ZWRzeXNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiAJ
CWNsa19kYXRhLT5jbGtzW2NrdS0+aWRdID0gY2xrOwogCX0KIAorCWNsayA9IGNsa19yZWdpc3Rl
cl9kaXZpZGVyKE5VTEwsICJoZG1pX3JlZiIsICJ0dmRwbGxfNTk0bSIsIDAsCisJCQkJICAgYmFz
ZSArIDB4NDAsIDE2LCAzLCBDTEtfRElWSURFUl9QT1dFUl9PRl9UV08sCisJCQkJICAgTlVMTCk7
CisJY2xrX2RhdGEtPmNsa3NbQ0xLX0FQTUlYRURfSERNSV9SRUZdID0gY2xrOworCiAJciA9IG9m
X2Nsa19hZGRfcHJvdmlkZXIobm9kZSwgb2ZfY2xrX3NyY19vbmVjZWxsX2dldCwgY2xrX2RhdGEp
OwogCWlmIChyKQogCQlwcl9lcnIoIiVzKCk6IGNvdWxkIG5vdCByZWdpc3RlciBjbG9jayBwcm92
aWRlcjogJWRcbiIsCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3
My1jbGsuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4MTczLWNsay5oCmluZGV4IDc5
NTZiYTEuLjYwOTRiZjcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4
MTczLWNsay5oCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4MTczLWNsay5oCkBA
IC0xNzYsNyArMTc2LDggQEAKICNkZWZpbmUgQ0xLX0FQTUlYRURfTFZEU1BMTAkJMTMKICNkZWZp
bmUgQ0xLX0FQTUlYRURfTVNEQ1BMTDIJCTE0CiAjZGVmaW5lIENMS19BUE1JWEVEX1JFRjJVU0Jf
VFgJCTE1Ci0jZGVmaW5lIENMS19BUE1JWEVEX05SX0NMSwkJMTYKKyNkZWZpbmUgQ0xLX0FQTUlY
RURfSERNSV9SRUYJCTE2CisjZGVmaW5lIENMS19BUE1JWEVEX05SX0NMSwkJMTcKIAogLyogSU5G
UkFfU1lTICovCiAKLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
