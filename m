From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 3/4] defconfig: arm64: enable i.MX8 SCU octop driver
Date: Wed, 8 May 2019 02:56:12 +0000
Message-ID: <20190508030927.16668-3-peng.fan@nxp.com>
References: <20190508030927.16668-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508030927.16668-1-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Peng Fan <peng.fan@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Andy Gross <andy.gross@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Jagan Teki <jagan@amarulasolutions.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Enric Balletbo i Serra <enric.balletbo@collabora.co>
List-Id: devicetree@vger.kernel.org

QnVpbGQgaW4gQ09ORklHX05WTUVNX0lNWF9PQ09UUF9TQ1UuDQoNCkNjOiBDYXRhbGluIE1hcmlu
YXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPg0KQ2M6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNv
bkBhcm0uY29tPg0KQ2M6IFNoYXduIEd1byA8c2hhd24uZ3VvQGxpbmFyby5vcmc+DQpDYzogQW5k
eSBHcm9zcyA8YW5keS5ncm9zc0BsaW5hcm8ub3JnPg0KQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+DQpDYzogT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20ubmV0
Pg0KQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPg0KQ2M6IEJqb3Ju
IEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+DQpDYzogTGVvbmFyZCBDcmVz
dGV6IDxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT4NCkNjOiBNYXJjIEdvbnphbGV6IDxtYXJjLncu
Z29uemFsZXpAZnJlZS5mcj4NCkNjOiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxs
ZXRib0Bjb2xsYWJvcmEuY29tPg0KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQpT
aWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCi0tLQ0KDQpWMjoNCiBy
ZW5hbWUgcGF0Y2ggdGl0bGUsIGFkZCByZXZpZXcgdGFnDQoNCiBhcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdz
L2RlZmNvbmZpZw0KaW5kZXggZWIzMWMyMGU5OTE0Li45ZDhhNTEyZmMzZDUgMTAwNjQ0DQotLS0g
YS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQorKysgYi9hcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnDQpAQCAtNzQ4LDYgKzc0OCw3IEBAIENPTkZJR19ISVNJX1BNVT15DQogQ09ORklH
X1FDT01fTDJfUE1VPXkNCiBDT05GSUdfUUNPTV9MM19QTVU9eQ0KIENPTkZJR19OVk1FTV9JTVhf
T0NPVFA9eQ0KK0NPTkZJR19OVk1FTV9JTVhfT0NPVFBfU0NVPXkNCiBDT05GSUdfUUNPTV9RRlBS
T009eQ0KIENPTkZJR19ST0NLQ0hJUF9FRlVTRT15DQogQ09ORklHX1VOSVBISUVSX0VGVVNFPXkN
Ci0tIA0KMi4xNi40DQoNCg==
