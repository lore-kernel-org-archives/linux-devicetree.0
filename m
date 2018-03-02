From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 04/10] pinctrl: actions: Add Actions S900 pinctrl driver
Date: Fri, 2 Mar 2018 14:21:37 +0100
Message-ID: <CACRpkdYKm9CuKb+0CDwddVK7uJvVKpkR_mubzDe1n2joUom-FA@mail.gmail.com>
References: <20180302035045.14660-1-manivannan.sadhasivam@linaro.org> <20180302035045.14660-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302035045.14660-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 2, 2018 at 4:50 AM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add pinctrl driver for Actions Semi S900 SoC. The driver supports
> pinctrl, pinmux and pinconf functionalities through a range of registers
> common to both gpio driver and pinctrl driver.
>
> Pinmux functionality is available only for the pin groups while the
> pinconf functionality is available for both pin groups and individual
> pins.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Seems like this is pretty much finished.

Let's see if you can collect some ACKs before we apply it.

Now just minor things remain.

Random chosen example:

> +static unsigned int lvds_e_drv_pads[] = {
> +       LVDS_EEP,
> +       LVDS_EEN,
> +       LVDS_EDP,
> +       LVDS_EDN,
> +       LVDS_ECP,
> +       LVDS_ECN,
> +       LVDS_EBP,
> +       LVDS_EBN,
> +};
> +
> +static unsigned int sd0_d3_d0_drv_pads[] = {
> +       SD0_D3,
> +       SD0_D2,
> +       SD0_D1,
> +       SD0_D0,
> +};

People (e.g. Torvalds) sometimes get upset with files with too many lines
in them. This file has a lot of lines. A lot of pin control drivers try to cut
down the lines with macros, and you do it in some places too,
would you consider to see if you can cut down these tables with
macros?

S900_PADS(LVDS_EEP, LVDS_EEN, LVDS_EDP, LVDS_EDN,
                    LVDS_ECP, LVDS_ECN, LVDS_EBP, LVDS_EBN);
S900_PADS(SD0_D3, SD0_D2, SD0_D1, SD0_D0);

Would be so much more compact.

It's not the biggest problem though.

Yours,
Linus Walleij
