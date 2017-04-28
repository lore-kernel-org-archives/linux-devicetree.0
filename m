From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Fri, 28 Apr 2017 09:18:42 +0200
Message-ID: <CAMuHMdU2CvipQQQ8-wxsiniHZJQmUMHv-t52Pw=sHD3YTd7Yug@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com> <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Apr 27, 2017 at 12:48 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, April 27, 2017, Geert Uytterhoeven wrote:
>> > +&ether {
>> > +       pinctrl-names = "default";
>> > +       pinctrl-0 = <&ether_pins>;
>> > +
>> > +       status = "okay";
>> > +
>> > +       renesas,no-ether-link;
>> > +       phy-handle = <&phy0>;
>> > +       phy0: ethernet-phy@0 {
>> > +               reg = <0>;
>>
>> Shouldn't the interrupt (connected to P1_15) be described?
>
> That interrupt pin from the PHY is not used. It did not need to be connected.

But it is connected, according to the schematics.

DT describes hardware, not software limitations.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
