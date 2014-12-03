From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 07/12] Documentation: dt: imx: add MSCM documentation
Date: Wed, 03 Dec 2014 11:52:41 +0100
Message-ID: <57320597.hlx9GuXmaF@wuerfel>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch> <1417565531-4507-8-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417565531-4507-8-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 03 December 2014 01:12:06 Stefan Agner wrote:
> +Freescale Vybrid Miscellaneous System Control Module
> +
> +The MSCM IP contains Access Control and TrustZone Security hardware,
> +CPU Configuration registers and Interrupt Router control.
> +
> +Required properties:
> +- compatible : "fsl,vf610-mscm"
> +- reg : the register range of the MSCM module
> +
> +Example:
> +       mscm: mscm@40001000 {                 
> +               compatible = "fsl,vf610-mscm";
> +               reg = <0x40001000 0x1000>;    
> +       };                                    

This sounds like one of those generic system controller devices.
Should this be marked as syscon an accessed through
syscon_regmap_lookup_by_phandle()?

If you only eve have one driver touching these registers, that
won't be necessary of course.

	arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
