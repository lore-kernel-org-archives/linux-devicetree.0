From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: dts: imx6dl: correct cpufreq volt/freq table
Date: Fri, 05 Dec 2014 10:39:15 +0100
Message-ID: <1417772355.3227.3.camel@pengutronix.de>
References: <1417767829-11314-1-git-send-email-b20788@freescale.com>
	 <1417767829-11314-2-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417767829-11314-2-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 05.12.2014, 16:23 +0800 schrieb Anson Huang:
> Currently the cpufreq volt/freq table we used is
> for LDO enable mode, according to latest datasheet
> Rev. 3, 03/2014, the volt/freq table is as below:
> 
> LDO enabled(min value):
> 996MHz: VDDARM: 1.225V, VDDSOC: 1.150V;
> 792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
> 396MHz: VDDARM: 1.050V, VDDSOC: 1.150V;

>From which datasheet is this? I find it unlikely that the LDO enabled
values are not larger than the LDO bypassed ones. I just had a look at
the "i.MXSolo/6DualLite Automotive and Infotainment Applications
Processors" Datasheet (IMX6SDLAEC) Rev. 3, 03/2014 and the "i.MX
6Solo/6DualLite Applications Processors for Consumer Products" Datasheet
(IMX6SDLCEC) Rev. 3, 03/2014, and they both have different values in
Table 9 (Operating Ranges) for the LDO enabled case:

LDO enabled(min value):
996MHz: VDDARM: 1.350V, VDDSOC: 1.275V;
792MHz: VDDARM: 1.275V, VDDSOC: 1.275V;
396MHz: VDDARM: 1.175V, VDDSOC: 1.275V;

> LDO bypassed(min value):
> 996MHz: VDDARM: 1.250V, VDDSOC: 1.150V;
> 792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
> 396MHz: VDDARM: 1.050V, VDDSOC: 1.150V;
> 
> Adding 25mV to cover board IR drop, for LDO enabled
> mode of 996MHz, VDDARM should be 1.250V, so this
> patch updates it.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
