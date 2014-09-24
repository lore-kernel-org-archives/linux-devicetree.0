From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: mt8135: Add pinctrl node for mt8135.
Date: Wed, 24 Sep 2014 13:23:09 +0200
Message-ID: <CACRpkda-K7w-bY0uSdnZvzEKEeQg38oExoHPSW61kEv9Wv20mA@mail.gmail.com>
References: <1411443545-24951-1-git-send-email-srv_hongzhou.yang@mediatek.com>
	<1411443545-24951-5-git-send-email-srv_hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411443545-24951-5-git-send-email-srv_hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hongzhou.Yang" <srv_hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dandan.he@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 23, 2014 at 5:39 AM, Hongzhou.Yang
<srv_hongzhou.yang@mediatek.com> wrote:

> From: Hongzhou Yang <hongzhou.yang@mediatek.com>
>
> Add pinctrl node to mt8135.dtsi.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
(...)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_GPIO0 (MT_PIN_NO(0) | 0)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_MSDC0_DAT7 (MT_PIN_NO(0) | 1)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_EINT49 (MT_PIN_NO(0) | 2)
> +#define MT8135_PIN_0_MSDC0_DAT7__FUNC_I2SOUT_DAT (MT_PIN_NO(0) | 3)

I haven't got to reviewing the driver, but this looks just wrong.

Have the magic numbers in the driver.

Use strings to describe functions, not integers.

We need to move toward standardized device tree bindings
for this stuff, and that means using strings, not magic
numbers.

Yours,
Linus Walleij
