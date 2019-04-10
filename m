Return-Path: <SRS0=NnWQ=SM=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V11 3/4] defconfig: arm64: add i.MX system controller thermal
 support
Date: Wed, 10 Apr 2019 06:01:40 +0000
Message-ID: <1554875779-19727-3-git-send-email-Anson.Huang@nxp.com>
References: <1554875779-19727-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1554875779-19727-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, Andy Gross <andy.gross@linaro.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

VGhpcyBwYXRjaCBlbmFibGVzIENPTkZJR19JTVhfU0NfVEhFUk1BTCBhcyBtb2R1bGUuDQoNClNp
Z25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KLS0tDQpObyBj
aGFuZ2VzLg0KLS0tDQogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyB8IDEgKw0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25m
aWdzL2RlZmNvbmZpZyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCmluZGV4IDllMzEz
ZjUuLmQ0YzQwNGEgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQor
KysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQpAQCAtNDE1LDYgKzQxNSw3IEBAIENP
TkZJR19TRU5TT1JTX0lOQTJYWD1tDQogQ09ORklHX1RIRVJNQUxfR09WX1BPV0VSX0FMTE9DQVRP
Uj15DQogQ09ORklHX0NQVV9USEVSTUFMPXkNCiBDT05GSUdfVEhFUk1BTF9FTVVMQVRJT049eQ0K
K0NPTkZJR19JTVhfU0NfVEhFUk1BTD1tDQogQ09ORklHX1JPQ0tDSElQX1RIRVJNQUw9bQ0KIENP
TkZJR19SQ0FSX1RIRVJNQUw9eQ0KIENPTkZJR19SQ0FSX0dFTjNfVEhFUk1BTD15DQotLSANCjIu
Ny40DQoNCg==
