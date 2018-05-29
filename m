From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 3/5] Documentation: DT: add i.MX EPIT timer binding
Date: Tue, 29 May 2018 19:04:34 +0200
Message-ID: <20180529170436.22711-4-peron.clem@gmail.com>
References: <20180529170436.22711-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180529170436.22711-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogQ2zDqW1lbnQgUGVyb24gPGNsZW1lbnQucGVyb25AZGV2aWFsZXQuY29tPgoKQWRkIGRl
dmljZXRyZWUgYmluZGluZyBkb2N1bWVudCBmb3IgTlhQJ3MgaS5NWCBTb0Mgc3BlY2lmaWMKRVBJ
VCB0aW1lciBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQZXJvbiA8Y2xlbWVudC5w
ZXJvbkBkZXZpYWxldC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14
NnEsZXBpdC50eHQgIHwgMjQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svaW14NnEsZXBpdC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14NnEsZXBpdC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14NnEsZXBpdC50eHQKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5hODRhNjBjNmFlMzUKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14NnEsZXBpdC50
eHQKQEAgLTAsMCArMSwyNCBAQAorQmluZGluZyBmb3IgdGhlIGkuTVg2IEVQSVQgdGltZXIKKwor
VGhpcyBiaW5kaW5nIHVzZXMgdGhlIGNvbW1vbiBjbG9jayBiaW5kaW5nWzFdLgorCitbMV0gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dAor
CitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImZzbCxpbXg2
cS1lcGl0IgorLSByZWc6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgY29udHJvbGxlciBh
bmQgbGVuZ3RoIG9mIG1lbW9yeSBtYXBwZWQKKyAgcmVnaW9uLgorLSBpbnRlcnJ1cHRzOiBTaG91
bGQgY29udGFpbiBFUElUIGNvbnRyb2xsZXIgaW50ZXJydXB0CistIGNsb2NrczogbGlzdCBvZiBj
bG9jayBzcGVjaWZpZXJzLCBtdXN0IGNvbnRhaW4gYW4gZW50cnkgZm9yIGVhY2ggcmVxdWlyZWQK
KyAgZW50cnkgaW4gY2xvY2stbmFtZXMKKy0gY2xvY2stbmFtZXMgOiBzaG91bGQgaW5jbHVkZSBl
bnRyaWVzICJpcGciLCAicGVyIgorCitFeGFtcGxlOgorCWVwaXQxOiBlcGl0QDIwZDAwMDAgewor
CQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1lcGl0IjsKKwkJcmVnID0gPDB4MDIwZDAwMDAgMHg0
MDAwPjsKKwkJaW50ZXJydXB0cyA9IDwwIDU2IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQljbG9j
a3MgPSA8JmNsa3MgSU1YNlFETF9DTEtfRVBJVDE+LAorCQkJPCZjbGtzIElNWDZRRExfQ0xLX0lQ
R19QRVI+OworCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKKwl9OwotLSAKMi4xNy4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
