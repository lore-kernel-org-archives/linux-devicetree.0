Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:46198 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751293Ab3HFLjo (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 07:39:44 -0400
Date: Tue, 6 Aug 2013 12:38:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 4/4] mtd: nand: gpio: Add support for multichip
 devices
Message-ID: <20130806113839.GB25383@e106331-lin.cambridge.arm.com>
References: <1375779459-32549-1-git-send-email-shc_work@mail.ru>
 <1375779459-32549-2-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375779459-32549-2-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 06, 2013 at 09:57:39AM +0100, Alexander Shiyan wrote:
> This patch adds support for multichip NAND devices controlled through GPIOs.
> To implement this, the properties of tree have been renamed. All current
> boards and DTS files converted to use an updated driver. Also driver
> temporarily keep support for DTS files which use the previous names scheme.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt  |  16 +--
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts       |  10 +-
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts       |  10 +-
>  arch/arm/mach-clps711x/board-autcpu12.c            |   4 +-
>  arch/arm/mach-clps711x/board-p720t.c               |   4 +-
>  arch/arm/mach-pxa/cm-x255.c                        |  10 +-
>  drivers/mtd/nand/gpio.c                            | 108 +++++++++++++++------
>  include/linux/mtd/nand-gpio.h                      |  12 ++-
>  8 files changed, 112 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> index 91070d0..c58210a 100644
> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -11,8 +11,11 @@ Required properties:
>    are made in native endianness.

Unrelated, but the above like sounds mighty suspicious and possibly
meaningless...

>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>    representing partitions.
> -- gpios : specifies the gpio pins to control the NAND device.  nwp is an
> -  optional gpio and may be set to 0 if not present.

I'm not against deprecating this property, as the new mechanism is far
more flexible, and gets rid of the odd nwp case. However I think the
documentation for the old property should be kept (though marked as
deprecated). I'd be happy with a "Deprecated properties" section as with
the regulator bindings.

I'm not sure about changing the dts immediately as this prevents using
them with an old kernel, and creates a lot of churn, given the existing
binding will be supported for the transitionary period...

> +- ale-gpios : specifies the ALE gpio pin.
> +- cle-gpios : specifies the CLE gpio pin.
> +- nwp-gpios : specifies the NWP gpio pin (Optional).
> +- nce-gpios : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
> +- rdy-gpios : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.
> 
>  Optional properties:
>  - bank-width : Width (in bytes) of the device.  If not present, the width
> @@ -37,11 +40,10 @@ gpio-nand@1,0 {
>         reg = <1 0x0000 0x2>;
>         #address-cells = <1>;
>         #size-cells = <1>;
> -       gpios = <&banka 1 0     /* rdy */
> -                &banka 2 0     /* nce */
> -                &banka 3 0     /* ale */
> -                &banka 4 0     /* cle */
> -                0              /* nwp */>;
> +       ale-gpios = <&banka 3 0>;
> +       cle-gpios = <&banka 4 0>;
> +       nce-gpios = <&banka 2 0>;
> +       rdy-gpios = <&banka 1 0>;

It would be nice to have a multichip NAND example, also.

Thanks,
Mark.
