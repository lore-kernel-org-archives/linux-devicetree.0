From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Tue, 14 Mar 2017 10:29:07 -0700
Message-ID: <b8c7bdeb-ed34-4d08-39e5-4256c3671ab1@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170312175118.GP21222@n2100.armlinux.org.uk>
 <191ef88d-2925-2264-6c77-46647394fc72@gmail.com>
 <20170312192932.GQ21222@n2100.armlinux.org.uk>
 <58b30bca-20ca-d4bd-7b86-04a4b8e71935@gmail.com>
 <c6eda3b3-52b8-8560-8f46-a6e2d6303bbd@gmail.com>
 <fa07c8d2-0943-b7d1-8d37-76e03bd527c0@gmail.com>
 <20170312204037.GU21222@n2100.armlinux.org.uk>
 <20170312210952.GV21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170312210952.GV21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, robert.jarzmik-GANU6spQydw@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, sakari.ailus
List-Id: devicetree@vger.kernel.org



On 03/12/2017 02:09 PM, Russell King - ARM Linux wrote:
> On Sun, Mar 12, 2017 at 08:40:37PM +0000, Russell King - ARM Linux wrote:
>> On Sun, Mar 12, 2017 at 01:36:32PM -0700, Steve Longerbeam wrote:
>>> But hold on, if my logic is correct, then why did the CSI power-off
>>> get reached in your case, multiple times? Yes I think there is a bug,
>>> link_notify() is not checking if the link has already been disabled.
>>> I will fix this. But I'm surprised media core's link_notify handling
>>> doesn't do this.
>> Well, I think there's something incredibly fishy going on here.  I
>> turned that dev_dbg() at the top of the function into a dev_info(),
>> and I get:
>>
>> root@hbi2ex:~# dmesg |grep -A2 imx-ipuv3-csi
>> [   53.370949] imx-ipuv3-csi imx-ipuv3-csi.0: power OFF
>> [   53.371015] ------------[ cut here ]------------
>> [   53.371075] WARNING: CPU: 0 PID: 1515 at drivers/staging/media/imx/imx-media-csi.c:806 csi_s_power+0xb8/0xd0 [imx_media_csi]
>> --
>> [   53.372624] imx-ipuv3-csi imx-ipuv3-csi.0: power OFF
>> [   53.372637] ------------[ cut here ]------------
>> [   53.372663] WARNING: CPU: 0 PID: 1515 at drivers/staging/media/imx/imx-media-csi.c:806 csi_s_power+0xb8/0xd0 [imx_media_csi]
>>
>> There isn't a power on event being generated before these two power
>> off events.  I don't see a power on event even when I attempt to
>> start streaming either (which fails due to the lack of bayer
>> support.)
> Found it - my imx219 driver returns '1' from its s_power function when
> powering up, which triggers a bug in your code - when imx_media_set_power()
> fails to power up, you call imx_media_set_power() telling it to power
> everything off - including devices that are already powered off.

Yep, there's a bug in the error cleanup in imx_media_pipeline_set_power().
On error, it needs to backout by calling s_power(off) as it is doing, 
but not
through the whole pipeline, but needs to stop at the subdev encountered
just before the subdev that failed. This was causing the s_power() 
imbalance.
I will fix.


>
> This is really bad news - s_power() may be called via other paths,
> such as when the subdev is opened.

I don't think that is a problem, as long as power_count is working
as it should, and the caller from the other paths has not created an
imbalance.

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
