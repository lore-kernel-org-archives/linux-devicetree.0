From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Thu, 10 Dec 2015 15:52:19 +0100
Message-ID: <1721197.gFcIQMjGvs@wuerfel>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org> <10759786.VG6jMebqAj@wuerfel> <CALAqxLV8imuRw5bx=9nub3LxB75kDYR5nusP6CT9JFuwh5C0AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CALAqxLV8imuRw5bx=9nub3LxB75kDYR5nusP6CT9JFuwh5C0AA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 09 December 2015 17:19:52 John Stultz wrote:
> On Wed, Dec 9, 2015 at 2:07 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tuesday 08 December 2015 16:22:40 John Stultz wrote:
> >> >> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> >
> > If the two known implementations are already fundamentally different,
> > there is a good chance that other vendors have found some more ways
> > to do the same thing, so we might need to do this as a framework,
> > or merge it into an existing framework.
> >
> > Maybe it can be done in the same driver that also handles rebooting
> > the machine? Those are typically in drivers/power/reset or
> > in drivers/watchdog/ for machines that use the watchdog as the only
> > way to reboot the machine. We can have additional device specific
> > properties along with the reboot method (e.g. a reference to the
> > SRAM or some syscon node) and add common code in another file if
> > we need it.
> 
> Heh. So my original patch to support this was actually tied into the
> ps_hold reboot logic in the pinctrl-msm code:
> https://git.linaro.org/people/john.stultz/flo.git/commitdiff/55f28281306af2cc6c61aa001030cb90da096ffa?hp=ad39413ecde7acd39c1f017249b1443ce4ef6812
> 
> But realizing I'd like to support this same feature on other hardware,
> and we'd be duplicating the logic over and over for each device/reboot
> method, it seemed having a fairly generic driver would be better.
> 
> Looking at a few other devices, I saw one example that wanted both a
> string and a value at the same time, so I probably could extend the
> driver to have both reason strings and values, and would set which
> ever (or both) were specified. That would cover all the cases I've
> seen except the UEFI methods.
> 
> (Though I suspect I still have to wrap my head more around the DT
> bindings side of things)

The problem is actually something else: from the two machines we looked
at, it's clear that the reboot-reason is not actually something that
is hardware specific, but instead depends on the bootloader. HTC
has its own loader for Tegra, so we can't put the implementation into
the Tegra reboot driver because that wouldn't work on non-HTC machines,
and conversely, another device from HTC that uses a Qualcomm chip might
use the machine vendor specific method rather than the SoC vendor designed
one.

There are actually tons of different ways to do the same thing, including
the PC nvram, the Nokia N900 method that has been discussed to no
end because it relies on ATAGS, IBM has a key-value pair method for
open firmware using NVRAM, and Broadcom uses their own layout on a
number of different devices (nvram, eeprom, NOR-flash, NAND-flash).

> >> >> +     /* initialize specified reasons from DT */
> >> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
> >> >> +             reasons[NONE] = val;
> >> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,bootloader", &val))
> >> >> +             reasons[BOOTLOADER] = val;
> >> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,recovery", &val))
> >> >> +             reasons[RECOVERY] = val;
> >> >> +     if (!of_property_read_u32(pdev->dev.of_node, "reason,oem", &val))
> >> >> +             reasons[OEM] = val;
> >> >
> >> > I would like for this to be less hard coded.
> >>
> >> Any tips here on how to do so?
> >
> > If we move this logic into the qcom reset driver in
> > drivers/power/reset/msm-poweroff.c, we should be good.
> 
> If the concern is that since DT is basically ABI, one might not want
> to have such a wide interface that specifies all the different
> reasons, I can understand that. Though I'm really not sure how else we
> would be able to specify the device supported the reboot reason logic
> w/o having something in the DT (since some device may use the same soc
> w/  the same reboot logic may use a different bootloader which doesn't
> support the reason methods). At that point if we don't describe the
> method clearly, it ends up being something closer to just a quirks
> list which we'd have to map internally to behavior, which doesn't seem
> great.
> 
> Should we run into hardware that the proposed driver doesn't handle,
> we can introduce a new driver for those specific semantics, but this
> way we can share at least most of the logic, no?

I think we need a layered approach, with some high-level code to
store the boot reason, but then support firmware specific backends
to that. If we just need a phandle for an SRAM partition and an offset
within it, that can be done by the high-level driver, but not
any of the more sophisticated communication methods.

	Arnd
