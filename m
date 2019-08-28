From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Wed, 28 Aug 2019 22:01:51 +0200
Message-ID: <CAFBinCDmi4HN4Ayg4T8aKUeu4hrUmVQ+z-hTN-6XMhiOCUcHjg@mail.gmail.com>
References: <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
 <20190824211158.5900-1-martin.blumenstingl@googlemail.com>
 <3813e658-1600-d878-61a4-29b4fe51b281@linux.intel.com> <CAFBinCA_B9psNGBeDyhkewhoutNh6HsLUN+TRfO_8vuNqhis4Q@mail.gmail.com>
 <48b90943-e23d-a27a-c743-f321345c9151@linux.intel.com> <CAFBinCD1oKxYm8QD7XfZUWq_HC5A4GLMmLCnZrcRvpTxrKo30w@mail.gmail.com>
 <19719490-178a-18fd-64f2-f77d955897f7@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <19719490-178a-18fd-64f2-f77d955897f7@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>
Cc: eswara.kota@linux.intel.com, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, qi-ming.wu@intel.com, robh@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Aug 28, 2019 at 3:53 AM Chuan Hua, Lei
<chuanhua.lei@linux.intel.com> wrote:
[...]
> >>>> 1. reset-lantiq.c use index instead of register offset + bit position.
> >>>> index reset is good for a small system (< 64). However, it will become very
> >>>> difficult to use if you have  > 100 reset. So we use register offset +
> >>>> bit position
> >>> reset-lantiq uses bit bit positions for specifying the reset line.
> >>> for example this is from OpenWrt's vr9.dtsi:
> >>>     reset0: reset-controller@10 {
> >>>       ...
> >>>       reg = <0x10 4>, <0x14 4>;
> >>>       #reset-cells = <2>;
> >>>     };
> >>>
> >>>     gphy0: gphy@20 {
> >>>       ...
> >>>       resets = <&reset0 31 30>, <&reset1 7 7>;
> >>>       reset-names = "gphy", "gphy2";
> >>>     };
> >>>
> >>> in my own words this means:
> >>> - all reset0 reset bits are at offset 0x10 (parent is RCU)
> >>> - all reset0 status bits are at offset 0x14 (parent is RCU)
> >>> - the first reset line uses reset bit 31 and status bit 30
> >>> - the second reset line uses reset bit 7 and status bit 7
> >>> - there can be multiple reset-controller instances, each taking the
> >>> reset and status offsets (OpenWrt's vr9.dtsi specifies the second RCU
> >>> reset controller "reset1" with reset offset 0x48 and status offset
> >>> 0x24)
> >> in reset-lantiq.c, we split each reset request /status pair into one
> >> reset controller.
> >>
> >> Each reset controller handles up to 32 resets. It will create up to 9
> >> even more
> >> reset controllers in the new SoCs. In reality, there is only one RCU
> >> controller for all
> >> SoCs. These designs worked but did not follow what hardware implemented.
> >>
> >> After checking the existing code and referring to other implementation,
> >> we decided to
> >> use register offset + bit position method. It can support all SoCs with
> >> this methods
> >> without code change(device tree change only).
> > maybe I have a different interpretation of what "RCU" does.
> > let me explain it in my own words based on my knowledge about VRX200:
> > - in my own words it is a multi function device with the following
> > functionality:
> > - it contains two reset controllers (reset at 0x10, status 0x14 and
> > reset at 0x48, status at 0x24)
> > - it contains two USB2 PHYs (PHY registers at 0x18, ANA cfg at 0x38
> > and PHY registers at 0x34, ANA cfg at 0x3c)
> > - it contains the configuration for the two GPHY IP blocks (at 0x20 and 0x68)
> > - it contains endianness configuration registers (for PCI, PCIe, ...)
> > - it contains the watchdog boot status (whether the SoC was previously
> > reset by the WDT)
> > - maybe more, but I don't know anything else about it
> In fact, there is only one reset controller for all SoCs even it doesn't
> prevent software from virtualizing multiple reset controllers. Reset
> control does include some misc stuff which has been moved to chiptop in
> new SoCs so that RCU has a clean job.
just to confirm that I understand this correctly:
even the VRX200 SoC only has one physical reset controller?
instead of a contiguous register area (let's say: 0x10 to 0x1c) it
uses four separate registers:
- 0x10 for asserting/deasserting/pulsing the first 32 reset lines
- 0x14 for the status of the first 32 reset lines
- 0x48 for asserting/deasserting/pulsing the second 32 reset lines
- 0x28 for the status of the second 32 reset lines

I'm not surprised that we got some of the IP block layout for the
VRX200 RCU "wrong" - all "documentation" we have is the old Lantiq UGW
(BSP).
with proper documentation (as in a "public datasheet for the SoC") it
would be easy to spot these mistakes (at least I assume that the
quality of the Infineon / Lantiq datasheets is excellent).

back to reset-intel-syscon:
assigning only one job to the RCU hardware is a good idea (in my opinion).
that brings up a question: why do we need the "syscon" compatible for
the RCU node?
this is typically used when registers are accessed by another IP block
and the other driver has to access these registers as well. does this
mean that there's more hidden in the RCU registers?

> >>>> 2. reset-lantiq.c does not support device restart which is part of the
> >>>> reset in
> >>>> old lantiq SoC. It moved this part into arch/mips/lantiq directory.
> >>> it was moved to the .dts instead of the arch code. again from
> >>> OpenWrt's vr9.dtsi [0]:
> >>>     reboot {
> >>>       compatible = "syscon-reboot";
> >>>       regmap = <&rcu0>;
> >>>       offset = <0x10>;
> >>>       mask = <0xe0000000>;
> >>>     };
> >>>
> >>> this sets the reset0 reset bits 31, 30 and 29 at reboot
> >> ok. but not sure why we need to reset bit 31 and 29. global softwre
> >> reset is bit 30.
> > I don't know either. depending on what the LGM SoCs need you can
> > change the "mask" property to the value that fits that SoC best
> >
> > [...]
> All SoCs have only one global software reset bit.
OK
you can still use syscon-reboot to set the soft reset bit if Rob
(dt-binding maintainer) doesn't like the "intel,global-reset" property

[...]
> >>>> 4. Code not optimized and intel internal review not assessed.
> >>> insights from you (like the issue with the reset callback) are very
> >>> valuable - this shows that we should focus on having one driver.
> >>>
> >>>> Based on the above findings, I would suggest reset-lantiq.c to move to
> >>>> reset-intel-syscon.c
> >>> my concern with having two separate drivers is that it will be hard to
> >>> migrate from reset-lantiq to the "optimized" reset-intel-syscon
> >>> driver.
> >>> I don't have access to the datasheets for the any Lantiq/Intel SoC
> >>> (VRX200 and even older).
> >>> so debugging issues after switching from one driver to another is
> >>> tedious because I cannot tell which part of the driver is causing a
> >>> problem (it's either "all code from driver A" vs "all code from driver
> >>> B", meaning it's hard to narrow it down).
> >>> with separate commits/patches that are improving the reset-lantiq
> >>> driver I can do git bisect to find the cause of a problem on the older
> >>> SoCs (VRX200 for example)
> >> Our internal version supports XRX350/XRX500/PRX300(MIPS based) and
> >> latest Lighting Mountain(X86 based). Migration to reset-intel-syscon.c
> >> should be straight forward.
> > what about the _reset callback on the XRX350/XRX500/PRX300 SoCs - do
> > they only use level resets (_assert and _deassert) or are some reset
> > lines using reset pulses (_reset)?
> >
> > when we wanted to switch from reset-lantiq.c to reset-intel-syscon.c
> > we still had to add support for the _reset callback as this is missing
> > in reset-intel-syscon.c currently
> Yes. We have reset pulse(assert, then check the reset status).
only now I realized that the reset-intel-syscon driver does not seem
to use the status registers (instead it's looking at the reset
registers when checking the status).
what happened to the status registers - do they still exist in newer
SoCs (like LGM)? why are they not used?

on VRX200 for example there seem to be some cases where the bits in
the reset and status registers are different (for example: the first
GPHY seems to use reset bit 31 but status bit 30)
this is currently not supported in reset-intel-syscon


Martin
