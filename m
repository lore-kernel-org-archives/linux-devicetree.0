From: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] ARM: dts: zynq: Enable USB and USB PHY for ZYBO
Date: Wed,  3 Feb 2016 22:41:05 +1000
Message-ID: <1454503265-20605-1-git-send-email-nathan@nathanrossi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Nathan Rossi <nathan@nathanrossi.com>
List-Id: devicetree@vger.kernel.org

U2V0dXAgdGhlIFVTQiBjb250cm9sbGVyIGFuZCBjb25maWd1cmUgaXQgdG8gb3BlcmF0ZSBpbiBo
b3N0IG1vZGUuCkFkZGl0aW9uYWxseSBhZGQgdGhlIFVTQiBwaHkgbm9kZSBmb3IgdGhlIFpZQk8s
IGluY2x1ZGluZyByZXNldCBncGlvCndoaWNoIGlzIGNvbm5lY3RlZCB0byBhIGV4dGVybmFsIE1J
TyBwaW4uCgpTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gUm9zc2kgPG5hdGhhbkBuYXRoYW5yb3NzaS5j
b20+CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogTWFyayBSdXRsYW5k
IDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KQ2M6IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQHhp
bGlueC5jb20+CkNjOiBTw7ZyZW4gQnJpbmttYW5uIDxzb3Jlbi5icmlua21hbm5AeGlsaW54LmNv
bT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy96eW5xLXp5Ym8uZHRzIHwgMTEgKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvenlucS16eWJvLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtenliby5kdHMK
aW5kZXggMTZjOWNhYy4uOGYwODViMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvenlu
cS16eWJvLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy96eW5xLXp5Ym8uZHRzCkBAIC0zMyw2
ICszMywxMSBAQAogCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKIAl9OwogCisJ
dXNiX3BoeTA6IHBoeTAgeworCQkjcGh5LWNlbGxzID0gPDA+OworCQljb21wYXRpYmxlID0gInVz
Yi1ub3AteGNlaXYiOworCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzAgNDYgMT47CisJfTsKIH07CiAK
ICZjbGtjIHsKQEAgLTU2LDMgKzYxLDkgQEAKICZ1YXJ0MSB7CiAJc3RhdHVzID0gIm9rYXkiOwog
fTsKKworJnVzYjAgeworCXN0YXR1cyA9ICJva2F5IjsKKwlkcl9tb2RlID0gImhvc3QiOworCXVz
Yi1waHkgPSA8JnVzYl9waHkwPjsKK307Ci0tIAoyLjcuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
