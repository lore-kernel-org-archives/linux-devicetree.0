From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Tue, 12 Nov 2013 09:51:08 -0500
Message-ID: <20131112145108.GQ10335@titan.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <52814AFB.3070600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52814AFB.3070600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 02:24:11PM -0700, Stephen Warren wrote:
> On 11/11/2013 01:29 PM, Jason Cooper wrote:
> > Consumers of the Linux kernel's build products are beginning to hardcode
> > the filenames of the dtbs generated.  Since the dtb filenames are
> > currently the dts filename s/dts/dtb/, this prevents the kernel
> > community from renaming dts files as needed.
> 
> My take is that the DTB filenames are part of the ABI, and therefore the
> DTS filenames are also part of the ABI. Why would we want to rename them?

This idea originated from a conversation with Olof about starting to
pre-pend the manufacturer name to the dts files:

  https://lkml.org/lkml/2013/11/8/378

imho, at some point there is going to be an ABI breakage wrt dtb names
when the devicetree moves to a separate repository.  All users will have
to rework their scripts at that point.

If that assumption is correct, why not put in place a _good_ ABI that
allows us to be flexible as needed and specific for end users?  If you're
still with me on this idea, shouldn't we put this in place now (as
symlinks, thus retaining old names) so that we can switch over more
easily later?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
