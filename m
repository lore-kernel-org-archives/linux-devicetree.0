Return-Path: <SRS0=9N3P=SS=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V12 4/5] defconfig: arm64: add i.MX system controller thermal
 support
Date: Tue, 16 Apr 2019 03:22:33 +0000
Message-ID: <1555384609-7030-4-git-send-email-Anson.Huang@nxp.com>
References: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

VGhpcyBwYXRjaCBlbmFibGVzIENPTkZJR19JTVhfU0NfVEhFUk1BTCBhcyBtb2R1bGUuDQoNClNp
Z25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KLS0tDQpObyBj
aGFuZ2UuDQotLS0NCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHwgMSArDQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2NvbmZp
Z3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KaW5kZXggMTdkYWE5
Ny4uZmJlM2JlNyAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCisr
KyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCkBAIC00MjUsNiArNDI1LDcgQEAgQ09O
RklHX1NFTlNPUlNfSU5BMlhYPW0NCiBDT05GSUdfVEhFUk1BTF9HT1ZfUE9XRVJfQUxMT0NBVE9S
PXkNCiBDT05GSUdfQ1BVX1RIRVJNQUw9eQ0KIENPTkZJR19USEVSTUFMX0VNVUxBVElPTj15DQor
Q09ORklHX0lNWF9TQ19USEVSTUFMPW0NCiBDT05GSUdfUk9DS0NISVBfVEhFUk1BTD1tDQogQ09O
RklHX1JDQVJfVEhFUk1BTD15DQogQ09ORklHX1JDQVJfR0VOM19USEVSTUFMPXkNCi0tIA0KMi43
LjQNCg0K
