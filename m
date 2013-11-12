From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Tue, 12 Nov 2013 15:08:07 -0500
Message-ID: <20131112200807.GS10335@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <52814AFB.3070600@wwwdotorg.org>
 <CAL_Jsq+mAoN2Lbg+uqfLMTZBvgz28E-EioiaU4BUSL_7rS5JjA@mail.gmail.com>
 <528275B7.6050209@wwwdotorg.org>
 <20131112193012.GR10335@titan.lakedaemon.net>
 <20131112194009.GA13577@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131112194009.GA13577-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 08:40:09PM +0100, Andrew Lunn wrote:
> > 2) right now: distributions are creating utilities, such a flash-kernel
> > in Debian, that pick from a slew of dtbs, append it to the zImage, and
> > create the uImage.  The bootloaders in these installs don't have support
> > for fdt.
> > 
> > Our problem (as I see it) is that #2 is creating an ABI out of something
> > we never realized would become an ABI, the filenames created by 'make
> > dtbs'.
> 
> Well, flash-kernel could be taught how to parse .dtb files to get the
> compatibility strings out of them, rather than use filenames.
> 
> It might still be early enough to give distributions some guidelines
> about what DT folks consider ABI and what is not. How they should find
> a fitting .dtb file and how they should not.

True, but this isn't a 'search /boot/config-X for CONFIG_Y so we can
configure for Z' *cough* *grub* *cough*.  flash-kernel currently doesn't
have any more correct way to select dtbs than by filename.

It's normal to look for arch/<arch>/boot/zImage after a build.  Module
names are not 1-1 with object files or source files, they are unique,
and static.  Our failure was not providing a similar ABI for the dtbs.
imho, we messed up, so we should fix it.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
