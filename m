From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V4 1/6] ARM: dts: imx6q: add common compatible name for
 reused modules
Date: Mon, 13 Jan 2014 16:16:23 +0100
Message-ID: <20140113151623.GL16215@pengutronix.de>
References: <1389614031-7253-1-git-send-email-b20788@freescale.com>
 <20140113121016.GJ16215@pengutronix.de>
 <20140113142249.GW23525@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140113142249.GW23525-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 10:22:51PM +0800, Shawn Guo wrote:
> On Mon, Jan 13, 2014 at 01:10:16PM +0100, Sascha Hauer wrote:
> > > @@ -840,7 +840,7 @@
> > >  			};
> > >  
> > >  			mmdc0: mmdc@021b0000 { /* MMDC0 */
> > > -				compatible = "fsl,imx6q-mmdc";
> > > +				compatible = "fsl,imx6q-mmdc", "fsl,mmdc";
> > 
> > This is not nice. Here you introduce a fsl,mmdc compatible claiming all
> > mmdc are compatible to each other and in the driver code you have:
> > 
> > static const u32 imx6q_mmdc_io_dsm_offset[]
> > static const u32 imx6dl_mmdc_io_dsm_offset[]
> > 
> > which proves they are *not* compatible.
> > 
> > You do this just to share a
> > 
> > imx6_pm_get_base(&pm_info->mmdc_base, "fsl,mmdc");
> > 
> > across the different i.MX6 SoCs.
> > 
> > You can sanitize this by introducing a SoC struct which you populate
> > differently for the SoCs
> > 
> > static pm_soc_data imx6q_data {
> > 	.mmdc_compat = "fsl,imx6q-mmdc",
> > };
> > 
> > And by putting cpu_type, mmdc_io_num and others in this struct you can
> > also remove the if(cpu_is_x()) else if (cpu_is_y()) else...
> 
> Good point.
> 
> Anson, the change below is a demonstration of Sascha's suggestion.
> Sascha, correct me if I misunderstood your comment.

Looks good. That's exactly what I meant. Maybe the cpu_type field can
even be removed the way you did it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
