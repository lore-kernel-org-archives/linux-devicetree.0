From: Mark Yao <mark.yao@rock-chips.com>
Subject: [PATCH v5 6/7] dt-bindings: display: rockchip: fill Documents for vop
 series
Date: Thu, 20 Jul 2017 10:43:53 +0800
Message-ID: <1500518633-30761-1-git-send-email-mark.yao@rock-chips.com>
References: <1500518564-30371-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1500518564-30371-1-git-send-email-mark.yao@rock-chips.com>
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

U2lnbmVkLW9mZi1ieTogTWFyayBZYW8gPG1hcmsueWFvQHJvY2stY2hpcHMuY29tPgotLS0KQ2hh
bmdlcyBpbiB2NToKLSBjbGVhbiBkb2N1bWVudCBjb21taXQgdGl0bGUKLSBtb3ZlIGNoYW5nZXMg
ZGVzY3JpcHRpb24gb3V0IG9mIGRvY3VtbWl0IGNvbW1pdCBtc2cKCkNoYW5nZXMgaW4gdjI6Ci0g
cmVuYW1lIHJrMzIyeCB0byByazMyMjgKLSBjb3JyZWN0IHNvbWUgdm9wIHJlZ2lzdGVycyBkZWZp
bmUKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9y
b2NrY2hpcC12b3AudHh0IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKaW5kZXggOWViM2YwYS4uNWQ4
MzVkOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0CkBAIC04LDggKzgs
MTIgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0gY29tcGF0aWJsZTogdmFsdWUgc2hvdWxkIGJl
IG9uZSBvZiB0aGUgZm9sbG93aW5nCiAJCSJyb2NrY2hpcCxyazMwMzYtdm9wIjsKIAkJInJvY2tj
aGlwLHJrMzI4OC12b3AiOworCQkicm9ja2NoaXAscmszMzY4LXZvcCI7CisJCSJyb2NrY2hpcCxy
azMzNjYtdm9wIjsKIAkJInJvY2tjaGlwLHJrMzM5OS12b3AtYmlnIjsKIAkJInJvY2tjaGlwLHJr
MzM5OS12b3AtbGl0IjsKKwkJInJvY2tjaGlwLHJrMzIyOC12b3AiOworCQkicm9ja2NoaXAscmsz
MzI4LXZvcCI7CiAKIC0gaW50ZXJydXB0czogc2hvdWxkIGNvbnRhaW4gYSBsaXN0IG9mIGFsbCBW
T1AgSVAgYmxvY2sgaW50ZXJydXB0cyBpbiB0aGUKIAkJIG9yZGVyOiBWU1lOQywgTENEX1NZU1RF
TS4gVGhlIGludGVycnVwdCBzcGVjaWZpZXIKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
