From: Philipp Zabel <pza-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: dts: imx6dl: correct cpufreq volt/freq table
Date: Sun, 7 Dec 2014 11:59:25 +0100
Message-ID: <20141207105925.GA11699@pengutronix.de>
References: <1417767829-11314-1-git-send-email-b20788@freescale.com>
 <1417767829-11314-2-git-send-email-b20788@freescale.com>
 <1417772355.3227.3.camel@pengutronix.de>
 <BN1PR0301MB06282A4A937E613A778CF6A5FF790@BN1PR0301MB0628.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BN1PR0301MB06282A4A937E613A778CF6A5FF790-RQSpjbwlmjRcEY/EnGXkZZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 05, 2014 at 09:58:15AM +0000, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> Hi, Philipp
> 	The table you listed is VDDARM_IN and VDDSOC_IN which is for external PMIC and we normally do NOT adjust them when cpufreq change, we only adjust the internel LDO output, my table is for VDDARM_CAP and VDDSOC_CAP which are in the comment column, for LDO output.
> 
> For LDO enabled mode, VDDARM/SOC_CAP is the output of LDO, we pass this table to kernel opp.
> For LDO bypassed mode, VDDARM/SOC_IN = VDDARM/SOC_CAP.

Now I feel stupid. Obviously the operating-points' CPU voltages are at the
LDO output and shouldn't change if the LDO is bypassed. Thank you for the
clarification, and sorry for not thinking this through at first. After
looking at the correct column, feel free to consider this change
Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
