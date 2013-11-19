From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC PATCH V2 2/2] kbuild: dtbs_install: new make target
Date: Tue, 19 Nov 2013 14:54:40 -0500
Message-ID: <20131119195439.GE28859@titan.lakedaemon.net>
References: <20131118192852.GI10335@titan.lakedaemon.net>
 <528A6CA3.9030904@wwwdotorg.org>
 <20131118195243.GJ10335@titan.lakedaemon.net>
 <528A98C8.9040803@wwwdotorg.org>
 <20131119122801.GL16735@n2100.arm.linux.org.uk>
 <20131119142336.GA28859@titan.lakedaemon.net>
 <20131119150212.GM16735@n2100.arm.linux.org.uk>
 <20131119152047.GB28859@titan.lakedaemon.net>
 <20131119152146.GN16735@n2100.arm.linux.org.uk>
 <20131119192246.GP16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131119192246.GP16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 07:22:46PM +0000, Russell King - ARM Linux wrote:
> On Tue, Nov 19, 2013 at 03:21:46PM +0000, Russell King - ARM Linux wrote:
> > On Tue, Nov 19, 2013 at 10:20:47AM -0500, Jason Cooper wrote:
> > > By "That" are you referring to extending the standard for compatible
> > > strings to the board level, or forcing consistent naming on the dts
> > > files?
> > 
> > A consistent file naming on both the dtb and dts files.
> 
> It's time to knock the idea of naming the DT blobs after the compatible
> string on its head as well.  That's really not going to work.  Just
> leave the filenames as is, and move the problem into userspace to solve.

Ack, I was working my way towards that anyway.

> See - by doing this, you are building policy into the kernel build
> system and potentially taking away choice from userspace.

And this is my reason for dropping the idea.  Thanks for clarifying it
for me.  I'll submit a non-RFC version that just copies the files
without the name change.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
