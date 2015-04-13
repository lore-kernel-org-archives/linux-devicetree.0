From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v6 1/3] nand: pl353: Add basic driver for arm pl353 smc
 nand interface
Date: Mon, 13 Apr 2015 20:57:12 +0200
Message-ID: <1428951432.3868.21.camel@x220>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
	 <858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <858a607d-7c5a-4066-aa79-ab14c456b8e5-fm2tX0oQAVzb5P7hixJ5yuhlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jussi.kivilinna-X3B1VOXEql0@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, joern-PCqxUs/MD9bYtjvyW6yDsg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-04-13 at 21:42 +0530, Punnaiah Choudary Kalluri wrote:

> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile

> +obj-$(CONFIG_MTD_NAND_PL353)		+= pl353_nand.o

(I think pl353_nand.o can be part of a module. If that's incorrect, you
can stop reading here.) 

> --- /dev/null
> +++ b/drivers/mtd/nand/pl353_nand.c

> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.

This states the license of this driver is GPL v2 or later.

> +MODULE_LICENSE("GPL v2");

And according to include/linux/module.h this states the license is GPL
v2. So either the comment at the top of this file or the license ident
used in the MODULE_LICENSE() macro needs to change.

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
