From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 12/14] dt-bindings: hdmi-connector: add DDC I2C bus phandle
 documentation
Date: Mon, 30 Nov 2015 22:07:54 +0100
Message-ID: <1448917676-25584-13-git-send-email-p.zabel@pengutronix.de>
References: <1448917676-25584-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448917676-25584-1-git-send-email-p.zabel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@pengutronix.de
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
b3J0IGZvciBIRE1JIGlucHV0Ci0tIAoyLjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
