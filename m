From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH V2 2/2] kbuild: dtbs_install: new make target
Date: Tue, 19 Nov 2013 12:28:01 +0000
Message-ID: <20131119122801.GL16735@n2100.arm.linux.org.uk>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> <cover.1384798508.git.jason@lakedaemon.net> <eaf050fbd62803784856a4f37d4b332f7778e22c.1384798508.git.jason@lakedaemon.net> <528A65DF.8060000@wwwdotorg.org> <20131118191955.GG10335@titan.lakedaemon.net> <528A6944.3070303@wwwdotorg.org> <20131118192852.GI10335@titan.lakedaemon.net> <528A6CA3.9030904@wwwdotorg.org> <20131118195243.GJ10335@titan.lakedaemon.net> <528A98C8.9040803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528A98C8.9040803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 03:46:32PM -0700, Stephen Warren wrote:
> Again, the point is not that it's hard to write the script. As you
> demonstrated, it's easy. The problem is that then, everybody has to do
> something different for Tegra, forever. No matter how small the actual
> cost of doing it is, it's still non-scalable to require that everyone
> know about this special case. I'm not convinced the issue would be
> isolated to Tegra either.

That's why there's the facility to allow an override to the script,
just like there's the facility to override the default script when
running "make install".

The script which the kernel uses is just a template for what kernel
developers expect to be the common case.  That's not necessarily what
most distros do.

In fact, most distros today provide their own installation script which
gets run automatically when you do "make install" which copies the
kernel and then rebuilds an initramfs with everything appropriate for
that kernel inside.

Even the distro script can be overridden with a script in ~/bin by the
user running "make install" (which therefore doesn't even have to be
root if installing it into a location accessible by the user.)

This is really no different.  If the as-supplied-by-the-kernel script
doesn't fit your needs, you are free to override it.

What this gives us is the facility for distros to _sanely_ hook into
the kernel build process to obtain the DT files if they so wish.

As for renaming the files from what we have in the kernel, I'd say...
why bother.  What if we have two DT blobs with the same compatible
string (which is not unlikely when you have two configurations for a
platform)?  I'd recommend keeping the names in the kernel tree when
installing.  If a distro needs to find the compatible string, then
that's a bit of parsing they should do.  Otherwise, we lose the ability
to tell users "you need this DT blob file called X" because X will
depend whether it's been installed or not.

And in some cases where getting the wrong DT blob could end up quite
literally destroying your hardware (eg, by setting an LDO regulator to
bypass mode), it's extremely important that anything here is _simple_
and doesn't involve lots of indirection.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
