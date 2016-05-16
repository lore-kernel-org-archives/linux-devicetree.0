From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: axp20x: Add support for the (external)
 drivebus regulator
Date: Mon, 16 May 2016 11:41:56 -0500
Message-ID: <20160516164156.GA24677@rob-hp-laptop>
References: <1463248545-16543-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463248545-16543-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 14, 2016 at 07:55:45PM +0200, Hans de Goede wrote:
> The axp20x pmics have 2 power inputs, one called ACIN which is intended
> for to be supplied via a powerbarrel on the board and one called VBUS
> which is intended to be supplied via an otg connector.
> 
> In the VBUS case the pmic needs to know if the board is supplying power
> to the otg connector, because then it should not take any power from
> its VBUS pin. The axp209 pmic has a N_VBUSEN input pin via which the
> board can signal to the pmic whether the board is supplying power to the
> otg connector or not.
> 
> On the axp221/axp223 this pin can alternatively be used as an output
> which controls an external regulator which (optionally) supplies
> power to the otg connector from the board. When the pin is used as
> output it is called DRIVEBUS in the datasheet.
> 
> This commit adds support for the DRIVEBUS pin as an extra pmic
> controlled regulator. Since this is optional a new x-powers,drivebus dt
> property is added. When this is present the misc-control register is
> written to change the N_VBUSEN input pin to DRIVEBUS output pin mode and
> the extra drivebus regulator is registered with the regulator subsystem.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt |  5 ++++
>  drivers/regulator/axp20x-regulator.c             | 30 ++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
> index d20b103..7a88479 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -22,6 +22,11 @@ Optional properties:
>  		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
>  		      AXP22X/80X: range: 1800-4050, Default: 3   MHz
>  
> +- x-powers,drivebus: axp221 / axp223 only boolean, set this when the N_VBUSEN

x-powers,drive-vbus-en

> +                  pin is used as an output pin to control an external regulator
> +                  to drive the OTG VBus, rather then as an input pin which
> +                  signals whether the board is driving OTG VBus or not.
> +
>  - <input>-supply: a phandle to the regulator supply node. May be omitted if
>  		  inputs are unregulated, such as using the IPSOUT output
>  		  from the PMIC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
