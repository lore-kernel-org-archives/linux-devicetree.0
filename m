From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 4/4] arm64: dts: imx: add i.MX8QXP ocotp support
Date: Wed, 8 May 2019 02:56:17 +0000
Message-ID: <20190508030927.16668-4-peng.fan@nxp.com>
References: <20190508030927.16668-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508030927.16668-1-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Peng Fan <peng.fan@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

QWRkIGkuTVg4UVhQIG9jb3RwIG5vZGUNCg0KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+DQpDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4NCkNjOiBTaGF3
biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQpDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBl
bmd1dHJvbml4LmRlPg0KQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0
cm9uaXguZGU+DQpDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPg0KQ2M6IE5Y
UCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4NCkNjOiBBaXNoZW5nIERvbmcgPGFpc2hl
bmcuZG9uZ0BueHAuY29tPg0KQ2M6IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPg0K
Q2M6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4NCkNjOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZw0KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zw0KU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQotLS0NCg0KVjI6
DQogbW92ZSBhZGRyZXNzL3NpemUtY2VsbHMgYmVsb3cgY29tcGF0aWJsZSwgYWRkICJzY3UiDQoN
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgfCA2ICsrKysrKw0K
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KaW5kZXggMDY4M2VlMmE0OGFlLi43MjVkMzQxZWUxNjAg
MTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kN
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KQEAgLTE0
MSw2ICsxNDEsMTIgQEANCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWlvbXV4YyI7DQog
CQl9Ow0KIA0KKwkJb2NvdHA6IGlteDhxeC1vY290cCB7DQorCQkJY29tcGF0aWJsZSA9ICJmc2ws
aW14OHF4cC1zY3Utb2NvdHAiOw0KKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KKwkJCSNzaXpl
LWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCiAJCXBkOiBpbXg4cXgtcGQgew0KIAkJCWNvbXBhdGli
bGUgPSAiZnNsLGlteDhxeHAtc2N1LXBkIjsNCiAJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDE+
Ow0KLS0gDQoyLjE2LjQNCg0K
