From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: running "make dtbs" for test builds
Date: Mon, 18 Jul 2016 14:49:52 +0200
Message-ID: <1887216.FoLArqn3oq@wuerfel>
References: <8924490.SntxSU2FOC@wuerfel> <20160718122947.GA29820@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160718122947.GA29820-q6ZYBFIlbFFi0tQiZxhdj1DQ4js95KgL@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fengguang Wu <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday, July 18, 2016 8:29:47 PM CEST Fengguang Wu wrote:
> >- setting CONFIG_OF_ALL_DTBS will catch all files, not just the
> >  ones that are built by default for the set of configurations you
> >  have. It's possible to simply override this on the command line,
> >  using "make CONFIG_OF_ALL_DTBS=y", it doesn't actually have to
> >  be part of the configuration. The result is independent of the
> >  actual configuration, so it should be enough to do this once
> >  per architecture and source revision.
> >
> >Is this something you can add?
> 
> Do you mean to simply change the main "make" command line to
> 
>         make ARCH=xxx CONFIG_OF_ALL_DTBS=y
> 
> Which looks safe even for ARCHs that do not support it.
> 
> The arch/.../Makefile that actually use it are:
> 
>         arch/arc/boot/dts/Makefile
>         arch/arm/boot/dts/Makefile
>         arch/arm64/boot/dts/Makefile
>         arch/h8300/boot/dts/Makefile
>         arch/metag/boot/dts/Makefile
>         arch/mips/boot/dts/Makefile
>         arch/xtensa/boot/dts/Makefile
> 

Sounds good, thanks!

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
