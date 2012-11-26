From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/9] usb: chipidea: ci13xxx_imx: add 2nd and 3rd clock to
 support imx5x and newer
Date: Mon, 26 Nov 2012 11:22:32 +0100
Message-ID: <20121126102232.GG10369@pengutronix.de>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-3-git-send-email-m.grzeschik@pengutronix.de>
 <20121126092931.GA15740@nchen-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121126092931.GA15740@nchen-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2012 at 05:29:31PM +0800, Peter Chen wrote:
> On Wed, Nov 14, 2012 at 05:19:03PM +0100, Michael Grzeschik wrote:
> > This patch adds support for a second and third clock to the chipidea driver. On
> > modern freescale ARM cores like the imx51, imx53 and imx6q three clocks ("ahb",
> > "ipg" and "per") must be enabled in order to access the USB core.
> > 
> > In the original driver, the clock was requested without specifying the
> > connection id, further all mainline ARM archs with support for the chipidea
> > core (imx23, imx28) register their USB clock without a connection id.
> > 
> > This patch first renames the existing clk variable to clk_ahb. The connection
> > id "ahb" is added to the devm_clk_get() call. Then the clocks "ipg" and "per"
> > are requested. As all archs don't specify a connection id, all clk_get return
> > the same clock. This ensures compatibility to existing USB support and adds
> > support for imx5x at the same time.
> > 
> > This patch has been tested on imx28 and on imx53 with seperate "ahb", "ipg"
> > and "per" clocks.
> mx23, mx28, and mx6q has the same usb clock sources and different with
> mxc (mx5x, mx3x).
> 
> I am not sure which method is better:
> - Add dummy clock at clock.c
> - Add platform information(id_table or something similar) at driver.
> 
> Add dummy clock may confuse some users, for example, mx6q has no
> "per" and "ipg" clock at all.

The general idea is: The USB core has different input clocks. The driver
has to be provided with these input clocks. When i.MX6 does not have
these clocks, it only means that this SoC has no software controllable
gates for these clocks, thus they are not documented. Still this SoC
has these clocks.
This way we can describe the differences between the SoC purely on SoC
level without bothering the driver.
You might want to ask your hardware guys to get more information what
input clocks the USB core actually has, there actually is a lot of
guesswork in it due to missing/inconsistent/confusing documentation.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
