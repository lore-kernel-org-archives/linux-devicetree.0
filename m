Return-Path: <devicetree-owner@kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:58434 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754028AbbLSPuJ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 19 Dec 2015 10:50:09 -0500
Date: Sat, 19 Dec 2015 16:49:36 +0100
From: Karsten Merker <merker@debian.org>
Subject: Re: [linux-sunxi] Re: [PATCH 1/4] ARM: dts: sun7i: Enable
 touchscreen on Wexler TAB7200 tablet
Message-ID: <20151219154936.GA1845@excalibur.cnev.de>
References: <1450428591-5597-1-git-send-email-mamlinav@gmail.com>
 <1450428710-5653-1-git-send-email-mamlinav@gmail.com>
 <20151218212525.GR30359@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151218212525.GR30359@lukather>
Sender: devicetree-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Aleksei Mamlin <mamlinav@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree <devicetree@vger.kernel.org>, dev@linux-sunxi.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 18, 2015 at 10:25:25PM +0100, Maxime Ripard wrote:
> On Fri, Dec 18, 2015 at 11:51:50AM +0300, Aleksei Mamlin wrote:
> > Add a node for the Goodix GT911 touchscreen found on the Wexler TAB7200 tablet
> > 
> > Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
> > ---
> >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > index 239b5d2..ec3b837 100644
> > --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > @@ -102,6 +102,18 @@
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&i2c2_pins_a>;
> >  	status = "okay";
> > +
> > +	gt911: touchscreen@5d {
> > +		compatible = "goodix,gt911";
> > +		reg = <0x5d>;
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>; /* EINT21 (PH21) */
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&ts_reset_pin>;
> > +		irq-gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>; /* INT (PH21) */
> 
> It seems odd that you need both irq-gpios and interrupts. These two
> are completely redundant, and you should even actually use only one in
> your driver, since the second request_irq will fail.

Hello,

there is a "specialty" on this type of touchscreen controller -
the irq pin on the GT9xx series of chips has two distinct
functions:

The first is the regular function for signalling interrupts to
the CPU, which is set up with the "interrupts" property.

The second function comes into play when initializing the chip. 
Without a special initialization procedure, the chip provides
basic touchscreen functionality, but several advanced functions
are unavailable.  To enable those advanced functions, the host
needs to temporarily configure the irq pin as a (host-side)
output and transmit a specific pattern on the reset and irq
lines.  This method doesn't work on all systems, so the driver
only attempts to reprogram the irq line on the host side as an
output if it is explicitly declared with the irq-gpios property.

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
