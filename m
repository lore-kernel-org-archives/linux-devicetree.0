From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 20/20] dt-bindings: PCI: mobiveil: Change gpio_slave and
 apb_csr to optional
Date: Fri, 12 Apr 2019 08:37:11 +0000
Message-ID: <20190412083635.33626-21-Zhiqiang.Hou@nxp.com>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KQ2hhbmdlIHRoZSAi
Z3Bpb19zbGF2ZSIgYW5kICJhcGJfY3NyIiB0byBvcHRpb25hbCwgdGhlICJncGlvX3NsYXZlIg0K
aXMgbm90IHVzZWQgaW4gY3VycmVudCBjb2RlLCBhbmQgImFwYl9jc3IiIGlzIG5vdCB1c2VkIGJ5
IHNvbWUgcGxhdGZvcm1zLg0KDQpTaWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5n
LkhvdUBueHAuY29tPg0KQWNrZWQtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxsLnN1YnJhaG1h
bnlhQG1vYml2ZWlsLmNvLmluPg0KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+DQpSZXZpZXdlZC1ieTogTWluZ2h1YW4gTGlhbiA8TWluZ2h1YW4uTGlhbkBueHAuY29tPg0K
UmV2aWV3ZWQtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxsLnN1YnJhaG1hbnlhQG1vYml2ZWls
LmNvLmluPg0KLS0tDQpWNToNCiAtIENvcnJlY3RlZCBhbmQgcmV0b3VjaGVkIHRoZSBzdWJqZWN0
IGFuZCBjaGFuZ2Vsb2cuDQoNCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNp
L21vYml2ZWlsLXBjaWUudHh0IHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
bW9iaXZlaWwtcGNpZS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNp
L21vYml2ZWlsLXBjaWUudHh0DQppbmRleCBhNjE4ZDQ3ODdkZDcuLjY0MTU2OTkzZTA1MiAxMDA2
NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbW9iaXZlaWwt
cGNpZS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbW9i
aXZlaWwtcGNpZS50eHQNCkBAIC0xMCw4ICsxMCwxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
IAlpbnRlcnJ1cHQgc291cmNlLiBUaGUgdmFsdWUgbXVzdCBiZSAxLg0KIC0gY29tcGF0aWJsZTog
U2hvdWxkIGNvbnRhaW4gIm1idmwsZ3BleDQwLXBjaWUiDQogLSByZWc6IFNob3VsZCBjb250YWlu
IFBDSWUgcmVnaXN0ZXJzIGxvY2F0aW9uIGFuZCBsZW5ndGgNCisJTWFuZGF0b3J5Og0KIAkiY29u
ZmlnX2F4aV9zbGF2ZSI6IFBDSWUgY29udHJvbGxlciByZWdpc3RlcnMNCiAJImNzcl9heGlfc2xh
dmUiCSAgOiBCcmlkZ2UgY29uZmlnIHJlZ2lzdGVycw0KKwlPcHRpb25hbDoNCiAJImdwaW9fc2xh
dmUiCSAgOiBHUElPIHJlZ2lzdGVycyB0byBjb250cm9sIHNsb3QgcG93ZXINCiAJImFwYl9jc3Ii
CSAgOiBNU0kgcmVnaXN0ZXJzDQogDQotLSANCjIuMTcuMQ0KDQo=
