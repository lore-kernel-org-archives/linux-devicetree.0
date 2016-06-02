From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Thu, 02 Jun 2016 17:11:31 +0200
Message-ID: <1464880291.24775.111.camel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
	 <3336185.FIBLI6ezsy@wuerfel> <1464858870.24775.65.camel@redhat.com>
	 <4795604.XAe8xnhung@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4795604.XAe8xnhung@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  Hi,

> > > > Reference to ../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> > > > directly in the Makefile?

Actually tried that, and to my surprise this worked fine for both "make
dtbs" and "make dtbs_install".

So we should just do that I guess ...

> > Yes, in theory.  No, in practice.  As far I know the rpi3 is the only
> > 64bit soc where a almost identical 32bit version exists, so running
> > 32bit kernels on a 64bit processor actually happens in practice and I
> > expect this to continue.  If you want create sdcard images which run on
> > any rpi variant this is pretty much the only reasonable way to do it.
> 
> I think the Allwinner A64 and the Samsung s5p6818 are other examples
> for this, where the initial run of boards all run 32-bit kernels
> for much of the same reasons. If users want to run a 32-bit distro
> on rpi-3 and on e.g. orange-pi, I don't see why they wouldn't also run
> the same binary on A64.

... and others can join the party on a case-by-case basis.

I still expect for the majority of arm64 boards it is not very useful,
so I don't think we should build all of them unconditionally.

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
