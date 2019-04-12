From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 00/20] PCI: mobiveil: fixes for Mobiveil PCIe Host Bridge IP
 driver
Date: Fri, 12 Apr 2019 08:35:11 +0000
Message-ID: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhpcyBwYXRjaCBz
ZXQgaXMgdG8gYWRkIGZpeGVzIGZvciBNb2JpdmVpbCBQQ0llIEhvc3QgZHJpdmVyLg0KQW5kIHRo
ZXNlIHBhdGNoZXMgYXJlIHNwbGl0ZWQgZnJvbSB0aGUgdGhyZWFkIGJlbG93Og0KaHR0cDovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtcGNpL2xpc3QvP3Nlcmllcz05NjQxNw0K
DQpIb3UgWmhpcWlhbmcgKDIwKToNCiAgUENJOiBtb2JpdmVpbDogVW5pZnkgcmVnaXN0ZXIgYWNj
ZXNzb3JzDQogIFBDSTogbW9iaXZlaWw6IEZvcm1hdCB0aGUgY29kZSB3aXRob3V0IGZ1bmN0aW9u
YWxpdHkgY2hhbmdlDQogIFBDSTogbW9iaXZlaWw6IENvcnJlY3QgdGhlIHJldHVybmVkIGVycm9y
IG51bWJlcg0KICBQQ0k6IG1vYml2ZWlsOiBSZW1vdmUgdGhlIGZsYWcgTVNJX0ZMQUdfTVVMVElf
UENJX01TSQ0KICBQQ0k6IG1vYml2ZWlsOiBDb3JyZWN0IFBDSSBiYXNlIGFkZHJlc3MgaW4gTUVN
L0lPIG91dGJvdW5kIHdpbmRvd3MNCiAgUENJOiBtb2JpdmVpbDogUmVwbGFjZSB0aGUgcmVzb3Vy
Y2UgbGlzdCBpdGVyYXRpb24gZnVuY3Rpb24NCiAgUENJOiBtb2JpdmVpbDogVXNlIFdJTl9OVU1f
MCBleHBsaWNpdGx5IGZvciBDRkcgb3V0Ym91bmQgd2luZG93DQogIFBDSTogbW9iaXZlaWw6IFVz
ZSB0aGUgMXN0IGluYm91bmQgd2luZG93IGZvciBNRU0gaW5ib3VuZCB0cmFuc2FjdGlvbnMNCiAg
UENJOiBtb2JpdmVpbDogQ29ycmVjdCBpbmJvdW5kL291dGJvdW5kIHdpbmRvdyBzZXR1cCByb3V0
aW5lcw0KICBQQ0k6IG1vYml2ZWlsOiBGaXggdGhlIElOVHggcHJvY2VzcyBlcnJvcnMNCiAgUENJ
OiBtb2JpdmVpbDogQ29ycmVjdCB0aGUgZml4dXAgb2YgQ2xhc3MgQ29kZSBmaWVsZA0KICBQQ0k6
IG1vYml2ZWlsOiBNb3ZlIHRoZSBsaW5rIHVwIHdhaXRpbmcgb3V0IG9mIG1vYml2ZWlsX2hvc3Rf
aW5pdCgpDQogIFBDSTogbW9iaXZlaWw6IE1vdmUgSVJRIGNoYWluZWQgaGFuZGxlciBzZXR1cCBv
dXQgb2YgRFQgcGFyc2UNCiAgUENJOiBtb2JpdmVpbDogSW5pdGlhbGl6ZSBQcmltYXJ5L1NlY29u
ZGFyeS9TdWJvcmRpbmF0ZSBidXMgbnVtYmVycw0KICBQQ0k6IG1vYml2ZWlsOiBGaXggdGhlIGNo
ZWNraW5nIG9mIHZhbGlkIGRldmljZQ0KICBQQ0k6IG1vYml2ZWlsOiBBZGQgbGluayB1cCBjb25k
aXRpb24gY2hlY2sNCiAgUENJOiBtb2JpdmVpbDogQ29tcGxldGUgaW5pdGlhbGl6YXRpb24gb2Yg
aG9zdCBldmVuIGlmIG5vIFBDSWUgbGluaw0KICBQQ0k6IG1vYml2ZWlsOiBEaXNhYmxlIElCIGFu
ZCBPQiB3aW5kb3dzIHNldCBieSBib290bG9hZGVyDQogIFBDSTogbW9iaXZlaWw6IEFkZCA4LWJp
dCBhbmQgMTYtYml0IHJlZ2lzdGVyIGFjY2Vzc29ycw0KICBkdC1iaW5kaW5nczogUENJOiBtb2Jp
dmVpbDogQ2hhbmdlIGdwaW9fc2xhdmUgYW5kIGFwYl9jc3IgdG8gb3B0aW9uYWwNCg0KIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9tb2JpdmVpbC1wY2llLnR4dCB8ICAgMiArDQogZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMgICAgICAgIHwgNTc4ICsrKysrKysrKysr
LS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMzY4IGluc2VydGlvbnMoKyksIDIxMiBkZWxldGlv
bnMoLSkNCg0KLS0gDQoyLjE3LjENCg0K
