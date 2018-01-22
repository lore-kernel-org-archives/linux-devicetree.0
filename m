From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v6 26/41] ARM: da8xx: add new USB PHY clock init using
 common clock framework
Date: Mon, 22 Jan 2018 11:17:03 -0600
Message-ID: <e23bf869-cdbd-bd70-3f43-69c6ec03d95c@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-27-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516468460-4908-27-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/20/2018 11:14 AM, David Lechner wrote:
> This adds the new USB PHY clock init in mach-davinci/usb-da8xx.c using
> the new common clock framework drivers.
> 
> The #ifdefs are needed to prevent compile errors until the entire
> ARCH_DAVINCI is converted.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
> 
> v6 changes:
> - rename stuff to match changes in "clk: davinci: New driver for TI DA8XX USB
>    PHY clocks"
> - take advantage of syscon lookup changes in "mfd: syscon: Add syscon_register()
>    function"
> 
>   arch/arm/mach-davinci/usb-da8xx.c | 78 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-davinci/usb-da8xx.c b/arch/arm/mach-davinci/usb-da8xx.c

...

> +/**
> + * da8xx_register_usb20_phy_clk - register USB0PHYCLKMUX clock
> + *
> + * @use_usb_refclkin: Selects the parent clock - either "usb_refclkin" if true
> + *	or "pll0_aux_clk" if false.
> + */

Should say "pll0_auxclk" instead of "pll0_aux_clk".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
