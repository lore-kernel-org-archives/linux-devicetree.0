From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Thu, 14 Nov 2013 12:16:22 -0700
Message-ID: <20131114191622.GC21549@obsidianresearch.com>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <52814AFB.3070600@wwwdotorg.org>
 <CAL_Jsq+mAoN2Lbg+uqfLMTZBvgz28E-EioiaU4BUSL_7rS5JjA@mail.gmail.com>
 <528275B7.6050209@wwwdotorg.org>
 <20131112193012.GR10335@titan.lakedaemon.net>
 <52828C77.20001@wwwdotorg.org>
 <20131114162859.GX10335@titan.lakedaemon.net>
 <52851DC8.203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52851DC8.203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 14, 2013 at 12:00:24PM -0700, Stephen Warren wrote:

> I don't think a distro should need to know the DTB filename at all.
> Rather, the/a bootloader should know which platform it's running on, and
> provide a variable/... to the boot script/... that defines the DTB
> filename. That would completely remove all the knowledge of DTB
> filenames from distros.

At some point the distro has to install a dtb into some cannonical
place so the bootloader can find it..

Are you thinking that distros will have to ship a /boot/dtbs/*.dtb
with every dtb from the kernel build?

What happens when you install two different versions of the kernel?

What about boot schemes that can load a kernel version dependent dtb?

I've said this before - I really think the kernel community will do
itself a big favor if it encourages boot schemes that can handle a
kernel version dependent dtb, rather that design schemes that
absolutely can't allow for that.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
