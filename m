From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 00/06] clocksource: sh_cmt: DT binding rework V3
Date: Tue, 16 Feb 2016 16:17:22 +0900
Message-ID: <20160216071722.25461.61862.sendpatchset@little-apple>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

clocksource: sh_cmt: DT binding rework V3

[PATCH v3 01/06] devicetree: bindings: Remove sh7372 CMT binding
[PATCH v3 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
[PATCH v3 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
[PATCH v3 04/06] devicetree: bindings: Deprecate property, update example
[PATCH v3 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
[PATCH v3 06/06] devicetree: bindings: Remove deprecated properties

Here are 6 patches that update the CMT DT bindings. All patches have
acks and are ready to be picked up and merged. Other changes such
as driver modification and SoC DTS bits depend on this series.

In short, this series reworks the CMT DT bindings to deal with the following:
- R-Car Gen2 CMT0 and CMT1 hardware instances are not identical
- The property renesas,channels-mask is not enough to describe the difference
- DT should describe the hardware, not the software implementation
- Not all documented DT bindings are actually used

Without these patches the binding "renesas,cmt-48-gen2" is used for both
CMT0 and CMT1 on R-Car Gen2 SoCs. CMT0 and CMT1 are currently seen by the
Linux device driver as compatible hardware, and the device-specific property
"renesas,channels-mask" is used to point out some of the hardware configuration
differences. Since the driver is not feature complete only some differences are
described and when diving into the data sheet we can see that:

1) CMT0 is not 48-bit at all, instead it only supports 32-bit counters.
2) Some channels of CMT1 are 48-bit, some 32-bit.
3) A couple of CMT1 channels have even more features.

It turns out that none of the above differences are described in our current
DT files. And since we use the same compat string for CMT0 and CMT1 the driver
itself cannot enable features specific only to CMT1 without first updating
the DTS. So this series is ground work for future feature patches.

It seems that we have two choices if we want to support CMT1 features:
A) Keep existing DT bindings, add more properties for CMT1
B) Rework the compatible strings and keep configuration in the driver

Judging by above it seems that DT update is inevitable. In my mind it is
rather painful to update the DT so I'd like to minimize the number of
updates and let the majority of the changes only happen in the driver.
And since we should really describe hardware in DT but driver features tend
to be implemented incrementally then B) seems like a good fit to me.

I wouldn't mind going with A) but to be honest I must say that the existing
compat string "renesas,cmt-48-gen2" is just too confusing with "48"
(when CMT0 is 32bit-only) and also "gen2" (used without product line R-Car).

Because of that I've gone with B) and reworked the bindings to separate
CMT0 from CMT1 and keep channel configuration in the device driver.

While at it I've deprecated "renesas,channels-mask" and the old DT compat
strings. Per-SoC compat strings have also been reworked, but are not left
around documented as deprecated since they were never used by the driver.

V3 patch series drops everything but DT binding documentation patches
and also adds acks from Rob Herring. Actual patches are unchanged.

Many thanks to Geert, Laurent and Rob for their feedback!

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (For patch 1-3)
Acked-by: Rob Herring <robh@kernel.org>
---

 Written against renesas-drivers-2016-02-09-v4.5-rc3

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   85 ++++++---------
 1 file changed, 38 insertions(+), 47 deletions(-)
