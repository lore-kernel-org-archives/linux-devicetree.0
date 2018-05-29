From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 5/5] ARM: dts: imx6qdl: add missing compatible and clock
 properties for EPIT
Date: Tue, 29 May 2018 19:04:36 +0200
Message-ID: <20180529170436.22711-6-peron.clem@gmail.com>
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

RnJvbTogQ29saW4gRGlkaWVyIDxjb2xpbi5kaWRpZXJAZGV2aWFsZXQuY29tPgoKQWRkIG1pc3Np
bmcgY29tcGF0aWJsZSBhbmQgY2xvY2sgcHJvcGVydGllcyBmb3IgRVBJVCBub2RlLgoKU2lnbmVk
LW9mZi1ieTogQ29saW4gRGlkaWVyIDxjb2xpbi5kaWRpZXJAZGV2aWFsZXQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBQZXJvbiA8Y2xlbWVudC5wZXJvbkBkZXZpYWxldC5jb20+ClJldmll
d2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+Ci0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvaW14NnFkbC5kdHNpIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRs
LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kKaW5kZXggYzAwM2U2MmJmMjkw
Li43NWJiYWNhMzRjYmMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRz
aQorKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kKQEAgLTg0NCwxMyArODQ0LDIz
IEBACiAJCQl9OwogCiAJCQllcGl0MTogZXBpdEAyMGQwMDAwIHsgLyogRVBJVDEgKi8KKwkJCQlj
b21wYXRpYmxlID0gImZzbCxpbXg2cS1lcGl0IjsKIAkJCQlyZWcgPSA8MHgwMjBkMDAwMCAweDQw
MDA+OwogCQkJCWludGVycnVwdHMgPSA8MCA1NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQlj
bG9ja3MgPSA8JmNsa3MgSU1YNlFETF9DTEtfRVBJVDE+LAorCQkJCQk8JmNsa3MgSU1YNlFETF9D
TEtfSVBHX1BFUj47CisJCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7CisJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKIAkJCX07CiAKIAkJCWVwaXQyOiBlcGl0QDIwZDQwMDAgeyAvKiBFUElU
MiAqLworCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDZxLWVwaXQiOwogCQkJCXJlZyA9IDwweDAy
MGQ0MDAwIDB4NDAwMD47CiAJCQkJaW50ZXJydXB0cyA9IDwwIDU3IElSUV9UWVBFX0xFVkVMX0hJ
R0g+OworCQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg2UURMX0NMS19FUElUMj4sCisJCQkJCTwmY2xr
cyBJTVg2UURMX0NMS19JUEdfUEVSPjsKKwkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsK
KwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJfTsKIAogCQkJc3JjOiBzcmNAMjBkODAwMCB7
Ci0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
