From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: imx7d: add arch timer
Date: Thu, 28 Jan 2016 16:34:08 +0800
Message-ID: <20160128083408.GP9070@tiger>
References: <1452014237-12848-1-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452014237-12848-1-git-send-email-Frank.Li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org>
Cc: lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 05, 2016 at 11:17:14AM -0600, Frank Li wrote:
> From: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Since uboot v2016.01-rc2, which supported basic psci for i.mx7d.
> So imx7d's second core can be enabled by psci.
> 
> Without arch timer, every timer event will be boardcasted to each core.
> arch timer has local timer irq for each core.
> 
> Signed-off-by: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
