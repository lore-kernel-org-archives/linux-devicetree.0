From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Thu, 02 Jun 2016 11:14:30 +0200
Message-ID: <1464858870.24775.65.camel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
	 <5616246.RRQ2rLjLud@wuerfel> <1464850565.24775.40.camel@redhat.com>
	 <3336185.FIBLI6ezsy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3336185.FIBLI6ezsy@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  Hi,

> > Well, it just includes the arm64 version as-is, so we don't have
> > duplication.  I'm open to suggestions to how handle this better.  
> > 
> > Symbolic link?
> > 
> > Reference to ../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> > directly in the Makefile?
> > 
> > I've seen arch/arm/boot/dts/Makefile uses globs on *.dts, so I suspect
> > the later wouldn't be that straight forward.
> 
> It's just weird that the arm64 file includes the .dtsi files from arch/arm/
> and is then again included back from another file there.
> 
> I can see two possible ways to handle this better:
> 
> - leave the complete set of bcm2837 files in arch/arm and then have one
>   reference from arch/arm64 per .dts that refers to just that file.

So basically do it the other way around.  Would be a bit less messy
indeed.

> - come up with a rule to also build the .dtb files in arch/arm64 when
>   we run 'make dtbs' for arch/arm and leave this file there. The argument
>   that one could use the same dtb with a 32-bit kernel should basically
>   hold true for any arm64 system, it's not specific to rpi-3 really.

Yes, in theory.  No, in practice.  As far I know the rpi3 is the only
64bit soc where a almost identical 32bit version exists, so running
32bit kernels on a 64bit processor actually happens in practice and I
expect this to continue.  If you want create sdcard images which run on
any rpi variant this is pretty much the only reasonable way to do it.

>   We don't normally test 32-bit kernels on 64-bit SoCs because 64-bit
>   kernels are more efficient in a number of ways, and I'm sure there
>   are bugs that prevent some systems from working (aside from how some
>   machines cannot work because they don't have RAM below 4GB), but if
>   this is now something that users are interested in, making it just
>   work seems nicer than having a couple of board specific hacks.

See above, I have my doubts that the user interest in this expands to
other boards.  So I'd tend to pick the first option.

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
