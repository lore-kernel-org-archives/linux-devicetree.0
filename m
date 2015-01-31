From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 02/11] drm: add bindings for simple vga encoders
Date: Sat, 31 Jan 2015 17:32:55 +0100
Message-ID: <1422721984-27782-3-git-send-email-heiko@sntech.de>
References: <1422721984-27782-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1422721984-27782-1-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, mark.yao@rock-chips.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSBuZWNlc3NhcnkgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50IGZvciBzaW1wbGUg
dmdhIGVuY29kZXJzLgoKU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVj
aC5kZT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kcm0vaTJjL3ZnYS1zaW1wbGUudHh0
ICAgICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2RybS9pMmMvdmdhLXNpbXBsZS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZHJtL2kyYy92Z2Etc2ltcGxlLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kcm0vaTJjL3ZnYS1zaW1wbGUudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjI3MWRmOWEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHJtL2kyYy92Z2Etc2ltcGxlLnR4dApAQCAt
MCwwICsxLDE4IEBACitEZXZpY2UtVHJlZSBiaW5kaW5ncyBmb3IgZ2VuZXJpYyB2Z2EgZW5jb2Rl
cnMKKworUmVxdWlyZWQgcHJvcGVydGllczsKKyAgLSBjb21wYXRpYmxlOiBtdXN0IGJlICJhZGks
YWR2NzEyMyIKKworT3B0aW9uYWwgcHJvcGVydGllczoKKyAgLSBkZGMtaTJjLWJ1czogcGhhbmRs
ZSBvZiBhbiBJMkMgY29udHJvbGxlciB1c2VkIGZvciBEREMgRURJRCBwcm9iaW5nCisgIC0gZW5h
YmxlLWdwaW86IEdQSU8gcGluIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBlbmNvZGVyCisgIC0g
dmFhLXN1cHBseTogcmVndWxhdG9yIGZvciB0aGUgYW5hbG9nIHBvd2VyIHN1cHBseQorCitFeGFt
cGxlOgorCisJYWR2NzEyMzogdmdhLWVuY29kZXIgeworCQljb21wYXRpYmxlID0gImFkaSxhZHY3
MTIzIjsKKwkJZGRjLWkyYy1idXMgPSA8JmkyYzQ+OworCQl2YWEtc3VwcGx5ID0gPCZ2Y2NfaW8+
OworCQllbmFibGUtZ3BpbyA9IDwmZ3BpbzAgMTcgR1BJT19BQ1RJVkVfSElHSD47CisJfTsKLS0g
CjIuMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
