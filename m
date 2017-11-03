From: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] openrisc: dts: Add OpenRISC platform SoC
Date: Fri, 3 Nov 2017 14:04:42 +0900
Message-ID: <20171103050442.GJ29237@lianli.shorne-pla.net>
References: <20171022024641.28478-1-shorne@gmail.com>
 <20171022024641.28478-4-shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171022024641.28478-4-shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 22, 2017 at 11:46:41AM +0900, Stafford Horne wrote:
> Add devicetree binding documentation for the OpenRISC platform
> opencores,or1ksim.  This is the main OpenRISC reference platform
> supporting multiple FPGA SoC's.
> 
> This format is based on some of the mips binding docs as we have
> similar requirements.
> 
> Also, update maintainers so openrisc related binding changes are visible
> to the openrisc team.
> 

[..]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a57d13cb414d..71e4f6762196 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10008,6 +10008,7 @@ T:	git git://github.com/openrisc/linux.git
>  L:	openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org
>  W:	http://openrisc.io
>  S:	Maintained
> +F;	Documentation/devicetree/bindings/openrisc/

FYI, I found this typo (; vs :) which I have fixed and am pushing to next.

>  F:	Documentation/openrisc/
>  F:	arch/openrisc/
>  F:	drivers/irqchip/irq-or1k-*
> -- 
> 2.13.6
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
