From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/4] defconfig: arm64: enable i.MX8 nvmem driver
Date: Sun, 5 May 2019 13:28:24 +0000
Message-ID: <20190505134130.28071-3-peng.fan@nxp.com>
References: <20190505134130.28071-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505134130.28071-1-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Andy Gross <andy.gross@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Jagan Teki <jagan@amarulasolutions.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

QnVpbGQgaW4gQ09ORklHX05WTUVNX0lNWF9PQ09UUF9TQ1UuDQoNClNpZ25lZC1vZmYtYnk6IFBl
bmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KQ2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+DQpDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+DQpD
YzogU2hhd24gR3VvIDxzaGF3bi5ndW9AbGluYXJvLm9yZz4NCkNjOiBBbmR5IEdyb3NzIDxhbmR5
Lmdyb3NzQGxpbmFyby5vcmc+DQpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290
bGluLmNvbT4NCkNjOiBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+DQpDYzogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+DQpDYzogQmpvcm4gQW5kZXJzc29uIDxi
am9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4NCkNjOiBMZW9uYXJkIENyZXN0ZXogPGxlb25hcmQu
Y3Jlc3RlekBueHAuY29tPg0KQ2M6IE1hcmMgR29uemFsZXogPG1hcmMudy5nb256YWxlekBmcmVl
LmZyPg0KQ2M6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9y
YS5jb20+DQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQotLS0NCiBh
cmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIv
YXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KaW5kZXggZWIzMWMyMGU5OTE0Li45ZDhhNTEy
ZmMzZDUgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQorKysgYi9h
cmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQpAQCAtNzQ4LDYgKzc0OCw3IEBAIENPTkZJR19I
SVNJX1BNVT15DQogQ09ORklHX1FDT01fTDJfUE1VPXkNCiBDT05GSUdfUUNPTV9MM19QTVU9eQ0K
IENPTkZJR19OVk1FTV9JTVhfT0NPVFA9eQ0KK0NPTkZJR19OVk1FTV9JTVhfT0NPVFBfU0NVPXkN
CiBDT05GSUdfUUNPTV9RRlBST009eQ0KIENPTkZJR19ST0NLQ0hJUF9FRlVTRT15DQogQ09ORklH
X1VOSVBISUVSX0VGVVNFPXkNCi0tIA0KMi4xNi40DQoNCg==
