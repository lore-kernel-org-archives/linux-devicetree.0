From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: kbuild: Fix forced rebuild after 'make dtbs'
Date: Fri, 28 Nov 2014 15:10:30 +0100
Message-ID: <CACRpkdYwQT3+RLxP_b_kYJoHV4L7sZ7yiU=JZWVq_zHKz0EY_g@mail.gmail.com>
References: <CACRpkdYmJWy1_vs0tWRA7SvkQnvbXXKqf7pHpH5b5tZ6vR+KJg@mail.gmail.com>
	<1414961549-31666-1-git-send-email-jason@lakedaemon.net>
	<5474F78F.2060906@suse.cz>
	<20141125235150.GH3836@n2100.arm.linux.org.uk>
	<20141126005710.GE22670@titan.lakedaemon.net>
	<CACRpkdZJoWbQeuZ4ZXGbQr0+SNG_9ZA+cQkAA0C2F9rnZDYtyQ@mail.gmail.com>
	<20141126144153.GK3836@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141126144153.GK3836-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 3:41 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Wed, Nov 26, 2014 at 02:57:42PM +0100, Linus Walleij wrote:
>> make -f Makefile -j5 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
>> KBUILD_OUTPUT=build-u300 u300_defconfig
>> make -f Makefile -j5 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
>> KBUILD_OUTPUT=build-u300 zImage CONFIG_DEBUG_SECTION_MISMATCH=y
>> make -f Makefile -j5 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
>> KBUILD_OUTPUT=build-u300 dtbs
>> make -f Makefile -j5 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
>> KBUILD_OUTPUT=build-u300 zImage CONFIG_DEBUG_SECTION_MISMATCH=y
>>
>> -> Rebuilds everything.
>>
>> This doesn't occur before the offending commit. So it only happens
>> when specifying extra environment variables on the command line.
>
> I suspect if you also provide the CONFIG_DEBUG_SECTION_MISMATCH=y on the
> dtbs line, everything will work properly.

Yay, it works! :)

> The problem is that dtbs line executes a prepare, which I guess rebuilds
> the bounds stuff.  So, the dtbs target results in it being rebuilt without
> the section mismatch, and then you re-execute a make with it, causing
> the bounds stuff to be rebuilt again.

Yep. Not very intuitive to require passing section mismatch debug
flags to DTB rebuilding but whatever, it's not so bad I can't live with
it.

Strange that it worked before.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
