From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6 0/6] ARM: imx: Add Freescale LS1021A SoC and board
 support
Date: Sun, 26 Oct 2014 08:23:55 +0800
Message-ID: <20141026002354.GC6973@tiger>
References: <1414145327-23541-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414145327-23541-1-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 06:08:41PM +0800, Jingchang Lu wrote:
> This series contain the support for Freescale LS1021A CPU and LS1021A-QDS
> and LS1021A-TWR board.
> 
> The LS1021A SoC combines two ARM Cortex-A7 cores that have been optimized
> for high reliability and pack the highest level of integration available
> for sub-3W embedded communications processors and with a comprehensive
> enablement model focused on ease of programmability.
> 
> The LS1021A SoC shares IPs with i.MX family, Vybrid family and Freescale
> PowerPC platform. 
> 
> For the detail information about LS1021A SoC, please refer to the RM doc.
> 
> ---
> changes in v6:
>  add dts patch description.
>  remove '-' from QDS and TWR board dts name for consistence with u-boot.

I'm not sure it's a good idea.  The most idiomatic DTS naming schema is
just <socname>-<boardname>.dts.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
