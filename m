From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 4/5] soc: Add SoC driver for Freescale Vybrid platform
Date: Thu, 07 Jul 2016 09:22:43 +0200
Message-ID: <5371423.yp5pHjKp9V@wuerfel>
References: <cover.1467872014.git.maitysanchayan@gmail.com> <f600ac1c747813b26c80149b6fdf32d42b114235.1467872014.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f600ac1c747813b26c80149b6fdf32d42b114235.1467872014.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, July 7, 2016 12:09:29 PM CEST Sanchayan Maity wrote:
> root@colibri-vf:/sys/bus/soc/devices/soc0# cat family
> Freescale Vybrid VF610
> root@colibri-vf:/sys/bus/soc/devices/soc0# cat machine
> Freescale Vybrid
> 

I only have one very high-level comment: I think that "family"
is generally supposed to be the more generic one than "machine",
so maybe swap the contents of the two?

Can you have a look at the other users of soc_device and see how
they handle it? I realize that we are already inconsistent about
how we handle it, just try to make it do what the majority of the
others have.

Aside from that, it all looks reasonable.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
