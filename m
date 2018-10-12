From: Aleksandr Aleksandrov <aleksandr.aleksandrov@emlid.com>
Subject: Re: [PATCH v3] arm64: new board - Emlid Neutis N5
Date: Fri, 12 Oct 2018 12:35:23 +0300
Message-ID: <20181012093523.GA29014@imagebutcher>
References: <1538745949-13188-2-git-send-email-aleksandr.aleksandrov@emlid.com>
 <1539012044-29998-1-git-send-email-aleksandr.aleksandrov@emlid.com>
 <1539012044-29998-2-git-send-email-aleksandr.aleksandrov@emlid.com>
 <20181010144957.exrlupoph7ovsmdw@flea>
 <9398571539259289@myt4-929fb874f3f2.qloud-c.yandex.net>
 <2d09d6c0-0404-589d-2c34-da846cff4fb8@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d09d6c0-0404-589d-2c34-da846cff4fb8@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, David Lechner <david@lechnology.com>, Thierry Reding <treding@nvidia.com>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

> >>      +/ {
> >>      + model = "Emlid Neutis N5 Developer board";
> >>      + compatible = "emlid,emlid-neutis-n5-devboard",
> >>      + "emlid,emlid-neutis-n5",
> >>
> >> Do you need the two emlid there? What comes before the comma is the
> >> vendor, while what is after is the model.
> >  
> > I think emlid-neutis-n5 module could be useful in the future, no need
> > this now.
> 
> You misunderstand: The point would be to use, e.g., "emlid,neutis-n5"
> instead of "emlid,emlid-neutis-n5" with duplicate "emlid,emlid-". It is
> orthogonal to having multiple compatible strings.

Oh, I agree. No need to duplicate "emlid". Thank you!

> >>  +&uart1 {
> >>  + pinctrl-names = "default";
> >>  + pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> >>  + status = "okay";
> >>  +};
> >>
> >> I guess this is for bluetooth? Have you tested serdev drivers?
> >>
> > Yes, bluetooth is connected over uart1.
> > You mean if I have tested bluetooth stack via serial device?
> 
> Not quite, we're missing a child node within uart1 for a serdev driver.
> Is there no such driver yet for your Bluetooth chipset, or did you not
> yet check?

Got it. I haven't checked a serdev driver.

Maxim, the SoM can't be run without a motherboard. According to your last message
I don't change dts files, right?

Aleksandr 
