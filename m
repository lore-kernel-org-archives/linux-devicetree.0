From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC v5 12/12] dt-bindings: hdmi-connector: add DDC I2C bus phandle
 documentation
Date: Wed,  4 Nov 2015 12:45:09 +0100
Message-ID: <1446637509-6418-13-git-send-email-p.zabel@pengutronix.de>
References: <1446637509-6418-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1446637509-6418-1-git-send-email-p.zabel@pengutronix.de>
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
eC5kZT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vaGRtaS1j
b25uZWN0b3IudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vaGRtaS1jb25u
ZWN0b3IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZpZGVvL2hkbWkt
Y29ubmVjdG9yLnR4dAppbmRleCBhY2Q1NjY4Li41MDhhZWU0IDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vaGRtaS1jb25uZWN0b3IudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92aWRlby9oZG1pLWNvbm5lY3Rvci50
eHQKQEAgLTgsNiArOCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiBPcHRpb25hbCBwcm9wZXJ0
aWVzOgogLSBsYWJlbDogYSBzeW1ib2xpYyBuYW1lIGZvciB0aGUgY29ubmVjdG9yCiAtIGhwZC1n
cGlvczogSFBEIEdQSU8gbnVtYmVyCistIGRkYy1pMmMtYnVzOiBwaGFuZGxlIGxpbmsgdG8gdGhl
IEkyQyBjb250cm9sbGVyIHVzZWQgZm9yIEREQyBFRElEIHByb2JpbmcKIAogUmVxdWlyZWQgbm9k
ZXM6CiAtIFZpZGVvIHBvcnQgZm9yIEhETUkgaW5wdXQKLS0gCjIuNi4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
