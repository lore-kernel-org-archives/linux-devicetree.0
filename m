From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH] devicetree/bindings: display: fix reference to
 Documentation/.../display-timing.txt
Date: Wed, 30 Aug 2017 12:47:55 +0200
Message-ID: <1504090075-27998-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

cGFuZWwtY29tbW9uLnR4dCByZWZlcmVuY2VzIGRpc3BsYXktdGltaW5nLnR4dCB3aXRoIGFuIGlu
dmFsaWQgcGF0aAooJy9wYW5lbCcgbWlzc2luZykuCgpTaWduZWQtb2ZmLWJ5OiBMb3RoYXIgV2HD
n21hbm4gPExXQEtBUk8tZWxlY3Ryb25pY3MuZGU+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnR4dCB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNvbW1v
bi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9w
YW5lbC1jb21tb24udHh0CmluZGV4IGVjNTJjNDcuLjA2MDNhZjggMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNvbW1vbi50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
cGFuZWwtY29tbW9uLnR4dApAQCAtMzgsNyArMzgsNyBAQCBEaXNwbGF5IFRpbWluZ3MKICAgcmVx
dWlyZSBzcGVjaWZpYyBkaXNwbGF5IHRpbWluZ3MuIFRoZSBwYW5lbC10aW1pbmcgc3Vibm9kZSBl
eHByZXNzZXMgdGhvc2UKICAgdGltaW5ncyBhcyBzcGVjaWZpZWQgaW4gdGhlIHRpbWluZyBzdWJu
b2RlIHNlY3Rpb24gb2YgdGhlIGRpc3BsYXkgdGltaW5nCiAgIGJpbmRpbmdzIGRlZmluZWQgaW4K
LSAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvZGlzcGxheS10aW1p
bmcudHh0LgorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9kaXNwbGF5LXRpbWluZy50eHQuCiAKIAogQ29ubmVjdGl2aXR5Ci0tIAoyLjEuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
