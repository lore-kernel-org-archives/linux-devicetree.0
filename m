From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/7] mfd: MT6397: Add regmap for MT8135 and MT6397 SoC
Date: Tue, 18 Nov 2014 11:46:45 +0000
Message-ID: <20141118114645.GX24004@x1>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
 <1416210027-5562-3-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416210027-5562-3-git-send-email-flora.fu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Flora Fu <flora.fu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Dongdong Cheng <dongdong.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Nov 2014, Flora Fu wrote:

> Add PMIC wrapper of MT8135 to access MFD MT6397.
> This is regmap of MT6397 MFD.
>=20
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  drivers/mfd/Kconfig            |   8 +
>  drivers/mfd/Makefile           |   1 +
>  drivers/mfd/mt8135-pmic-wrap.c | 847 +++++++++++++++++++++++++++++++=
++++++++++

All of the PMIC functionality needs removing from MFD and placed
somewhere else.  I suggest either drivers/power or drivers/regulator.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
