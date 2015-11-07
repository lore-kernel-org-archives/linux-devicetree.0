From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: Provide static inline function for of_translate_address if needed
Date: Sat, 07 Nov 2015 10:02:20 +0100
Message-ID: <3724502.6sHTjrfvab@wuerfel>
References: <1446866902-31492-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446866902-31492-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 06 November 2015 19:28:22 Guenter Roeck wrote:
> If OF_ADDRESS is not configured, builds can fail with errors such as
> 
> drivers/net/ethernet/hisilicon/hns_mdio.c:
> 	In function 'hns_mdio_bus_name':
> drivers/net/ethernet/hisilicon/hns_mdio.c:411:3:
> 	error: implicit declaration of function 'of_translate_address'
> 
> as currently seen when building sparc:allmodconfig.
> 
> Introduce a static inline function if OF_ADDRESS is not configured to fix
> the build failure. Return OF_BAD_ADDR in this case. For this to work, the
> definition of OF_BAD_ADDR has to be moved outside CONFIG_OF conditional
> code.
> 
> Fixes: 876133d3161d ("net: hisilicon: add OF dependency")
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Thanks for the fix.

Rob/Frank, any chance we get this into -rc1 through your tree?

The background is that a bugfix I did for a network driver started
causing the build error on sparc allmodconfig, and it would be nice
to have 4.4-rc1 build fine without having to back out my fix.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
