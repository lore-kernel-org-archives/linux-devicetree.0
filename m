From: Mark Yao <mark.yao@rock-chips.com>
Subject: [PATCH 6/6] dt-bindings: add document for rk3036-vop
Date: Thu, 17 Dec 2015 11:45:19 +0800
Message-ID: <1450323919-32228-1-git-send-email-mark.yao@rock-chips.com>
References: <1450323426-32109-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1450323426-32109-1-git-send-email-mark.yao@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Q2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+CkNjOiBQYXdlbCBNb2xsIDxwYXdl
bC5tb2xsQGFybS5jb20+CkNjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgpD
YzogSWFuIENhbXBiZWxsIDxpamMrZGV2aWNldHJlZUBoZWxsaW9uLm9yZy51az4KQ2M6IEt1bWFy
IEdhbGEgPGdhbGFrQGNvZGVhdXJvcmEub3JnPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcKClNpZ25lZC1vZmYtYnk6IE1hcmsgWWFvIDxtYXJrLnlhb0Byb2NrLWNoaXBzLmNvbT4KLS0t
CiAuLi4vYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0ICAgICB8ICAg
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9w
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlw
L3JvY2tjaGlwLXZvcC50eHQKaW5kZXggZDE1MzUxZi4uNTQ4OWI1OSAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAt
dm9wLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9y
b2NrY2hpcC9yb2NrY2hpcC12b3AudHh0CkBAIC03LDYgKzcsNyBAQCBidWZmZXIgdG8gYW4gZXh0
ZXJuYWwgTENEIGludGVyZmFjZS4KIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAtIGNvbXBhdGlibGU6
IHZhbHVlIHNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZwogCQkicm9ja2NoaXAscmszMjg4
LXZvcCI7CisJCSJyb2NrY2hpcCxyazMwMzYtdm9wIjsKIAogLSBpbnRlcnJ1cHRzOiBzaG91bGQg
Y29udGFpbiBhIGxpc3Qgb2YgYWxsIFZPUCBJUCBibG9jayBpbnRlcnJ1cHRzIGluIHRoZQogCQkg
b3JkZXI6IFZTWU5DLCBMQ0RfU1lTVEVNLiBUaGUgaW50ZXJydXB0IHNwZWNpZmllcgotLSAKMS43
LjkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
