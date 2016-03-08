From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v13 14/14] arm64: dts: mt8173-evb: enable HDMI output
Date: Tue,  8 Mar 2016 14:27:29 +0100
Message-ID: <1457443649-12133-15-git-send-email-p.zabel@pengutronix.de>
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

QWRkIGFuIEhETUkgY29ubmVjdG9yIG5vZGUgYW5kIGVuYWJsZSB0aGUgZGV2aWNlcyB0aGF0IGFy
ZSBwYXJ0IG9mIHRoZQpIRE1JIGRpc3BsYXkgcGF0aDogY2VjLCBkcGkwLCBoZG1pX3BoeSwgYW5k
IGhkbWkwLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My1ldmIuZHRzIHwg
MzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
NzMtZXZiLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWV2Yi5kdHMK
aW5kZXggZTQyN2YwNC4uNWVlN2YyNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxNzMtZXZiLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE3My1ldmIuZHRzCkBAIC00Miw2ICs0Miw0NCBAQAogCQlncGlvID0gPCZwaW8gMTMwIEdQ
SU9fQUNUSVZFX0hJR0g+OwogCQllbmFibGUtYWN0aXZlLWhpZ2g7CiAJfTsKKworCWNvbm5lY3Rv
ciB7CisJCWNvbXBhdGlibGUgPSAiaGRtaS1jb25uZWN0b3IiOworCQlsYWJlbCA9ICJoZG1pIjsK
KwkJdHlwZSA9ICJkIjsKKworCQlwb3J0IHsKKwkJCWhkbWlfY29ubmVjdG9yX2luOiBlbmRwb2lu
dCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pMF9vdXQ+OworCQkJfTsKKwkJfTsKKwl9
OworfTsKKworJmNlYyB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmRwaTAgeworCXN0YXR1
cyA9ICJva2F5IjsKK307CisKKyZoZG1pX3BoeSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwor
JmhkbWkwIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwlwb3J0cyB7CisJCXBvcnRAMSB7CisJCQly
ZWcgPSA8MT47CisKKwkJCWhkbWkwX291dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmaGRtaV9jb25uZWN0b3JfaW4+OworCQkJfTsKKwkJfTsKKwl9OwogfTsKIAogJmkyYzEg
ewotLSAKMi43LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
