From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 4/4] ARM: dts: mt8135: Add pinctrl node for mt8135.
Date: Tue, 23 Sep 2014 15:03:32 +0200
Message-ID: <2770365.r419rjIAOU@wuerfel>
References: <1411443545-24951-1-git-send-email-srv_hongzhou.yang@mediatek.com> <1411443545-24951-5-git-send-email-srv_hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411443545-24951-5-git-send-email-srv_hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: "Hongzhou. Yang" <srv_hongzhou.yang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, dandan.he@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tuesday 23 September 2014 11:39:05 Hongzhou. Yang wrote:
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_GPIO0 (MT_PIN_NO(0) | 0)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_MSDC0_DAT7 (MT_PIN_NO(0) | 1)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_EINT49 (MT_PIN_NO(0) | 2)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_I2SOUT_DAT (MT_PIN_NO(0) | 3)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_DAC_DAT_OUT (MT_PIN_NO(0) | 4)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_PCM1_DO (MT_PIN_NO(0) | 5)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_SPI1_MO (MT_PIN_NO(0) | 6)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_NALE (MT_PIN_NO(0) | 7)
> +

This list looks like it just describes the hardware, I think it would
be better to put the values directly into the DT, rather than
using such macros.

	Arnd
