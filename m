From: Robin Gong <yibin.gong@nxp.com>
Subject: [PATCH v1 3/6] dmaengine: fsl-edma-common: move dmamux register to
 another single function
Date: Fri, 10 May 2019 10:14:17 +0000
Message-ID: <1557512248-8440-4-git-send-email-yibin.gong@nxp.com>
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

UHJlcGFyZSBmb3IgZWRtYXYyIG9uIGkubXg3dWxwIHdob3NlIGRtYW11eCByZWdpc3RlciBpcyAz
MmJpdC4gTm8gZnVuY3Rpb24NCmltcGFjdGVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBHb25n
IDx5aWJpbi5nb25nQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL2RtYS9mc2wtZWRtYS1jb21tb24u
YyB8IDE4ICsrKysrKysrKysrKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvZnNsLWVkbWEt
Y29tbW9uLmMgYi9kcml2ZXJzL2RtYS9mc2wtZWRtYS1jb21tb24uYw0KaW5kZXggYzlhMTdmYy4u
YmIyNDI1MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZG1hL2ZzbC1lZG1hLWNvbW1vbi5jDQorKysg
Yi9kcml2ZXJzL2RtYS9mc2wtZWRtYS1jb21tb24uYw0KQEAgLTc3LDYgKzc3LDE5IEBAIHZvaWQg
ZnNsX2VkbWFfZGlzYWJsZV9yZXF1ZXN0KHN0cnVjdCBmc2xfZWRtYV9jaGFuICpmc2xfY2hhbikN
CiB9DQogRVhQT1JUX1NZTUJPTF9HUEwoZnNsX2VkbWFfZGlzYWJsZV9yZXF1ZXN0KTsNCiANCitz
dGF0aWMgdm9pZCBtdXhfY29uZmlndXJlOChzdHJ1Y3QgZnNsX2VkbWFfY2hhbiAqZnNsX2NoYW4s
IHZvaWQgX19pb21lbSAqYWRkciwNCisJCQkgICB1MzIgb2ZmLCB1MzIgc2xvdCwgYm9vbCBlbmFi
bGUpDQorew0KKwl1OCB2YWw4Ow0KKw0KKwlpZiAoZW5hYmxlKQ0KKwkJdmFsOCA9IEVETUFNVVhf
Q0hDRkdfRU5CTCB8IHNsb3Q7DQorCWVsc2UNCisJCXZhbDggPSBFRE1BTVVYX0NIQ0ZHX0RJUzsN
CisNCisJaW93cml0ZTgodmFsOCwgYWRkciArIG9mZik7DQorfQ0KKw0KIHZvaWQgZnNsX2VkbWFf
Y2hhbl9tdXgoc3RydWN0IGZzbF9lZG1hX2NoYW4gKmZzbF9jaGFuLA0KIAkJCXVuc2lnbmVkIGlu
dCBzbG90LCBib29sIGVuYWJsZSkNCiB7DQpAQCAtODksMTAgKzEwMiw3IEBAIHZvaWQgZnNsX2Vk
bWFfY2hhbl9tdXgoc3RydWN0IGZzbF9lZG1hX2NoYW4gKmZzbF9jaGFuLA0KIAltdXhhZGRyID0g
ZnNsX2NoYW4tPmVkbWEtPm11eGJhc2VbY2ggLyBjaGFuc19wZXJfbXV4XTsNCiAJc2xvdCA9IEVE
TUFNVVhfQ0hDRkdfU09VUkNFKHNsb3QpOw0KIA0KLQlpZiAoZW5hYmxlKQ0KLQkJaW93cml0ZTgo
RURNQU1VWF9DSENGR19FTkJMIHwgc2xvdCwgbXV4YWRkciArIGNoX29mZik7DQotCWVsc2UNCi0J
CWlvd3JpdGU4KEVETUFNVVhfQ0hDRkdfRElTLCBtdXhhZGRyICsgY2hfb2ZmKTsNCisJbXV4X2Nv
bmZpZ3VyZTgoZnNsX2NoYW4sIG11eGFkZHIsIGNoX29mZiwgc2xvdCwgZW5hYmxlKTsNCiB9DQog
RVhQT1JUX1NZTUJPTF9HUEwoZnNsX2VkbWFfY2hhbl9tdXgpOw0KIA0KLS0gDQoyLjcuNA0KDQo=
