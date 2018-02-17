From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 00/10] Add Actions Semi S900 pinctrl and gpio support
Date: Sat, 17 Feb 2018 22:19:50 +0100
Message-ID: <72e49775-3a3e-0b47-61e9-079d4be6c9d9@suse.de>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 17.02.2018 um 21:44 schrieb Manivannan Sadhasivam:
> This patchset adds pinctrl and gpio support for Actions Semi S900 SoC.
> Pinctrl and gpio subsystems share the common set of register range but
> implemented as individual drivers for making it less complex.
> 
> Pinmux functions are only accessible for pin groups while pinconf
> parameters are available for both pin groups and individual pins.
> 
> gpio-line-names has been added for the Bubblegum-96 board matching the
> 96Boards CE specification v1.0.
> 
> Both pinctrl and gpio drivers are verified using the Bubblegum-96 board.
> 
> This patchset depends on the clock driver which is still under review:
> https://lkml.org/lkml/2018/2/9/831

What this forgets to point out is that I had authored pinctrl and gpio
drivers for S500, with preparations for S700 and S900, derived from my
to-be-submitted pinctrl/gpio drivers for RTD1295, while this one was
developed independently by Mani for S900. Our intention is to align them
as part of patch review and redo S500 on top of the result.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
