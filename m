From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V4] kbuild: dtbs_install: new make target
Date: Thu, 21 Nov 2013 07:48:59 +0000
Message-ID: <20131121074859.4CF60C4077A@trevor.secretlab.ca>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net> < 1384896475-8744-1-git-send-email-jason@lakedaemon.net> <528BDEED.8080708@ wwwdotorg.org> <20131120170845.GJ28859@titan.lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120170845.GJ28859-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Nov 2013 12:08:45 -0500, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> I'm still not in favor of installing to /boot/anything since /boot is
> often a separate, small partition.  I even set mine not to automount.
> The number and size of dtbs is only going to grow.  Better to install
> them in a location with lots of space, and /lib is used to having the
> kernel modules installed in it.

This is just the kernel default action. It can be overridden with a
local script or an environment variable. /boot definitely makes more
sense that /lib.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
