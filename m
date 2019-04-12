From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 16/20] PCI: mobiveil: Add link up condition check
Date: Fri, 12 Apr 2019 08:36:48 +0000
Message-ID: <20190412083635.33626-17-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KQXZvaWQgdG8gaXNz
dWUgQ0ZHIHRyYW5zYWN0aW9ucyB0byBsaW5rIHBhcnRuZXIgd2hlbiB0aGUgUENJZQ0KbGluayBp
cyBub3QgdXAuDQoNClNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54
cC5jb20+DQotLS0NClY1Og0KIC0gQ29ycmVjdGVkIHRoZSBzdWJqZWN0Lg0KDQogZHJpdmVycy9w
Y2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aWUtbW9iaXZlaWwuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQpp
bmRleCA2MjE4NTIwNzhjYWYuLjFlZTNlYTI1NzBjMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQorKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUtbW9iaXZlaWwuYw0KQEAgLTI4Myw2ICsyODMsMTAgQEAgc3RhdGljIGJvb2wgbW9iaXZl
aWxfcGNpZV92YWxpZF9kZXZpY2Uoc3RydWN0IHBjaV9idXMgKmJ1cywgdW5zaWduZWQgaW50IGRl
dmZuKQ0KIHsNCiAJc3RydWN0IG1vYml2ZWlsX3BjaWUgKnBjaWUgPSBidXMtPnN5c2RhdGE7DQog
DQorCS8qIElmIHRoZXJlIGlzIG5vIGxpbmssIHRoZW4gdGhlcmUgaXMgbm8gZGV2aWNlICovDQor
CWlmIChidXMtPm51bWJlciA+IHBjaWUtPnJvb3RfYnVzX25yICYmICFtb2JpdmVpbF9wY2llX2xp
bmtfdXAocGNpZSkpDQorCQlyZXR1cm4gZmFsc2U7DQorDQogCS8qIE9ubHkgb25lIGRldmljZSBk
b3duIG9uIGVhY2ggcm9vdCBwb3J0ICovDQogCWlmICgoYnVzLT5udW1iZXIgPT0gcGNpZS0+cm9v
dF9idXNfbnIpICYmIChkZXZmbiA+IDApKQ0KIAkJcmV0dXJuIGZhbHNlOw0KLS0gDQoyLjE3LjEN
Cg0K
