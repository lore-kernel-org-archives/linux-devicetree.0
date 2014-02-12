From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC/PATCH 0/3] Add devicetree scanning for randomness
Date: Wed, 12 Feb 2014 13:45:21 -0500
Message-ID: <20140212184521.GO27395@titan.lakedaemon.net>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
 <201402121251.06280.arnd@arndb.de>
 <20140212174554.GM27395@titan.lakedaemon.net>
 <1571508.yGAAZ8TNH0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1571508.yGAAZ8TNH0@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 07:17:41PM +0100, Arnd Bergmann wrote:
> On Wednesday 12 February 2014 12:45:54 Jason Cooper wrote:
> > I brought this up at last weeks devicetree irc meeting.  My goal is to
> > provide early randomness for kaslr on ARM.  Currently, my idea is modify
> > the init script to save an additional random seed from /dev/urandom to
> > /boot/random-seed.
> > 
> > The bootloader would then load this file into ram, and pass the
> > address/size to the kernel either via dt, or commandline.  kaslr (run in
> > the decompressor) would consume some of this randomness, and then
> > random.c would consume the rest in a non-crediting initialization.
> 
> I like the idea, but wouldn't it be easier to pass actual random data
> using DT, rather than the address/size?

I thought about that at first, but that requires either that the
bootloader be upgraded to insert the data, or that userspace is
modifying the dtb at least twice per boot.

I chose address/size to facilitate modifying existing/fielded devices.
The user could modify the dtb once, and modify the bootloader
environment to load X amount to Y address.  As a fallback, it could be
expressed on the commandline for non-DT bootloaders.

So I'm not against the idea of random-seed,{start,size} and a
random-seed,blob.  I would just like the former to be available for
folks interested in the capability on existing hardware w/o upgrading
the bootloader.

> That way we could even use the same DT binding for passing randomness
> from the bootloader, whereever it may have found that.

The problem lies in defining "whereever" ;)

> If the bootloader has internet connectivity, it could even mix in
> some data from http://www.random.org/cgi-bin/randbyte?nbytes=256&format=f
> ;-)

Gah!  Arnd, you just about gave me a heart attack.  And http no less.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
