From: Mark Yao <mark.yao@rock-chips.com>
Subject: [PATCH v6 6/7] dt-bindings: display: rockchip: fill Documents for vop
 series
Date: Wed, 26 Jul 2017 14:19:35 +0800
Message-ID: <1501049975-6185-1-git-send-email-mark.yao@rock-chips.com>
References: <1501049930-5794-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1501049930-5794-1-git-send-email-mark.yao@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWFyayBZYW8gPG1hcmsueWFvQHJvY2stY2hpcHMuY29tPgpBY2tlZC1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0gY2xl
YW4gZG9jdW1lbnQgY29tbWl0IHRpdGxlCi0gbW92ZSBjaGFuZ2VzIGRlc2NyaXB0aW9uIG91dCBv
ZiBkb2N1bW1pdCBjb21taXQgbXNnCgpDaGFuZ2VzIGluIHYyOgotIHJlbmFtZSByazMyMnggdG8g
cmszMjI4Ci0gY29ycmVjdCBzb21lIHZvcCByZWdpc3RlcnMgZGVmaW5lCgogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCB8
IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlw
LXZvcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2Nr
Y2hpcC9yb2NrY2hpcC12b3AudHh0CmluZGV4IDllYjNmMGEuLjVkODM1ZDkgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tj
aGlwLXZvcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dApAQCAtOCw4ICs4LDEyIEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXM6CiAtIGNvbXBhdGlibGU6IHZhbHVlIHNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxv
d2luZwogCQkicm9ja2NoaXAscmszMDM2LXZvcCI7CiAJCSJyb2NrY2hpcCxyazMyODgtdm9wIjsK
KwkJInJvY2tjaGlwLHJrMzM2OC12b3AiOworCQkicm9ja2NoaXAscmszMzY2LXZvcCI7CiAJCSJy
b2NrY2hpcCxyazMzOTktdm9wLWJpZyI7CiAJCSJyb2NrY2hpcCxyazMzOTktdm9wLWxpdCI7CisJ
CSJyb2NrY2hpcCxyazMyMjgtdm9wIjsKKwkJInJvY2tjaGlwLHJrMzMyOC12b3AiOwogCiAtIGlu
dGVycnVwdHM6IHNob3VsZCBjb250YWluIGEgbGlzdCBvZiBhbGwgVk9QIElQIGJsb2NrIGludGVy
cnVwdHMgaW4gdGhlCiAJCSBvcmRlcjogVlNZTkMsIExDRF9TWVNURU0uIFRoZSBpbnRlcnJ1cHQg
c3BlY2lmaWVyCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
