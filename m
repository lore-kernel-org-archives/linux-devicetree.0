From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC DTC PATCH] dtc: add symlink (-L) output to dtbs
Date: Fri, 15 Nov 2013 18:09:50 +0100
Message-ID: <CABxcv==rgF8fHL0MBStEsE6WmFs4OyQvuuyPQU4tqXG2NoDrzg@mail.gmail.com>
References: <1384201760-16785-1-git-send-email-jason@lakedaemon.net>
	<52814AFB.3070600@wwwdotorg.org>
	<CAL_Jsq+mAoN2Lbg+uqfLMTZBvgz28E-EioiaU4BUSL_7rS5JjA@mail.gmail.com>
	<528275B7.6050209@wwwdotorg.org>
	<20131112193012.GR10335@titan.lakedaemon.net>
	<52828C77.20001@wwwdotorg.org>
	<20131114162859.GX10335@titan.lakedaemon.net>
	<20131114192629.GE16735@n2100.arm.linux.org.uk>
	<20131115152336.GD10335@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131115152336.GD10335-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Fri, Nov 15, 2013 at 4:23 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Thu, Nov 14, 2013 at 07:26:29PM +0000, Russell King - ARM Linux wrote:
>> We have ways and means to deal with the installation of kernel images
>> and modules.  There's well defined makefile targets for this, and
>> make variables which control where and how these get put.  For the
>> kernel image, you can specify the script to be run (which is called
>> with the location of the *Image file) for copying.  Pulling it manually
>> out of arch/arm/boot is really a failure of the distro packaging people
>> to get their process right.
>>
>> The same goes for the DT files: if we don't provide a method for the
>> kernel build system to install these in a sane way, then that's our
>> failing.  However, distros should be asking for this, and not picking
>> the files out of arch/arm/boot/dts.
>
> Exactly.  V2 hopefully this weekend implementing 'make dtbs-install'

Just a small comment, I think the make target should be called
'dtbs_install and not of 'dtbs-install' to be consistent with make
{modules,firmware,headers}_install

>
> thx,
>
> Jason.
>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
