From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH v2 5/5] ARM: dts: berlin: add SMP related nodes and properties
 for BG2Q
Date: Wed,  4 Jun 2014 18:03:46 +0200
Message-ID: <1401897826-11711-6-git-send-email-antoine.tenart@free-electrons.com>
References: <1401897826-11711-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401897826-11711-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIHJlcXVpcmVkIG5vZGVzIGFuZCBwcm9wZXJ0aWVzIGludG8gdGhlIEJlcmxpbiBCRzJRIGRl
dmljZSB0cmVlIHRvCnRha2UgYWR2YW50YWdlIG9mIHRoZSBuZXdseSBpbnRyb2R1Y2VkIFNNUCBz
dXBwb3J0LiBBZGQgdGhlIHNjdSBhbmQKY3B1LWN0cmwgbm9kZXMgYWxvbmcgd2l0aCB0aGUgQ1BV
cyBlbmFibGUtbWV0aG9kIHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogQW50b2luZSBUw6luYXJ0
IDxhbnRvaW5lLnRlbmFydEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9k
dHMvYmVybGluMnEuZHRzaSB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JlcmxpbjJxLmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy9iZXJsaW4ycS5kdHNpCmluZGV4IDA3NDUyYTc0ODNmYS4uNTcw
ZjEyZjdlOWM0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9iZXJsaW4ycS5kdHNpCisr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2JlcmxpbjJxLmR0c2kKQEAgLTE3LDYgKzE3LDcgQEAKIAlj
cHVzIHsKIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCSNzaXplLWNlbGxzID0gPDA+OworCQll
bmFibGUtbWV0aG9kID0gIm1hcnZlbGwsYmVybGluLXNtcCI7CiAKIAkJY3B1QDAgewogCQkJY29t
cGF0aWJsZSA9ICJhcm0sY29ydGV4LWE5IjsKQEAgLTk0LDYgKzk1LDExIEBACiAJCQlpbnRlcnJ1
cHRzID0gPEdJQ19QUEkgMTMgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAJCX07CiAKKwkJc2N1OiBz
bm9vcC1jb250cm9sLXVuaXRAYWQwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1h
OS1zY3UiOworCQkJcmVnID0gPDB4YWQwMDAwIDB4NTg+OworCQl9OworCiAJCWdpYzogaW50ZXJy
dXB0LWNvbnRyb2xsZXJAYWQxMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hOS1n
aWMiOwogCQkJcmVnID0gPDB4YWQxMDAwIDB4MTAwMD4sIDwweGFkMDEwMCAweDEwMD47CkBAIC0x
MDEsNiArMTA3LDExIEBACiAJCQkjaW50ZXJydXB0LWNlbGxzID0gPDM+OwogCQl9OwogCisJCWNw
dS1jdHJsQGRkMDAwMCB7CisJCQljb21wYXRpYmxlID0gIm1hcnZlbGwsYmVybGluLWNwdS1jdHJs
IjsKKwkJCXJlZyA9IDwweGRkMDAwMCAweDEwMDAwPjsKKwkJfTsKKwogCQlhcGJAZTgwMDAwIHsK
IAkJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
LS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
