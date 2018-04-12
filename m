From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 7/9] gpio: Add gpio driver for Actions OWL S900 SoC
Date: Thu, 12 Apr 2018 11:06:39 +0200
Message-ID: <CACRpkdaP68mn6GP5fg8eJMDswAiKRrBF5aLj+coGQraPsS-RMA@mail.gmail.com>
References: <20180404172258.7678-1-manivannan.sadhasivam@linaro.org> <20180404172258.7678-8-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180404172258.7678-8-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 4, 2018 at 7:22 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add gpio driver for Actions Semi OWL family S900 SoC. Set of registers
> controlling the gpio shares the same register range with pinctrl block.
>
> GPIO registers are organized as 6 banks and each bank controls the
> maximum of 32 gpios.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied for v4.18.

Again: excellent work.

Yours,
Linus Walleij
