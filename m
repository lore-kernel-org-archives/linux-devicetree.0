From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [RFC 4/4] arm64: dts: realtek: Update RTD1295 UART nodes with clocks
Date: Thu, 17 Aug 2017 13:20:25 +0200
Message-ID: <20170817112026.24062-5-afaerber@suse.de>
References: <20170817112026.24062-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170817112026.24062-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

UmVwbGFjZSBjbG9jay1mcmVxdWVuY3kgd2l0aCBhIHJlZmVyZW5jZSB0byB0aGUgcmVzcGVjdGl2
ZSBjbG9jayBnYXRlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJA
c3VzZS5kZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTI5NS5kdHNpIHwg
NyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVhbHRlay9ydGQxMjk1LmR0c2kg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTI5NS5kdHNpCmluZGV4IDA3OGExMTUw
Njg3Ni4uNTAzZTJkNWZjMzM0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0
ZWsvcnRkMTI5NS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVhbHRlay9ydGQxMjk1
LmR0c2kKQEAgLTYsNiArNiw3IEBACiAgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjArIE9SIE1JVCkKICAqLwogCisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcmVhbHRlayxy
dGQxMjk1Lmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJt
LWdpYy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3JlYWx0ZWsscnRkMTI5NS5oPgog
CkBAIC0xNTIsNyArMTUzLDcgQEAKIAkJCXJlZyA9IDwweDk4MDA3ODAwIDB4NDAwPjsKIAkJCXJl
Zy1zaGlmdCA9IDwyPjsKIAkJCXJlZy1pby13aWR0aCA9IDw0PjsKLQkJCWNsb2NrLWZyZXF1ZW5j
eSA9IDwyNzAwMDAwMD47CisJCQljbG9ja3MgPSA8Jmlzb19jbGtjIFJURDEyOTVfSVNPX0NMS19F
Tl9NSVNDX1VSMD47CiAJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZpc29faXJxX211eD47CiAJCQlp
bnRlcnJ1cHRzID0gPDI+OwogCQkJcmVzZXRzID0gPCZpc29fcmVzZXQgUlREMTI5NV9JU09fUlNU
Tl9VUjA+OwpAQCAtMTcyLDcgKzE3Myw3IEBACiAJCQlyZWcgPSA8MHg5ODAxYjIwMCAweDEwMD47
CiAJCQlyZWctc2hpZnQgPSA8Mj47CiAJCQlyZWctaW8td2lkdGggPSA8ND47Ci0JCQljbG9jay1m
cmVxdWVuY3kgPSA8NDMyMDAwMDAwPjsKKwkJCWNsb2NrcyA9IDwmY2xrYyBSVEQxMjk1X0NMS19F
Tl9VUjE+OwogCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmaXJxX211eD47CiAJCQlpbnRlcnJ1cHRz
ID0gPDM+LCA8NT47CiAJCQlyZXNldHMgPSA8JnJlc2V0MiBSVEQxMjk1X1JTVE5fVVIxPjsKQEAg
LTE4NCw3ICsxODUsNyBAQAogCQkJcmVnID0gPDB4OTgwMWI0MDAgMHgxMDA+OwogCQkJcmVnLXNo
aWZ0ID0gPDI+OwogCQkJcmVnLWlvLXdpZHRoID0gPDQ+OwotCQkJY2xvY2stZnJlcXVlbmN5ID0g
PDQzMjAwMDAwMD47CisJCQljbG9ja3MgPSA8JmNsa2MgUlREMTI5NV9DTEtfRU5fVVIyPjsKIAkJ
CWludGVycnVwdC1wYXJlbnQgPSA8JmlycV9tdXg+OwogCQkJaW50ZXJydXB0cyA9IDw4PiwgPDEz
PjsKIAkJCXJlc2V0cyA9IDwmcmVzZXQyIFJURDEyOTVfUlNUTl9VUjI+OwotLSAKMi4xMi4zCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
