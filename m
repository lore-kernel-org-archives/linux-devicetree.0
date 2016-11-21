From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] ARM: at91/dt: add dts file for sama5d36ek CMP board
Date: Mon, 21 Nov 2016 15:02:48 +0100
Message-ID: <20161121140248.utlir6krokjeeobi@piout.net>
References: <1479705283-3052-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479705283-3052-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I fixed it up this time but please use the proper subject prefix next
time (ARM: dts: at91:).

On 21/11/2016 at 13:14:42 +0800, Wenyou Yang wrote :
> The sama5d36ek CMP board is the variant of sama5d3xek board.
> It is equipped with the low-power DDR2 SDRAM, PMIC ACT8865 and
> some power rail. Its main purpose is used to measure the power
> consumption.
> The difference of the sama5d36ek CMP dts from sama5d36ek dts is
> listed as below.
>  1. The USB host nodes are removed, that is, the USB host is disabled.
>  2. The gpio_keys node is added to wake up from the sleep.
>  3. The LCD isn't supported due to the pins for LCD are conflicted
>     with gpio_keys.
>  4. The adc0 node support the pinctrl sleep state to fix the over
>     consumption on VDDANA.
> 
> As said in errata, "When the USB host ports are used in high speed
> mode (EHCI), it is not possible to suspend the ports if no device is
> attached on each port. This leads to increased power consumption even
> if the system is in a low power mode." That is why the the USB host
> is disabled.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
> 
> Changes in v3:
>  - Use a dual license scheme for DT files.
>  - Use the proper model name and the compatible string to reflect
>    the nature of this new "CMP" board.
>  - Change name of wakeup property to "wakeup-source".
>  - Remove unnecessary comments.
>  - Remove bootargs.
> 
> Changes in v2:
>  - Add the pinctrl sleep state for adc0 node to fix the over
>    consumption on VDDANA.
>  - Improve the commit log.
> 
>  arch/arm/boot/dts/sama5d36ek_cmp.dts  |  87 ++++++++++
>  arch/arm/boot/dts/sama5d3xcm_cmp.dtsi | 201 +++++++++++++++++++++++
>  arch/arm/boot/dts/sama5d3xmb_cmp.dtsi | 301 ++++++++++++++++++++++++++++++++++
>  3 files changed, 589 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sama5d36ek_cmp.dts
>  create mode 100644 arch/arm/boot/dts/sama5d3xcm_cmp.dtsi
>  create mode 100644 arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
