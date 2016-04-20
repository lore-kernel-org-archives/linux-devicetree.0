From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v15 5/6] dt-bindings: hdmi-connector: add DDC I2C bus phandle
 documentation
Date: Wed, 20 Apr 2016 10:49:29 +0200
Message-ID: <1461142170-23946-6-git-send-email-p.zabel@pengutronix.de>
References: <1461142170-23946-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1461142170-23946-1-git-send-email-p.zabel@pengutronix.de>
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

QWRkIGFuIG9wdGlvbmFsIGRkYy1pMmMtYnVzIHBoYW5kbGUgcHJvcGVydHkgdGhhdCBwb2ludHMg
dG8KYW4gSTJDIG1hc3RlciBjb250cm9sbGVyIHRoYXQgaGFuZGxlcyB0aGUgY29ubmVjdG9yIERE
QyBwaW5zLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9yL2hkbWktY29ubmVj
dG9yLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9yL2hk
bWktY29ubmVjdG9yLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5lY3Rvci50eHQKaW5kZXggYWNkNTY2OC4uNTA4YWVlNCAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29u
bmVjdG9yL2hkbWktY29ubmVjdG9yLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0CkBAIC04LDYgKzgs
NyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogT3B0aW9uYWwgcHJvcGVydGllczoKIC0gbGFiZWw6
IGEgc3ltYm9saWMgbmFtZSBmb3IgdGhlIGNvbm5lY3RvcgogLSBocGQtZ3Bpb3M6IEhQRCBHUElP
IG51bWJlcgorLSBkZGMtaTJjLWJ1czogcGhhbmRsZSBsaW5rIHRvIHRoZSBJMkMgY29udHJvbGxl
ciB1c2VkIGZvciBEREMgRURJRCBwcm9iaW5nCiAKIFJlcXVpcmVkIG5vZGVzOgogLSBWaWRlbyBw
b3J0IGZvciBIRE1JIGlucHV0Ci0tIAoyLjguMC5yYzMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
