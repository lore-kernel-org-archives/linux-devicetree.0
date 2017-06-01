From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: versatile: use #include "..." to include local
 DT
Date: Thu, 1 Jun 2017 16:52:51 -0700
Message-ID: <20170601235251.GB13314@localhost>
References: <1495602610-18667-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495602610-18667-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 24, 2017 at 02:10:10PM +0900, Masahiro Yamada wrote:
> Most of DT files in ARM use #include "..." to make pre-processor
> include DT in the same directory, but this is one of the exceptional
> files that use #include <...> for that.
> 
> Fix it to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts path from
> dtc_cpp_flags.
> 
> ARM: dts: versatile: use #include "..." to include DT in the same directory
> 
> Most of DT files in ARM use #include "..." to make pre-processor
> include DT in the same directory, but we have 3 exceptional files
> that use #include <...> for that.
> 
> They must be fixed to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts
> path from dtc_cpp_flags.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
> Arnd, Olof,
> I could not find a sub-arch maintainer for versatile.
> If nobody picks up this, could you take care of this?

Applied to fixes. Thanks!


-Olof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
