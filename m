Return-Path: <devicetree-owner@kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:49782 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753050AbbJWQ44 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Oct 2015 12:56:56 -0400
Date: Fri, 23 Oct 2015 18:56:41 +0200
From: Karsten Merker <merker@debian.org>
Subject: Re: [PATCH v4 4/4] ARM: dts: sun6i: Add dts file for MSI Primo81
 tablet
Message-ID: <20151023165641.GB1885@excalibur.cnev.de>
References: <1445572241-13259-1-git-send-email-wens@csie.org>
 <1445572241-13259-5-git-send-email-wens@csie.org>
 <20151023145309.GA1885@excalibur.cnev.de>
 <CAGb2v67HO5isvUxG09traLUBrBp-0Bea9cXn_O0oqBCTYtfN=w@mail.gmail.com>
 <CAGb2v64xESxh0Dzsh9GijYZADbB-SM99ZVtu=9FGB2Gfz2-Z6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64xESxh0Dzsh9GijYZADbB-SM99ZVtu=9FGB2Gfz2-Z6Q@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Karsten Merker <merker@debian.org>, Hans de Goede <hdegoede@redhat.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@kernel.org>, Siarhei Siamashka <siarhei.siamashka@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 23, 2015 at 11:56:35PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 23, 2015 at 11:46 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> > On Fri, Oct 23, 2015 at 10:53 PM, Karsten Merker <merker@debian.org> wrote:
> >> On Fri, Oct 23, 2015 at 11:50:41AM +0800, Chen-Yu Tsai wrote:
[...]
> >>> +/ {
> >>> +     model = "MSI Primo81 tablet";
> >>> +     compatible = "msi,primo81", "allwinner,sun6i-a31s";
> >>> +};
[...]
> >>> +&i2c1 {
> >>> +     pinctrl-names = "default";
> >>> +     pinctrl-0 = <&i2c1_pins_a>;
> >>> +     status = "okay";
> >>> +
> >>> +     ctp@5d {
> >>> +             pinctrl-names = "default";
> >>> +             pinctrl-0 = <&gt911_int_primo81>;
> >>> +             compatible = "goodix,gt911";
> >>> +             reg = <0x5d>;
> >>> +             interrupt-parent = <&pio>;
> >>> +             interrupts = <0 3 IRQ_TYPE_LEVEL_HIGH>; /* PA3 */
> >>
> >> I'd like to add a
> >>
> >>                 touchscreen-swapped-x-y = "true";
> >>
> >> as described in
> >> Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> >> here, as the display is in portrait mode while the touchscreen is
> >> in landscape mode and needs to have the x and y axes swapped to
> >> work in the same coordinate system as the display.
> >>
> >> Regarding the driver side: the goodix driver in kernel 4.3
> >> doesn't yet support this property, but patches to add support for
> >> it are on the linux-input list and should hopefully make it into
> >> kernel 4.4.
> >
> > The DTS is already in Maxime's tree, and in sunxi-next. Feel free to
> > send a follow-up patch adding them. I was waiting for those patches
> > to be merged.
> 
> Sorry, spoke too soon. Maxime hasn't pushed it out yet. Could you send
> a patch adding touchscreen-swapped-x-y for Maxime to squash in?

I'm happy to do so, but I have just stumbled over a problem with
actually building the dtb for testing - it fails with

  arch/arm/boot/dts/sun6i-a31s-primo81.dts:242.1-14 Label or path simplefb_lcd not found

The dts references simplefb_lcd:

+&simplefb_lcd {
+       vcc-lcd-supply = <&reg_dc1sw>;
+       vdd-mipi-bridge-supply = <&reg_eldo3>;
+};

but I don't see where it would be defined. This is on the current
sunxi/for-next branch of
https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git
with the Primo81 dts patch on top. Am I perhaps missing some
required additional patch here?

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
