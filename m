From: Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH v1 2/6] dmaengine: mcf-edma: update to 'dmamux_nr'
Date: Fri, 10 May 2019 10:14:12 +0000
Message-ID: <1557512248-8440-3-git-send-email-yibin.gong@nxp.com>
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

VXBkYXRlIHRvICdkbWFtdXhfbnInIGluc3RlYWQgb2Ygc3RhdGljIG1hY3JvIERNQU1VWF9OUiBz
aW5jZQ0KbmV3IHZlcnNpb24gZWRtYSBvbmx5IGhhcyBvbmUgZG1hbXV4Lg0KDQpTaWduZWQtb2Zm
LWJ5OiBSb2JpbiBHb25nIDx5aWJpbi5nb25nQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL2RtYS9m
c2wtZWRtYS1jb21tb24uYyB8IDIgKy0NCiBkcml2ZXJzL2RtYS9tY2YtZWRtYS5jICAgICAgICB8
IDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9mc2wtZWRtYS1jb21tb24uYyBiL2RyaXZlcnMvZG1h
L2ZzbC1lZG1hLWNvbW1vbi5jDQppbmRleCA2ODBiMmEwLi5jOWExN2ZjIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9kbWEvZnNsLWVkbWEtY29tbW9uLmMNCisrKyBiL2RyaXZlcnMvZG1hL2ZzbC1lZG1h
LWNvbW1vbi5jDQpAQCAtODQsNyArODQsNyBAQCB2b2lkIGZzbF9lZG1hX2NoYW5fbXV4KHN0cnVj
dCBmc2xfZWRtYV9jaGFuICpmc2xfY2hhbiwNCiAJdm9pZCBfX2lvbWVtICptdXhhZGRyOw0KIAl1
bnNpZ25lZCBpbnQgY2hhbnNfcGVyX211eCwgY2hfb2ZmOw0KIA0KLQljaGFuc19wZXJfbXV4ID0g
ZnNsX2NoYW4tPmVkbWEtPm5fY2hhbnMgLyBETUFNVVhfTlI7DQorCWNoYW5zX3Blcl9tdXggPSBm
c2xfY2hhbi0+ZWRtYS0+bl9jaGFucyAvIGZzbF9jaGFuLT5lZG1hLT5kbWFtdXhfbnI7DQogCWNo
X29mZiA9IGZzbF9jaGFuLT52Y2hhbi5jaGFuLmNoYW5faWQgJSBjaGFuc19wZXJfbXV4Ow0KIAlt
dXhhZGRyID0gZnNsX2NoYW4tPmVkbWEtPm11eGJhc2VbY2ggLyBjaGFuc19wZXJfbXV4XTsNCiAJ
c2xvdCA9IEVETUFNVVhfQ0hDRkdfU09VUkNFKHNsb3QpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
ZG1hL21jZi1lZG1hLmMgYi9kcml2ZXJzL2RtYS9tY2YtZWRtYS5jDQppbmRleCA3ZGU1NGIyZi4u
NDQ4NDE5MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZG1hL21jZi1lZG1hLmMNCisrKyBiL2RyaXZl
cnMvZG1hL21jZi1lZG1hLmMNCkBAIC0xODksNiArMTg5LDcgQEAgc3RhdGljIGludCBtY2ZfZWRt
YV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIA0KIAkvKiBTZXQgdXAgdmVy
c2lvbiBmb3IgQ29sZEZpcmUgZWRtYSAqLw0KIAltY2ZfZWRtYS0+dmVyc2lvbiA9IHYyOw0KKwlt
Y2ZfZWRtYS0+ZG1hbXV4X25yID0gRE1BTVVYX05SOw0KIAltY2ZfZWRtYS0+YmlnX2VuZGlhbiA9
IDE7DQogDQogCWlmICghbWNmX2VkbWEtPm5fY2hhbnMpIHsNCi0tIA0KMi43LjQNCg0K
