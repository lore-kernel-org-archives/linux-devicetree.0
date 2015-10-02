From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 7/7] pinctrl: freescale: imx: imx7d iomuxc-lpsr
 devicetree bindings
Date: Fri, 2 Oct 2015 14:46:18 -0700
Message-ID: <CACRpkdaht884ZBBaUoibGVRx8aGwHdimt2r9cz48=MZTpo2qaQ@mail.gmail.com>
References: <1443629469-12294-1-git-send-email-aalonso@freescale.com>
	<1443629469-12294-7-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1443629469-12294-7-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Anson.Huang@freescale.com" <Anson.Huang@freescale.com>, Frank Li <Frank.Li@freescale.com>, yibin.gong@freescale.com, nitin.garg@freescale.com, Dong Aisheng <Aisheng.Dong@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 30, 2015 at 9:11 AM, Adrian Alonso <aalonso@freescale.com> wrote:

> Add iomuxc-lpsr devicetree bindings documentation
> Provide documentation context as well an example on
> pheriperals that could use pad from either iomuxc controller
> supported by iMX7D SoC
>
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
> Changes for V2: New patch on imx7d iomuxc-lpsr patch series
> Changes for V3: Add shared input select register notes
> Changes for V4: Resend
> Changes for V5:
> - Fix spell error
> - Remove references of SHARE_INPUT_SELECT_REG flag
> Changes for V6: Resend
> Changes for V7: Resend
> Changes for V8: Correct SDA pad example

Patch applied. Assuming Shawn's old ACK is valid so attached it,
else beat me up Shawn.

Yours,
Linus Walleij
