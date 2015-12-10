From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 9 Dec 2015 17:19:52 -0800
Message-ID: <CALAqxLV8imuRw5bx=9nub3LxB75kDYR5nusP6CT9JFuwh5C0AA@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<20151208220722.GG4000@usrtlx11787.corpusers.net>
	<CALAqxLXqoEb7VjDpGM8JgKtb=dKgWcpaKbgGzGTOCBu44w-Dfw@mail.gmail.com>
	<10759786.VG6jMebqAj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10759786.VG6jMebqAj@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2015 at 2:07 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 08 December 2015 16:22:40 John Stultz wrote:
>> >> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> >> index 5183d18..ee5dcb7 100644
>> >> --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> >> +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
>> >> @@ -282,6 +282,15 @@
>> >>                       };
>> >>               };
>> >>
>> >> +             reboot_reason: reboot_reason@2a03f65c {
>> >> +                     compatible              = "reboot_reason";
>> >> +                     reg                     = <0x2A03F65C 0x4>;
>> >> +                     reason,none             = <0x77665501>;
>> >> +                     reason,bootloader       = <0x77665500>;
>> >> +                     reason,recovery         = <0x77665502>;
>> >> +                     reason,oem              = <0x6f656d00>;
>> >> +             };
>> >> +
>> >
>> > This address refers to IMEM, which is shared with a number of other
>> > uses. So I think we should have a simple-mfd (and syscon) with this
>> > within.
>>
>> Errr.. I'm going to have to read up there. I'm not super familiar with
>> any of those drivers, so I'll try to see how exactly they would map in
>> here.
>
> Is this an SRAM? We already have a generic SRAM binding, and I think this
> would fit in there.
>
>> > I like the fact that you don't hard code the magics in the
>> > implementation, as I've seen additions from multiple places - so perhaps
>> > it should be made even more flexible.
>> >
>> > OMAP seems to use strings here instead of magics, but the delivery
>> > mechanism looks to be the same. But I think of this as Qualcomm
>> > specific.
>>
>> Yea. This is good feedback. EFI bootloaders have their own
>> implementations as well.  I suspect we'll need a few different driver
>> "types" to handle these differences, ie: value vs string.
>>
>> I'll maybe extend the compatible string to make it clear that this is
>> a "value" style, and we can extend it with a string type later if
>> folks care?
>
> If the two known implementations are already fundamentally different,
> there is a good chance that other vendors have found some more ways
> to do the same thing, so we might need to do this as a framework,
> or merge it into an existing framework.
>
> Maybe it can be done in the same driver that also handles rebooting
> the machine? Those are typically in drivers/power/reset or
> in drivers/watchdog/ for machines that use the watchdog as the only
> way to reboot the machine. We can have additional device specific
> properties along with the reboot method (e.g. a reference to the
> SRAM or some syscon node) and add common code in another file if
> we need it.

Heh. So my original patch to support this was actually tied into the
ps_hold reboot logic in the pinctrl-msm code:
https://git.linaro.org/people/john.stultz/flo.git/commitdiff/55f28281306af2cc6c61aa001030cb90da096ffa?hp=ad39413ecde7acd39c1f017249b1443ce4ef6812

But realizing I'd like to support this same feature on other hardware,
and we'd be duplicating the logic over and over for each device/reboot
method, it seemed having a fairly generic driver would be better.

Looking at a few other devices, I saw one example that wanted both a
string and a value at the same time, so I probably could extend the
driver to have both reason strings and values, and would set which
ever (or both) were specified. That would cover all the cases I've
seen except the UEFI methods.

(Though I suspect I still have to wrap my head more around the DT
bindings side of things)

>> >> +     /* initialize specified reasons from DT */
>> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
>> >> +             reasons[NONE] = val;
>> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,bootloader", &val))
>> >> +             reasons[BOOTLOADER] = val;
>> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,recovery", &val))
>> >> +             reasons[RECOVERY] = val;
>> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,oem", &val))
>> >> +             reasons[OEM] = val;
>> >
>> > I would like for this to be less hard coded.
>>
>> Any tips here on how to do so?
>
> If we move this logic into the qcom reset driver in
> drivers/power/reset/msm-poweroff.c, we should be good.

If the concern is that since DT is basically ABI, one might not want
to have such a wide interface that specifies all the different
reasons, I can understand that. Though I'm really not sure how else we
would be able to specify the device supported the reboot reason logic
w/o having something in the DT (since some device may use the same soc
w/  the same reboot logic may use a different bootloader which doesn't
support the reason methods). At that point if we don't describe the
method clearly, it ends up being something closer to just a quirks
list which we'd have to map internally to behavior, which doesn't seem
great.

Should we run into hardware that the proposed driver doesn't handle,
we can introduce a new driver for those specific semantics, but this
way we can share at least most of the logic, no?

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
