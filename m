From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: device tree: compilation of device tree sources
Date: Sat, 14 Jun 2014 21:01:59 +0200
Message-ID: <20140614190159.GF15686@pengutronix.de>
References: <539AE266.70306@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <539AE266.70306-If5XQcfNmg0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkab-If5XQcfNmg0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 05:07:10PM +0530, Varka Bhadram wrote:
> Hi,
> 
> I cloned the device tree git from: https://kernel.googlesource.com/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing
> 
> When i try to compile the Makefile is throwing errors like this:
> 
> DTC     src/arc/abilis_tb100_dvk.dtb
> 
> dtc: invalid option -- 'i'

Your dtc version is too old. Please upgrade.

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
