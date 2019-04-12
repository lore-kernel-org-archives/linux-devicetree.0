From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 05/20] PCI: mobiveil: Correct PCI base address in MEM/IO
 outbound windows
Date: Fri, 12 Apr 2019 08:35:42 +0000
Message-ID: <20190412083635.33626-6-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KSXQgc2hvdWxkIGdl
dCBQQ0kgYmFzZSBhZGRyZXNzIGZyb20gdGhlICdyYW5nZXMnIHByb3BlcnR5IG9mIERUIG5vZGUN
CnRvIHNldHVwIE1FTS9JTyBvdXRib3VuZCB3aW5kb3dzIGluc3RlYWQgb2YgYWx3YXlzIHVzaW5n
IHplcm8uDQoNCkZpeGVzOiA5YWY2YmNiMTFlMTIgKCJQQ0k6IG1vYml2ZWlsOiBBZGQgTW9iaXZl
aWwgUENJZSBIb3N0IEJyaWRnZSBJUCBkcml2ZXIiKQ0KU2lnbmVkLW9mZi1ieTogSG91IFpoaXFp
YW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NClJldmlld2VkLWJ5OiBNaW5naHVhbiBMaWFuIDxN
aW5naHVhbi5MaWFuQG54cC5jb20+DQpSZXZpZXdlZC1ieTogU3VicmFobWFueWEgTGluZ2FwcGEg
PGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW4+DQotLS0NClY1Og0KIC0gQ29ycmVjdGVkIGFu
ZCByZXRvdWNoZWQgdGhlIHN1YmplY3QgYW5kIGNoYW5nZWxvZy4NCg0KIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1t
b2JpdmVpbC5jDQppbmRleCBhMGRkMzM3YzYyMTQuLjhmZjg3MzAyM2I1ZiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQorKysgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KQEAgLTYzMCw4ICs2MzAsOSBAQCBzdGF0aWMg
aW50IG1vYml2ZWlsX2hvc3RfaW5pdChzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSkNCiANCiAJ
CS8qIGNvbmZpZ3VyZSBvdXRib3VuZCB0cmFuc2xhdGlvbiB3aW5kb3cgKi8NCiAJCXByb2dyYW1f
b2Jfd2luZG93cyhwY2llLCBwY2llLT5vYl93aW5zX2NvbmZpZ3VyZWQsDQotCQkJCSAgIHdpbi0+
cmVzLT5zdGFydCwgMCwgdHlwZSwNCi0JCQkJICAgcmVzb3VyY2Vfc2l6ZSh3aW4tPnJlcykpOw0K
KwkJCQkgICB3aW4tPnJlcy0+c3RhcnQsDQorCQkJCSAgIHdpbi0+cmVzLT5zdGFydCAtIHdpbi0+
b2Zmc2V0LA0KKwkJCQkgICB0eXBlLCByZXNvdXJjZV9zaXplKHdpbi0+cmVzKSk7DQogCX0NCiAN
CiAJLyogc2V0dXAgTVNJIGhhcmR3YXJlIHJlZ2lzdGVycyAqLw0KLS0gDQoyLjE3LjENCg0K
