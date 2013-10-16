From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 0/4] Devicetree support for Voipac i.MX53 module
Date: Wed, 16 Oct 2013 09:31:13 +0200
Message-ID: <20131016073113.GM30088@pengutronix.de>
References: <1381874609-14464-1-git-send-email-lisovy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381874609-14464-1-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rostislav,

On Wed, Oct 16, 2013 at 12:03:25AM +0200, Rostislav Lisovy wrote:
> This patchset adds devicetree definition for Voipac X53-DMM-668 module
> which uses i.MX53 CPU. More information about the module may be found at:
> http://www.voipac.com/#X53-DMM-668
> The support for the baseboard used with this module is also provided.
> More information about the baseboard: http://www.voipac.com/#X25-BSB-000

Your Cc list looks a bit sparse. You should at least add
linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org and Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>.

(Side note: You could use these devicetree files to probe from
devicetree for your barebox port.)

Sascha

> 
> Working peripherals are:
> * UART0
> * Ethernet
> * Buttons (with keyboard controller)
> * Sound (headphone output)
> * SD-card
> * LEDs (through GPIOs)
> 
> 
> Rostislav Lisovy (4):
>   ARM: dts: i.MX53: Add alternate pinmux option for i2c_3
>   ARM: dts: i.MX53: Internal keyboard controller
>   ARM: dts: i.MX53: dts for Voipac x53-dmm-668 module
>   ARM: dts: i.MX53: Devicetree for Voipac Baseboard using x53-dmm-668
>     module
> 
>  arch/arm/boot/dts/imx53-voipac-bsb.dts      |  135 +++++++++++++++++++
>  arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi |  195 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx53.dtsi                |   15 +++
>  3 files changed, 345 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx53-voipac-bsb.dts
>  create mode 100644 arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> 
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
