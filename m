From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 5/5] arm64: dts: realtek: Adopt RTD1295 reset constants
Date: Wed, 16 Aug 2017 02:38:47 +0200
Message-ID: <20170816003847.6208-6-afaerber@suse.de>
References: <20170816003847.6208-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170816003847.6208-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

UmVwbGFjZSByZXNldCBjb250cm9sbGVyIGluZGljZXMgd2l0aCBjb25zdGFudHMuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9yZWFsdGVrL3J0ZDEyOTUuZHRzaSB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTI5NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
ZWFsdGVrL3J0ZDEyOTUuZHRzaQppbmRleCBlNzc3MjAwZDg0YjkuLjJkMmQ4NGI1NzNlMyAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrL3J0ZDEyOTUuZHRzaQorKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTI5NS5kdHNpCkBAIC03LDYgKzcsNyBAQAog
ICovCiAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2lj
Lmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvcmVhbHRlayxydGQxMjk1Lmg+CiAKIC8g
ewogCWNvbXBhdGlibGUgPSAicmVhbHRlayxydGQxMjk1IjsKQEAgLTEyMyw3ICsxMjQsNyBAQAog
CQkJcmVnLXNoaWZ0ID0gPDI+OwogCQkJcmVnLWlvLXdpZHRoID0gPDQ+OwogCQkJY2xvY2stZnJl
cXVlbmN5ID0gPDI3MDAwMDAwPjsKLQkJCXJlc2V0cyA9IDwmaXNvX3Jlc2V0IDg+OworCQkJcmVz
ZXRzID0gPCZpc29fcmVzZXQgUlREMTI5NV9JU09fUlNUTl9VUjA+OwogCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAkJfTsKIApAQCAtMTMzLDcgKzEzNCw3IEBACiAJCQlyZWctc2hpZnQgPSA8Mj47
CiAJCQlyZWctaW8td2lkdGggPSA8ND47CiAJCQljbG9jay1mcmVxdWVuY3kgPSA8NDMyMDAwMDAw
PjsKLQkJCXJlc2V0cyA9IDwmcmVzZXQyIDI4PjsKKwkJCXJlc2V0cyA9IDwmcmVzZXQyIFJURDEy
OTVfUlNUTl9VUjE+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIApAQCAtMTQzLDcg
KzE0NCw3IEBACiAJCQlyZWctc2hpZnQgPSA8Mj47CiAJCQlyZWctaW8td2lkdGggPSA8ND47CiAJ
CQljbG9jay1mcmVxdWVuY3kgPSA8NDMyMDAwMDAwPjsKLQkJCXJlc2V0cyA9IDwmcmVzZXQyIDI3
PjsKKwkJCXJlc2V0cyA9IDwmcmVzZXQyIFJURDEyOTVfUlNUTl9VUjI+OwogCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKIAkJfTsKIAotLSAKMi4xMi4zCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
