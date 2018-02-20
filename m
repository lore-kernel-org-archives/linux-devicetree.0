From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH 08/10] gpio: Add gpio driver for Actions OWL S900 SoC
Date: Tue, 20 Feb 2018 08:55:57 +0100
Message-ID: <CAOFm3uEYhMxMz5QHDhOtpzEsrwJPrOdqLbGWTqveuNMtR_FVWA@mail.gmail.com>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
 <20180217204433.3095-9-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180217204433.3095-9-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, liuwei@actions-semi.com, LKML <linux-kernel@vger.kernel.org>, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Manivannan,

On Sat, Feb 17, 2018 at 9:44 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> Add gpio driver for Actions Semi OWL family S900 SoC. Set of registers
> controlling the gpio shares the same register range with pinctrl block.
>
> GPIO registers are organized as 6 banks and each bank controls the
> maximum of 32 gpios.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

<snip>

> --- /dev/null
> +++ b/drivers/gpio/gpio-owl.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0+

<snip>

> +MODULE_LICENSE("GPL v2");

Please sync this with your SPDX id above. nodule.h has the doc on the
meaning of MODULE_LICENSE macros.
Here you have stated a combo of GPL-2.0 and GPL-2.0 or later

-- 
Cordially
Philippe Ombredanne
