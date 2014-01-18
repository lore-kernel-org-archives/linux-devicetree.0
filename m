From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v9] clk: corenet: Adds the clock binding
Date: Fri, 17 Jan 2014 19:06:27 -0600
Message-ID: <1390007187.24905.293.camel@snotra.buserror.net>
References: <1389600995-28293-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389600995-28293-1-git-send-email-Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-01-13 at 16:16 +0800, Tang Yuantian wrote:
> +Example for clock block and clock provider:
> +/ {
> +	clockgen: global-utilities@e1000 {
> +		compatible = "fsl,p5020-clockgen", "fsl,qoriq-clockgen-1.0";
> +		ranges = <0x0 0xe1000 0x1000>;
> +		clock-frequency = 133333;

Missing <> around 133333, and the actual p5020ds input clock (based on
observing what U-Boot fills in) is 133333333, not 133333.

I'll fix when applying.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
