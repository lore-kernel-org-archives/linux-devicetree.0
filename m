From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 12/12] dt-bindings: hdmi-connector: add DDC I2C bus phandle
 documentation
Date: Wed, 18 Nov 2015 18:34:20 +0100
Message-ID: <1447868060-11620-13-git-send-email-p.zabel@pengutronix.de>
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

QWRkIGFuIG9wdGlvbmFsIGRkYy1pMmMtYnVzIHBoYW5kbGUgcHJvcGVydHkgdGhhdCBwb2ludHMg
dG8KYW4gSTJDIG1hc3RlciBjb250cm9sbGVyIHRoYXQgaGFuZGxlcyB0aGUgY29ubmVjdG9yIERE
QyBwaW5zLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQpDaGFuZ2Vz
IHNpbmNlIHY1OgogLSBSZWJhc2VkIG9udG8gdjQuNC1yYzEKLS0tCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0IHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0
b3IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVj
dG9yL2hkbWktY29ubmVjdG9yLnR4dAppbmRleCBhY2Q1NjY4Li41MDhhZWU0IDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRt
aS1jb25uZWN0b3IudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5lY3Rvci50eHQKQEAgLTgsNiArOCw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6CiBPcHRpb25hbCBwcm9wZXJ0aWVzOgogLSBsYWJlbDogYSBzeW1ib2xp
YyBuYW1lIGZvciB0aGUgY29ubmVjdG9yCiAtIGhwZC1ncGlvczogSFBEIEdQSU8gbnVtYmVyCist
IGRkYy1pMmMtYnVzOiBwaGFuZGxlIGxpbmsgdG8gdGhlIEkyQyBjb250cm9sbGVyIHVzZWQgZm9y
IEREQyBFRElEIHByb2JpbmcKIAogUmVxdWlyZWQgbm9kZXM6CiAtIFZpZGVvIHBvcnQgZm9yIEhE
TUkgaW5wdXQKLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
