From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [patch 2/7] dt: dtb version: document chosen/dtb-info node
 binding
Date: Thu, 19 Mar 2015 19:32:25 +0000
Message-ID: <20150319193225.GH8656@n2100.arm.linux.org.uk>
References: <550A42AC.8060104@gmail.com>
 <550A4382.4030209@gmail.com>
 <CAL_Jsq+sPkZtreQ0sp8KXpkUVpFy=Yh9dr249u8uyoa8yksjmg@mail.gmail.com>
 <20150319184139.GG8656@n2100.arm.linux.org.uk>
 <550B1D16.7000108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <550B1D16.7000108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 19, 2015 at 12:01:42PM -0700, Frank Rowand wrote:
> On 3/19/2015 11:41 AM, Russell King - ARM Linux wrote:
> What???  Why would we ever accept code that tested the dtb version
> instead of the compatible strings and properties in device nodes?
> The dtb version is a meaningless number just like the kernel version
> number in /proc/version is a meaningless number.  It starts at 1 (and
> can be reset to 1 anytime the person controlling the build environment
> chooses to for any random reason).  The dtb version number only makes
> sense in a local context to check which build of an object actually
> got onto the target.

I think you need to learn a lesson here.  I rotfled at your "just like
the kernel version number" comment, because we already have code in the
kernel to map 3.x and 4.x kernels to a 2.60.x number because userspace
breaks with 3.x and 4.x version numbers.

I'm quite sure that someone made the exact same argument about kernel
version numbers that you're making above about versioning dtb stuff.

At the end of the day, if userspace starts abusing an API that we've
provided in good faith, and we change something such as the version
information which results in userspace breaking - even if userspace is
doing something that's wrong according to how we've defined it, it's
still our problem to fix.  No userspace regressions when upgrading.
That's the rule.

Don't bother trying to argue against this - you can't.  We will not accept
any argument (no matter how valid) which will result in userspace breaking
upon an upgrade.

You must be *absolutely* *sure* that you want to export this information,
and that you are absolutely happy with the consequences which would occur
should userspace then start using this information in a way which you did
not intend, which could very well block you from ever being able to change
the version number from a prescribed "this version number makes userspace
work" value.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
