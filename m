From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 5/6] dt-bindings: media: rcar-vin: Add 'data-enable-active'
Date: Mon,  9 Jul 2018 16:19:20 +0200
Message-ID: <1531145962-1540-6-git-send-email-jacopo+renesas@jmondi.org>
References: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert@glider.be
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RGVzY3JpYmUgb3B0aW9uYWwgZW5kcG9pbnQgcHJvcGVydHkgJ2RhdGEtZW5hYmxlLWFjdGl2ZScg
Zm9yIFItQ2FyIFZJTi4KClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
ClJldmlld2VkLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2Fz
QHJhZ25hdGVjaC5zZQotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9yY2FyX3Zpbi50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JjYXJf
dmluLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yY2FyX3Zp
bi50eHQKaW5kZXggYjQxMDg2My4uMmY0MjAwNSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JjYXJfdmluLnR4dAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcmNhcl92aW4udHh0CkBAIC01NSw2ICs1NSw4IEBA
IFRoZSBwZXItYm9hcmQgc2V0dGluZ3MgR2VuMiBwbGF0Zm9ybXM6CiAgICAgICB0aGUgU29DIHR5
cGUgYW5kIHNlbGVjdGVkIGlucHV0IGltYWdlIGZvcm1hdC4KICAgICAgIFZhbGlkIHZhbHVlcyBh
cmU6IDgsIDEwLCAxMiwgMTYsIDI0IGFuZCAzMi4KICAgICAtIGRhdGEtc2hpZnQ6IHNlZSBbMV0g
Zm9yIGRlc2NyaXB0aW9uLiBWYWxpZCB2YWx1ZXMgYXJlIDAgYW5kIDguCisgICAgLSBkYXRhLWVu
YWJsZS1hY3RpdmU6IHBvbGFyaXR5IG9mIENMS0VOQiBzaWduYWwsIHNlZSBbMV0gZm9yCisgICAg
ICBkZXNjcmlwdGlvbi4gRGVmYXVsdCBpcyBhY3RpdmUgaGlnaC4KIAogVGhlIHBlci1ib2FyZCBz
ZXR0aW5ncyBHZW4zIHBsYXRmb3JtczoKIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
