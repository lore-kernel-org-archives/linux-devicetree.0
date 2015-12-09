From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 13/14] ARM: dts: dove: add DT GPU support
Date: Wed,  9 Dec 2015 12:48:26 +0100
Message-ID: <1449661707-30532-13-git-send-email-l.stach@pengutronix.de>
References: <1449661707-30532-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1449661707-30532-1-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de, Gregory Clement <gregory.clement@free-electrons.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybS5saW51eC5vcmcudWs+CgpBZGQgRFQg
c3VwcG9ydCBmb3IgdGhlIFZpdmFudGUgR0M2MDAgR1BVIG9uIE1hcnZlbGwgRG92ZSBwbGF0Zm9y
bXMuClRoZXNlIG5vZGVzIGRlZmF1bHQgdG8gYmVpbmcgZGlzYWJsZWQgdW5sZXNzIGEgcGxhdGZv
cm0gZGVjaWRlcyB0aGV5CnNob3VsZCBiZSBlbmFibGVkLgoKU2lnbmVkLW9mZi1ieTogUnVzc2Vs
bCBLaW5nIDxybWsra2VybmVsQGFybS5saW51eC5vcmcudWs+ClNpZ25lZC1vZmYtYnk6IEx1Y2Fz
IFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2Rv
dmUuZHRzaSB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZG92ZS5kdHNpIGIvYXJjaC9h
cm0vYm9vdC9kdHMvZG92ZS5kdHNpCmluZGV4IGNkNThjMmU2Mjc1Ny4uZWExZDk5OWNhN2E3IDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9kb3ZlLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvZG92ZS5kdHNpCkBAIC0zMyw2ICszMywxMiBAQAogCQltYXJ2ZWxsLHRhdXJvczItY2Fj
aGUtZmVhdHVyZXMgPSA8MD47CiAJfTsKIAorCWdwdS1zdWJzeXN0ZW0geworCQljb21wYXRpYmxl
ID0gIm1hcnZlbGwsZG92ZS1ncHUtc3Vic3lzdGVtIjsKKwkJY29yZXMgPSA8JmdwdT47CisJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CisJfTsKKwogCWkyYy1tdXggewogCQljb21wYXRpYmxlID0gImky
Yy1tdXgtcGluY3RybCI7CiAJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwpAQCAtNzc2LDYgKzc4Miwx
NiBAQAogCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCSNzaXplLWNlbGxzID0gPDE+Owog
CQkJfTsKKworCQkJZ3B1OiBncHVAODQwMDAwIHsKKwkJCQljbG9ja3MgPSA8JmRpdmlkZXJfY2xr
IDE+OworCQkJCWNsb2NrLW5hbWVzID0gImNvcmUiOworCQkJCWNvbXBhdGlibGUgPSAidml2YW50
ZSxnYyI7CisJCQkJaW50ZXJydXB0cyA9IDw0OD47CisJCQkJcG93ZXItZG9tYWlucyA9IDwmZ3B1
X2RvbWFpbj47CisJCQkJcmVnID0gPDB4ODQwMDAwIDB4NDAwMD47CisJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKKwkJCX07CiAJCX07CiAJfTsKIH07Ci0tIAoyLjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
