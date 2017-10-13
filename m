From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl: Remove leading zeroes from unit
 addresses
Date: Fri, 13 Oct 2017 12:53:39 +0800
Message-ID: <20171013045337.GF8833@dragon>
References: <1506017410-13263-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506017410-13263-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWPLiZjB17Co1B2eb7JE58TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 03:10:10PM -0300, Marco Franchi wrote:
> The following build warnings are seen with W=1:
> 
> Warning (simple_bus_reg): Node /soc/sram@00900000 simple-bus unit 
> address format error, expected "900000"
> Warning (simple_bus_reg): Node /soc/aips-bus@02000000 simple-bus unit 
> address format error, expected "2000000"
> Warning (simple_bus_reg): Node /soc/aips-bus@02000000/pxp@020f0000 
> simple-bus unit address format error, expected "20f0000"
> (...)
> 
> Remove the leading zeroes from unit addresses to fix the warnings.
> 
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
