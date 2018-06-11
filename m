From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 12/28] drm/mediatek: add connection from RDMA0 to DSI2
Date: Mon, 11 Jun 2018 11:26:04 +0800
Message-ID: <1528687580-549-13-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIGNvbm5lY3Rpb24gZnJvbSBSRE1BMCB0byBEU0kyCgpTaWduZWQt
b2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4
IGQ3OTUzZjJmNmEzNi4uYzA4YWVkOGRhZTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYwpAQCAtODIsNiArODIsNyBAQAogI2RlZmluZSBPVkwxX01PVVRfRU5fQ09MT1Ix
CQkweDEKICNkZWZpbmUgR0FNTUFfTU9VVF9FTl9SRE1BMQkJMHgxCiAjZGVmaW5lIFJETUEwX01P
VVRfRFBJMAkJCTB4MgorI2RlZmluZSBSRE1BMF9NT1VUX0RTSTIJCQkweDQKICNkZWZpbmUgUkRN
QTFfTU9VVF9EUEkwCQkJMHgyCiAjZGVmaW5lIERQSTBfU0VMX0lOX1JETUExCQkweDEKICNkZWZp
bmUgQ09MT1IxX1NFTF9JTl9PVkwxCQkweDEKQEAgLTE2MCw2ICsxNjEsOSBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IG10a19kZHBfbW91dF9lbihlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCiAJfSBl
bHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAmJiBuZXh0ID09IEREUF9DT01QT05F
TlRfRFBJMCkgewogCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JETUEwX01PVVRfRU47
CiAJCXZhbHVlID0gUkRNQTBfTU9VVF9EUEkwOworCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01Q
T05FTlRfUkRNQTAgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTIpIHsKKwkJKmFkZHIgPSBE
SVNQX1JFR19DT05GSUdfRElTUF9SRE1BMF9NT1VUX0VOOworCQl2YWx1ZSA9IFJETUEwX01PVVRf
RFNJMjsKIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUExICYmIG5leHQgPT0g
RERQX0NPTVBPTkVOVF9EUEkwKSB7CiAJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RJU1BfUkRN
QTFfTU9VVF9FTjsKIAkJdmFsdWUgPSBSRE1BMV9NT1VUX0RQSTA7Ci0tIAoyLjEyLjUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
