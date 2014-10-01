From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: rk3288 : Add PM Domain support
Date: Wed, 01 Oct 2014 13:25:06 -0700
Message-ID: <7h38b7v8pp.fsf@deeprootsystems.com>
References: <1411899774-8484-1-git-send-email-jinkun.hong@rock-chips.com>
	<7hoatvvimd.fsf@deeprootsystems.com>
	<CAD=FV=VPT5qiyY==nJbb4DqKMBnj0i-_MhLRVG0ikar2qtP4=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VPT5qiyY==nJbb4DqKMBnj0i-_MhLRVG0ikar2qtP4=A@mail.gmail.com>
	(Doug Anderson's message of "Wed, 1 Oct 2014 13:07:50 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-doc@vger.kernel.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:

> Kevin,
>
> On Wed, Oct 1, 2014 at 9:51 AM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> +Geert, Ulf
>>
>> "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:
>>
>>> From: "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>
>>> Use PM Domain framework to manage the clock.
>>
>> Which clock?  This changelog needs a more thorough description.
>
>
> I think what he meant was:
>
> Use the generic PM Domain framework for Rockchip
>
> ...but I agree that he could describe it more.
>
>
>> Also,
>> with this series alone, it's not clear how the power-domain transitions
>> ever happen, since I don't see any devices hooked up to your power
>> domains, or do I see your platform using runtime PM.  In order for this
>> to be reviewed properely, it's important for reviewers to be able to see
>> how this PM domain support will be used.
>
> I noticed that too.  As the patchset currently stands it only ever disables...
>
>
>> Also, remember that the DT is supposed to reflect the hardware, not the
>> design choices of linux drivers.  Because of that, it's a little
>> surprising to see clocks as properties of a power domain because clocks
>> are usually properties of devices.
>
> I haven't dug all the way into the hardware to figure out why (or if
> this is really necessary), but right now the rockchip power domain
> driver only leaves these clocks on during the powering on and powering
> off of the power domain.  In other words to turn on the power domain:
>
> 1. Turn on all clocks
> 2. Flip the bit that sets the power domain on
> 3. Wait until hardware says power domain is on.
> 4. Turn off all the clocks.
>
> ...and to turn off:
>
> 1. Turn on all clocks
> 2. Flip the bit that sets the power domain off
> 3. Wait until hardware says power domain is off.
> 2. Turn off all the clocks.
>
> ...if the above is actually necessary when turning on and off power
> domains then it seems like it is actually describing the hardware.

Yes, I understand. The need to have some *device* clocks enabled when
powering on/off the power-domain itself is quite common across many
SoCs.

My point is that these clocks are actually properties of *devices*, not
the power-domain itself.  In the shmobile example I pointed to, the
clocks are properties of the devices in DT, and the devices are attached
to the powerdomain.  When the devices are connected to the power-domain,
the custom attach function looks up all the *device* clocks and and
addes them to the power-domain using pm_clk_add.

Since the clocks are properties of devices, then the pm_clk
infrastructure can be used (as the shmobile example shows) so that the
SoC specific pm-domain doesn't have to manually walk all the clocks, but
instead can just use pm_clk_suspend/pm_clk_resume.

Kevin






--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
