From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V6] kbuild: dtbs_install: new make target
Date: Sun, 29 Mar 2015 21:04:11 +0000
Message-ID: <20150329210411.GA8688@io.lakedaemon.net>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
 <1385942188-21831-1-git-send-email-jason@lakedaemon.net>
 <20150328132320.GA24391@n2100.arm.linux.org.uk>
 <20150328155822.GA25778@io.lakedaemon.net>
 <CAOesGMh4Xyyn5mDDo5_88pvZgdVJ-33UYvm8Y_9UNALfsqrytg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMh4Xyyn5mDDo5_88pvZgdVJ-33UYvm8Y_9UNALfsqrytg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 29, 2015 at 01:34:41PM -0700, Olof Johansson wrote:
> On Sat, Mar 28, 2015 at 8:58 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > Russell,
> >
> > On Sat, Mar 28, 2015 at 01:23:20PM +0000, Russell King - ARM Linux wrote:
> >> Okay, I'm digging up an old version of this patch - v7 was merged but
> >> I find *nowhere* where that version was posted to people involved in
> >> this discussion.
> >
> > fwiw, I just went through my archive of patch submissions:
> >
> > $ ls ~/projects/linux/dtbs_install/
> > v2  v3  v4  v5  v6
> > $
> >
> > I never wrote a v7.  :-(  Regardless,
> 
> It was posted by Grant, and posted to LKML, devicetree@ and
> linux-kbuild. The patch was directly cc:d to Jason, Michal Marek,
> Russell and Rob Herring.

Ah, now I found it:

  http://lkml.iu.edu/hypermail/linux/kernel/1402.0/01294.html

My initial search missed it because it didn't have v7 in the subject.
I should just trust the Google, and not my grep-fu.  :-)

Thanks for the clarification.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
