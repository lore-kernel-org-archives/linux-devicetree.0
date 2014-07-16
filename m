From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH v3 08/12] Documentation: bindings: add doc for the USB2
 ChipIdea USB driver
Date: Wed, 16 Jul 2014 10:26:02 +0200
Message-ID: <1405499166-6726-9-git-send-email-antoine.tenart@free-electrons.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIFVTQjIgQ2hpcElkZWEgZHJpdmVyIChjaTEzeHh4KSBiaW5kaW5ncy4KClNp
Z25lZC1vZmYtYnk6IEFudG9pbmUgVMOpbmFydCA8YW50b2luZS50ZW5hcnRAZnJlZS1lbGVjdHJv
bnMuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIudHh0
ICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mYjMxNTcxODNlNmEKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQK
QEAgLTAsMCArMSwyMyBAQAorKiBVU0IyIENoaXBJZGVhIFVTQiBjb250cm9sbGVyIGZvciBjaTEz
eHh4CisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiY2hp
cGlkZWEsdXNiMiIKKy0gcmVnOiBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0
ZXJzCistIGludGVycnVwdHM6IGludGVycnVwdCBmb3IgdGhlIFVTQiBjb250cm9sbGVyCisKK09w
dGlvbmFsIHByb3BlcnRpZXM6CistIGNsb2NrczogcmVmZXJlbmNlIHRvIHRoZSBVU0IgY2xvY2sK
Ky0gdXNiLXBoeTogcmVmZXJlbmNlIHRvIHRoZSBVU0IgUEhZCistIHZidXMtc3VwcGx5OiByZWZl
cmVuY2UgdG8gdGhlIFZCVVMgcmVndWxhdG9yCistIGRtYS1tYXNrOiBETUEgYml0IG1hc2sKKwor
RXhhbXBsZToKKworCXVzYkBmN2VkMDAwMCB7CisJCWNvbXBhdGlibGUgPSAiY2hpcGlkZWEsdXNi
MiI7CisJCXJlZyA9IDwweGY3ZWQwMDAwIDB4MTAwMDA+OworCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMTEgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCWNsb2NrcyA9IDwmY2hpcCBDTEtJRF9VU0Iw
PjsKKwkJdXNiLXBoeSA9IDwmdXNiX3BoeTA+OworCQl2YnVzLXN1cHBseSA9IDwmcmVnX3VzYjBf
dmJ1cz47CisJfTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
