From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 09 Dec 2015 11:07:25 +0100
Message-ID: <10759786.VG6jMebqAj@wuerfel>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org> <20151208220722.GG4000@usrtlx11787.corpusers.net> <CALAqxLXqoEb7VjDpGM8JgKtb=dKgWcpaKbgGzGTOCBu44w-Dfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLXqoEb7VjDpGM8JgKtb=dKgWcpaKbgGzGTOCBu44w-Dfw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, agross@codeaurora.org, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 08 December 2015 16:22:40 John Stultz wrote:
> >> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> >> index 5183d18..ee5dcb7 100644
> >> --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> >> +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> >> @@ -282,6 +282,15 @@
> >>                       };
> >>               };
> >>
> >> +             reboot_reason: reboot_reason@2a03f65c {
> >> +                     compatible              = "reboot_reason";
> >> +                     reg                     = <0x2A03F65C 0x4>;
> >> +                     reason,none             = <0x77665501>;
> >> +                     reason,bootloader       = <0x77665500>;
> >> +                     reason,recovery         = <0x77665502>;
> >> +                     reason,oem              = <0x6f656d00>;
> >> +             };
> >> +
> >
> > This address refers to IMEM, which is shared with a number of other
> > uses. So I think we should have a simple-mfd (and syscon) with this
> > within.
> 
> Errr.. I'm going to have to read up there. I'm not super familiar with
> any of those drivers, so I'll try to see how exactly they would map in
> here.

Is this an SRAM? We already have a generic SRAM binding, and I think this
would fit in there.

> > I like the fact that you don't hard code the magics in the
> > implementation, as I've seen additions from multiple places - so perhaps
> > it should be made even more flexible.
> >
> > OMAP seems to use strings here instead of magics, but the delivery
> > mechanism looks to be the same. But I think of this as Qualcomm
> > specific.
> 
> Yea. This is good feedback. EFI bootloaders have their own
> implementations as well.  I suspect we'll need a few different driver
> "types" to handle these differences, ie: value vs string.
> 
> I'll maybe extend the compatible string to make it clear that this is
> a "value" style, and we can extend it with a string type later if
> folks care?

If the two known implementations are already fundamentally different,
there is a good chance that other vendors have found some more ways
to do the same thing, so we might need to do this as a framework,
or merge it into an existing framework.

Maybe it can be done in the same driver that also handles rebooting
the machine? Those are typically in drivers/power/reset or
in drivers/watchdog/ for machines that use the watchdog as the only
way to reboot the machine. We can have additional device specific
properties along with the reboot method (e.g. a reference to the
SRAM or some syscon node) and add common code in another file if
we need it.

> >> +     /* initialize specified reasons from DT */
> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
> >> +             reasons[NONE] = val;
> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,bootloader", &val))
> >> +             reasons[BOOTLOADER] = val;
> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,recovery", &val))
> >> +             reasons[RECOVERY] = val;
> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,oem", &val))
> >> +             reasons[OEM] = val;
> >
> > I would like for this to be less hard coded.
> 
> Any tips here on how to do so?

If we move this logic into the qcom reset driver in
drivers/power/reset/msm-poweroff.c, we should be good.

	Arnd
