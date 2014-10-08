From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/7] ARM: meson: add support for Meson8
Date: Wed, 08 Oct 2014 21:30:09 +0200
Message-ID: <59241134.gsbhNQV8Wa@wuerfel>
References: <1412546359-15062-1-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412546359-15062-1-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 05 October 2014 23:59:12 Beniamino Galvani wrote:
> 
> this patchset introduces support for Amlogic Meson8, which is a family
> of quad-core Cortex-A9 SoCs used in tablets and set-top boxes.
> 
> Changes since v1:
>  - reused the existing DT machine definition and renamed it to be more
>    generic
>  - added L2 cache support

Looks all good to me

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
