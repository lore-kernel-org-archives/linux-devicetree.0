Return-Path: <SRS0=kRJY=HH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:46846 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbeDRTPq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Apr 2018 15:15:46 -0400
Date: Wed, 18 Apr 2018 20:15:34 +0100
From: Russell King <rmk@armlinux.org.uk>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
Message-ID: <20180418191534.GA9595@flint.armlinux.org.uk>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-7-git-send-email-t-kristo@ti.com>
 <CAMuHMdWmsnRDBTvv+dy0uGx_6XSVErLHJgR_rQNvepOhAyDg4g@mail.gmail.com>
 <a4bdb4fb-ae22-67be-38a5-8b762859a697@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4bdb4fb-ae22-67be-38a5-8b762859a697@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, wmills@ti.com, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

As already requested, can you *all* please use my linux@armlinux.org.uk
address for this stuff please, and not rmk@armlinux.org.uk - it's
screwing up my mailboxes.  Thanks.

On Wed, Apr 18, 2018 at 10:12:08PM +0300, Tero Kristo wrote:
> On 18/04/18 17:36, Geert Uytterhoeven wrote:
> >On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
> >>The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
> >>a display extension macro, and a few extra peripherals. Two versions
> >>of the evm are supported, the base evm and the latest rev A3 evm. A
> >>common overlay file is used for both boards.
> >>
> >>Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >>---
> >>  arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++
> >>  arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
> >>  arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
> >>  3 files changed, 197 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-common.dtso
> >>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
> >>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm.dtso
> >>
> >>diff --git a/arch/arm/boot/dts/ti/am57xx-evm-common.dtso b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
> >>new file mode 100644
> >>index 0000000..68c3937
> >>--- /dev/null
> >>+++ b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
> >>@@ -0,0 +1,175 @@
> >>+/dts-v1/;
> >>+/plugin/;
> >>+#include <dt-bindings/interrupt-controller/irq.h>
> >>+#include <dt-bindings/gpio/gpio.h>
> >>+#include <dt-bindings/input/input.h>
> >>+
> >>+/ {
> >>+  fragment@101 {
> >>+       target-path = "/";
> >>+
> >>+       __overlay__ {
> >
> >It would be good to have "scripts/dtc: Correct overlay syntactic sugar for
> >generating target-path fragments" in the kernel's copy of dtc, so this
> >section can be converted to sugar syntax, too.
> 
> Ah yea, that seems to be a recent patch I've missed, but yes, if that fixes
> this limitation, it would be a great addition.
> 
> -Tero
> 
> >
> >
> >Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

-- 
Russell King
ARM architecture Linux Kernel maintainer
