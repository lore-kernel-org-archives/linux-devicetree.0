From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/2] ARM64: dts: meson-gxm-rbox-pro: Enable Bluetooth
Date: Tue, 17 Jan 2017 04:06:11 +0100
Message-ID: <20170117030611.23827-3-afaerber@suse.de>
References: <20170117030611.23827-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117030611.23827-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIGFuIFNESU8gcmVzZXQgR1BJTyBhbmQgZW5hYmxlIHRoZSBzZXJpYWwgdXNlZCBieSB0aGUg
QVA2MjU1CkJsdWV0b290aCBtb2R1bGUuIEJhc2VkIG9uIHdvcmsgYnkgTWFydGluIEJsdW1lbnN0
aW5nbC4KClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4K
LS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3htLXJib3gtcHJvLmR0cyB8
IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1n
eG0tcmJveC1wcm8uZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS1y
Ym94LXByby5kdHMKaW5kZXggOWYwNGZhNGU1YWVjLi42ZWEyMjVmNTg0YmQgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tcmJveC1wcm8uZHRzCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tcmJveC1wcm8uZHRzCkBAIC01
OCw2ICs1OCw3IEBACiAKIAlhbGlhc2VzIHsKIAkJc2VyaWFsMCA9ICZ1YXJ0X0FPOworCQlzZXJp
YWwxID0gJnVhcnRfQTsKIAl9OwogCiAJY2hvc2VuIHsKQEAgLTEyMiw3ICsxMjMsOCBAQAogCiAJ
c2Rpb19wd3JzZXE6IHNkaW8tcHdyc2VxIHsKIAkJY29tcGF0aWJsZSA9ICJtbWMtcHdyc2VxLXNp
bXBsZSI7Ci0JCXJlc2V0LWdwaW9zID0gPCZncGlvIEdQSU9YXzYgR1BJT19BQ1RJVkVfTE9XPjsK
KwkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfNiBHUElPX0FDVElWRV9MT1c+LAorCQkJCTwm
Z3BpbyBHUElPWF8xNyBHUElPX0FDVElWRV9MT1c+OwogCQljbG9ja3MgPSA8JndpZmkzMms+Owog
CQljbG9jay1uYW1lcyA9ICJleHRfY2xvY2siOwogCX07CkBAIC0yMzgsMyArMjQwLDEwIEBACiAJ
cGluY3RybC0wID0gPCZ1YXJ0X2FvX2FfcGlucz47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKIH07CisKKyZ1YXJ0X0EgeworCXN0YXR1cyA9ICJva2F5IjsKKwlwaW5jdHJsLTAgPSA8JnVh
cnRfYV9waW5zPiwgPCZ1YXJ0X2FfY3RzX3J0c19waW5zPjsKKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOworCXVhcnQtaGFzLXJ0c2N0czsKK307Ci0tIAoyLjEwLjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
