From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 00/06] clocksource: sh_cmt: DT binding rework V4
Date: Mon, 14 Mar 2016 23:23:42 +0900
Message-ID: <20160314142342.17180.21352.sendpatchset@little-apple>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

clocksource: sh_cmt: DT binding rework V4

[PATCH v4 01/06] devicetree: bindings: Remove sh7372 CMT binding
[PATCH v4 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
[PATCH v4 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
[PATCH v4 04/06] devicetree: bindings: Deprecate property, update example
[PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
[PATCH v4 06/06] devicetree: bindings: Remove deprecated properties

Here is the latest and hopefully final take on updating the CMT DT
bindings for R-Car Gen2. In total there are 6 patches that have acks
and are ready to be picked up and merged. Other earlier posted changes
such as driver modification and SoC DTS bits depend on this series.

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

V4 patch series updates the order for the fallback entry format based on
feedback. This new order makes the CMT match the majority of the other
on-chip devices, so "renesas,rcar-gen2-cmt0" is now used over earlier
version "renesas,cmt0-rcar-gen2". The acks have been kept as-is.

Many thanks to Geert, Laurent and Rob for their feedback!

Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> (For patch 1-3)
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

 Written on top of next-20160314

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   83 ++++++---------
 1 file changed, 37 insertions(+), 46 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
