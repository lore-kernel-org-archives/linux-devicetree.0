From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 2/2] Regulator: add driver for Freescale MC34708
Date: Wed, 29 Apr 2015 10:42:19 +0200
Message-ID: <1430296939.2411.103.camel@x220>
References: <20150428141736.16243.57292.stgit@localhost>
	 <20150428141740.16243.79036.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150428141740.16243.79036.stgit@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Just a nit: a license mismatch.

On Tue, 2015-04-28 at 16:17 +0200, Martin Fuzzey wrote:
> --- /dev/null
> +++ b/drivers/regulator/mc34708-regulator.c

> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL v2");

And, according to inlcude/linux/module.h, this states the license is
(just) GPL v2. So I think either to comment at the top of this file or
the ident used in the MODULE_LICENSE() macro should be changed.

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
