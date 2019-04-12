From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 15/20] PCI: mobiveil: Fix the checking of valid device
Date: Fri, 12 Apr 2019 08:36:42 +0000
Message-ID: <20190412083635.33626-16-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KQWxsb3cgQ0ZHIHRy
YW5zYWN0aW9ucyB0byBhbGwgZnVuY3Rpb25zIG9mIEVuZHBvaW50IGltcGxlbWVudGVkDQptdWx0
aXBsZSBmdW5jdGlvbnMuDQoNCkZpeGVzOiA5YWY2YmNiMTFlMTIgKCJQQ0k6IG1vYml2ZWlsOiBB
ZGQgTW9iaXZlaWwgUENJZSBIb3N0IEJyaWRnZSBJUCBkcml2ZXIiKQ0KU2lnbmVkLW9mZi1ieTog
SG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NClJldmlld2VkLWJ5OiBNaW5naHVh
biBMaWFuIDxNaW5naHVhbi5MaWFuQG54cC5jb20+DQotLS0NClY1Og0KIC0gQ29ycmVjdGVkIGFu
ZCByZXRvdWNoZWQgdGhlIHN1YmplY3QgYW5kIGNoYW5nZWxvZy4NCg0KIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLW1vYml2ZWlsLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZl
aWwuYw0KaW5kZXggOTIxMDE2NWZlOGMwLi42MjE4NTIwNzhjYWYgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KKysrIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2llLW1vYml2ZWlsLmMNCkBAIC0yOTEsNyArMjkxLDcgQEAgc3RhdGljIGJvb2wg
bW9iaXZlaWxfcGNpZV92YWxpZF9kZXZpY2Uoc3RydWN0IHBjaV9idXMgKmJ1cywgdW5zaWduZWQg
aW50IGRldmZuKQ0KIAkgKiBEbyBub3QgcmVhZCBtb3JlIHRoYW4gb25lIGRldmljZSBvbiB0aGUg
YnVzIGRpcmVjdGx5DQogCSAqIGF0dGFjaGVkIHRvIFJDDQogCSAqLw0KLQlpZiAoKGJ1cy0+cHJp
bWFyeSA9PSBwY2llLT5yb290X2J1c19ucikgJiYgKGRldmZuID4gMCkpDQorCWlmICgoYnVzLT5w
cmltYXJ5ID09IHBjaWUtPnJvb3RfYnVzX25yKSAmJiAoUENJX1NMT1QoZGV2Zm4pID4gMCkpDQog
CQlyZXR1cm4gZmFsc2U7DQogDQogCXJldHVybiB0cnVlOw0KLS0gDQoyLjE3LjENCg0K
