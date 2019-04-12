From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 07/20] PCI: mobiveil: Use WIN_NUM_0 explicitly for CFG
 outbound window
Date: Fri, 12 Apr 2019 08:35:54 +0000
Message-ID: <20190412083635.33626-8-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KQXMgdGhlIC5tYXBf
YnVzKCkgdXNlIHRoZSBXSU5fTlVNXzAgZm9yIENGRyB0cmFuc2FjdGlvbnMsDQppdCdzIGJldHRl
ciBwYXNzaW5nIFdJTl9OVU1fMCBleHBsaWNpdGx5IHdoZW4gaW5pdGlhbGl6ZQ0KdGhlIENGRyBv
dXRib3VuZCB3aW5kb3cuDQoNClNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcu
SG91QG54cC5jb20+DQpSZXZpZXdlZC1ieTogTWluZ2h1YW4gTGlhbiA8TWluZ2h1YW4uTGlhbkBu
eHAuY29tPg0KUmV2aWV3ZWQtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxsLnN1YnJhaG1hbnlh
QG1vYml2ZWlsLmNvLmluPg0KLS0tDQpWNToNCiAtIENvcnJlY3RlZCB0aGUgc3ViamVjdC4NCg0K
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jIHwgNSArKy0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQppbmRleCBiMmNjOWMwOTdmYzkuLmRmNzFjMTFiNDgx
MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQor
KysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KQEAgLTYxMiw5ICs2
MTIsOCBAQCBzdGF0aWMgaW50IG1vYml2ZWlsX2hvc3RfaW5pdChzdHJ1Y3QgbW9iaXZlaWxfcGNp
ZSAqcGNpZSkNCiAJICovDQogDQogCS8qIGNvbmZpZyBvdXRib3VuZCB0cmFuc2xhdGlvbiB3aW5k
b3cgKi8NCi0JcHJvZ3JhbV9vYl93aW5kb3dzKHBjaWUsIHBjaWUtPm9iX3dpbnNfY29uZmlndXJl
ZCwNCi0JCQkgICBwY2llLT5vYl9pb19yZXMtPnN0YXJ0LCAwLCBDRkdfV0lORE9XX1RZUEUsDQot
CQkJICAgcmVzb3VyY2Vfc2l6ZShwY2llLT5vYl9pb19yZXMpKTsNCisJcHJvZ3JhbV9vYl93aW5k
b3dzKHBjaWUsIFdJTl9OVU1fMCwgcGNpZS0+b2JfaW9fcmVzLT5zdGFydCwgMCwNCisJCQkgICBD
RkdfV0lORE9XX1RZUEUsIHJlc291cmNlX3NpemUocGNpZS0+b2JfaW9fcmVzKSk7DQogDQogCS8q
IG1lbW9yeSBpbmJvdW5kIHRyYW5zbGF0aW9uIHdpbmRvdyAqLw0KIAlwcm9ncmFtX2liX3dpbmRv
d3MocGNpZSwgV0lOX05VTV8xLCAwLCBNRU1fV0lORE9XX1RZUEUsIElCX1dJTl9TSVpFKTsNCi0t
IA0KMi4xNy4xDQoNCg==
