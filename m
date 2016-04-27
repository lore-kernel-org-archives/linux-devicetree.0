From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: lpc32xx: phy3250: add NAND partitions
 device node
Date: Wed, 27 Apr 2016 11:29:30 -0400
Message-ID: <1461770970.31696.1.camel@localhost>
References: <1461705034-355-1-git-send-email-vz@mleia.com>
	 <1461705034-355-7-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461705034-355-7-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-04-27 at 00:10 +0300, Vladimir Zapolskiy wrote:
> To declare MTD OF partitions NAND controller device node should have
> a special 'partitions' subnode, the change removes a debug message
> from mtd/ofpart on boot:
> 
>   nxp_lpc3220_slc: 'partitions' subnode not found on /ahb/flash@20020000.
>   Trying to parse direct subnodes as partitions.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> ---
> * on conversion added missing 'compatible = "fixed-partitions";',
>   thanks to Sylvain for finding
> 
>  arch/arm/boot/dts/phy3250.dts | 50 +++++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
> 
Acked-by: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
