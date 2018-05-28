From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 1/9] drm/mediatek: update dt-bindings for mt2712
Date: Mon, 28 May 2018 14:38:19 +0800
Message-ID: <1527489507-24453-2-git-send-email-stu.hsieh@mediatek.com>
References: <1527489507-24453-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527489507-24453-1-git-send-email-stu.hsieh@mediatek.com>
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

VXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRpc3BsYXkg
c3Vic3lzdGVtIGZvcgpNZWRpYXRlayBNVDI3MTIgU29Dcy4KClNpZ25lZC1vZmYtYnk6IFN0dSBI
c2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KQWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRp
YXRlay5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRp
c3AudHh0CmluZGV4IDM4MzE4M2E4OTE2NC4uODQ2OWRlNTEwMDAxIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXNwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dApAQCAtNDAsNyArNDAsNyBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxvY2tzKToKIAkibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAg
ICAgIC0gRFBJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkcGkudHh0CiAJIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLW11dGV4IiAtIGRpc3BsYXkgbXV0ZXgKIAkibWVkaWF0ZWssPGNoaXA+LWRpc3At
b2QiICAgIC0gb3ZlcmRyaXZlCi0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSBhbmQg
bXQ4MTczLgorICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10MjcxMiBhbmQgbXQ4
MTczLgogLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBmdW5j
dGlvbiBibG9jayByZWdpc3RlciBzcGFjZQogLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNp
Z25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKICAgbWVy
Z2UgYW5kIHNwbGl0IGZ1bmN0aW9uIGJsb2NrcykuCi0tIAoyLjEyLjUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
