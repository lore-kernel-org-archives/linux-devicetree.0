From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/2] ARM: dts: owl-s500: Add CubieBoard6
Date: Mon, 11 Sep 2017 02:58:05 +0200
Message-ID: <20170911005805.10116-3-afaerber@suse.de>
References: <20170911005805.10116-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170911005805.10116-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@cubietech.com, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei@actions-semi.com>, linux-kernel@vger.kernel.org, Thomas Liau <thomas.liau@actions-semi.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>
List-Id: devicetree@vger.kernel.org

QWRkIGEgRGV2aWNlIFRyZWUgZm9yIEN1YmlldGVjaCBDdWJpZUJvYXJkNi4KCkNjOiBzdXBwb3J0
QGN1YmlldGVjaC5jb20KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBz
dXNlLmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICB8
ICAxICsKIGFyY2gvYXJtL2Jvb3QvZHRzL293bC1zNTAwLWN1YmllYm9hcmQ2LmR0cyB8IDQ0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvb3dsLXM1MDAtY3Vi
aWVib2FyZDYuZHRzCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgYi9h
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQppbmRleCBmYWY0NmFiYWE0YTIuLjQ0OGUwYmQ3NGFi
NyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvTWFrZWZpbGUKQEAgLTY4MCw2ICs2ODAsNyBAQCBkdGItJChDT05GSUdfQVJDSF9P
UklPTjVYKSArPSBcCiAJb3Jpb241eC1uZXRnZWFyLXducjg1NHQuZHRiIFwKIAlvcmlvbjV4LXJk
ODhmNTE4Mi1uYXMuZHRiCiBkdGItJChDT05GSUdfQVJDSF9BQ1RJT05TKSArPSBcCisJb3dsLXM1
MDAtY3ViaWVib2FyZDYuZHRiIFwKIAlvd2wtczUwMC1ndWl0YXItYmItcmV2LWIuZHRiCiBkdGIt
JChDT05GSUdfQVJDSF9QUklNQTIpICs9IFwKIAlwcmltYTItZXZiLmR0YgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvb3dsLXM1MDAtY3ViaWVib2FyZDYuZHRzIGIvYXJjaC9hcm0vYm9v
dC9kdHMvb3dsLXM1MDAtY3ViaWVib2FyZDYuZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uZWE0ZTAxYmNlOGQxCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvb3dsLXM1MDAtY3ViaWVib2FyZDYuZHRzCkBAIC0wLDAgKzEsNDQgQEAKKy8qCisg
KiBDdWJpZXRlY2ggQ3ViaWVCb2FyZDYKKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMTcgQW5kcmVh
cyBGw6RyYmVyCisgKgorICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBN
SVQpCisgKi8KKworL2R0cy12MS87CisKKyNpbmNsdWRlICJvd2wtczUwMC5kdHNpIgorCisvIHsK
Kwljb21wYXRpYmxlID0gImN1YmlldGVjaCxjdWJpZWJvYXJkNiIsICJhY3Rpb25zLHM1MDAiOwor
CW1vZGVsID0gIkN1YmllQm9hcmQ2IjsKKworCWFsaWFzZXMgeworCQlzZXJpYWwzID0gJnVhcnQz
OworCX07CisKKwljaG9zZW4geworCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwzOjExNTIwMG44IjsK
Kwl9OworCisJbWVtb3J5QDAgeworCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOworCQlyZWcgPSA8
MHgwIDB4ODAwMDAwMDA+OworCX07CisKKwl1YXJ0M19jbGs6IHVhcnQzLWNsayB7CisJCWNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOworCQljbG9jay1mcmVxdWVuY3kgPSA8OTIxNjAwPjsKKwkJ
I2Nsb2NrLWNlbGxzID0gPDA+OworCX07Cit9OworCismdGltZXIgeworCWNsb2NrcyA9IDwmaG9z
Yz47Cit9OworCismdWFydDMgeworCXN0YXR1cyA9ICJva2F5IjsKKwljbG9ja3MgPSA8JnVhcnQz
X2Nsaz47Cit9OwotLSAKMi4xMy41CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
