From: Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH v1 6/6] ARM: dts: imx7ulp: add edma device node
Date: Fri, 10 May 2019 10:14:31 +0000
Message-ID: <1557512248-8440-7-git-send-email-yibin.gong@nxp.com>
References: <1557512248-8440-1-git-send-email-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557512248-8440-1-git-send-email-yibin.gong@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh@kernel.org" <robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "vkoul@kernel.org" <vkoul@kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

QWRkIGVkbWEgZGV2aWNlIG5vZGUgaW4gZHRzLg0KDQpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBHb25n
IDx5aWJpbi5nb25nQG54cC5jb20+DQotLS0NCiBhcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLmR0
c2kgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDI4
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRzaQ0KaW5kZXggZDZiNzExMC4uYjRm
N2FkZiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRzaQ0KKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNpDQpAQCAtMTAwLDYgKzEwMCwzNCBAQA0KIAkJ
cmVnID0gPDB4NDAwMDAwMDAgMHg4MDAwMDA+Ow0KIAkJcmFuZ2VzOw0KIA0KKwkJZWRtYTE6IGRt
YS1jb250cm9sbGVyQDQwMDgwMDAwIHsNCisJCQkjZG1hLWNlbGxzID0gPDI+Ow0KKwkJCWNvbXBh
dGlibGUgPSAiZnNsLGlteDd1bHAtZWRtYSI7DQorCQkJcmVnID0gPDB4NDAwODAwMDAgMHgyMDAw
PiwNCisJCQkJPDB4NDAyMTAwMDAgMHgxMDAwPjsNCisJCQlkbWEtY2hhbm5lbHMgPSA8MzI+Ow0K
KwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkg
ICAgIDxHSUNfU1BJIDEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQorCQkJCSAgICAgPEdJQ19TUEkg
MiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCisJCQkJICAgICA8R0lDX1NQSSAzIElSUV9UWVBFX0xF
VkVMX0hJR0g+LA0KKwkJCQkgICAgIDxHSUNfU1BJIDQgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQor
CQkJCSAgICAgPEdJQ19TUEkgNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCisJCQkJICAgICA8R0lD
X1NQSSA2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkgICAgIDxHSUNfU1BJIDcgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sDQorCQkJCSAgICAgPEdJQ19TUEkgOCBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCisJCQkJICAgICA8R0lDX1NQSSA5IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkgICAg
IDxHSUNfU1BJIDEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkgICAgIDxHSUNfU1BJIDEx
IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkgICAgIDxHSUNfU1BJIDEyIElSUV9UWVBFX0xF
VkVMX0hJR0g+LA0KKwkJCQkgICAgIDxHSUNfU1BJIDEzIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
KwkJCQkgICAgIDxHSUNfU1BJIDE0IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkgICAgIDxH
SUNfU1BJIDE1IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KKwkJCQkgICAgIDxHSUNfU1BJIDE2IElS
UV9UWVBFX0xFVkVMX0hJR0g+Ow0KKwkJCWNsb2NrLW5hbWVzID0gImRtYSIsICJkbWFtdXgwIjsN
CisJCQljbG9ja3MgPSA8JnBjYzIgSU1YN1VMUF9DTEtfRE1BMT4sDQorCQkJCSA8JnBjYzIgSU1Y
N1VMUF9DTEtfRE1BX01VWDE+Ow0KKwkJfTsNCisNCiAJCWxwdWFydDQ6IHNlcmlhbEA0MDJkMDAw
MCB7DQogCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14N3VscC1scHVhcnQiOw0KIAkJCXJlZyA9IDww
eDQwMmQwMDAwIDB4MTAwMD47DQotLSANCjIuNy40DQoNCg==
