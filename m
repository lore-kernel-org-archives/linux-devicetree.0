From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v8 3/3] arm64: dts: rockchip: add usb2-phy support for rk3399
Date: Thu, 21 Jul 2016 00:06:36 +0200
Message-ID: <19337009.ZCcJ3zVfzs@diego>
References: <1468913311-23977-1-git-send-email-frank.wang@rock-chips.com> <CAD=FV=Wc0RdgpfzWhEVsrQhj5Pjf4RF3a81mZKaZfpZS41ce5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=Wc0RdgpfzWhEVsrQhj5Pjf4RF3a81mZKaZfpZS41ce5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Frank Wang <frank.wang@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Ziyuan Xu <xzy.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, =?utf-8?B?5ZC06Imv5bOw?= <william.wu@rock-chips.com>, daniel.meng@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 20. Juli 2016, 14:33:25 schrieb Doug Anderson:
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +
> > +               u2phy0: usb2-phy@e450 {
> > +                       compatible = "rockchip,rk3399-usb2phy";
> > +                       reg = <0xe450 0x10>;
> > +                       clocks = <&cru SCLK_USB2PHY0_REF>;
> > +                       clock-names = "phyclk";
> > +                       #clock-cells = <0>;
> > +                       clock-output-names = "clk_usbphy0_480m";
> 
> Any reason why there isn't a 'status = "disabled";' here?

my guess would be, because we might need the provided clock anyway, even in 
the case where the actual phy is not used.

But that is better decided by the board/board-dts designer if the clock is 
really needed, so add the disabled here and enable in the board, as Doug 
suggested.


> > +                       u2phy0_host: host-port {
> > +                               #phy-cells = <0>;
> > +                               interrupts = <GIC_SPI 27
> > IRQ_TYPE_LEVEL_HIGH>; +                               interrupt-names =
> > "linestate";
> > +                               status = "disabled";
> > +                       };
> > +               };
> > +
> > +               u2phy1: usb2-phy@e460 {
> > +                       compatible = "rockchip,rk3399-usb2phy";
> > +                       reg = <0xe460 0x10>;
> > +                       clocks = <&cru SCLK_USB2PHY1_REF>;
> > +                       clock-names = "phyclk";
> > +                       #clock-cells = <0>;
> > +                       clock-output-names = "clk_usbphy1_480m";
> > +
> > +                       u2phy1_host: host-port {
> > +                               #phy-cells = <0>;
> > +                               interrupts = <GIC_SPI 31
> > IRQ_TYPE_LEVEL_HIGH>; +                               interrupt-names =
> > "linestate";
> > +                               status = "disabled";
> > +                       };
> > +               };
> > 
> >         };
> >         
> >         watchdog@ff840000 {
> > 
> > @@ -1009,5 +1047,12 @@
> > 
> >                                         <1 14 RK_FUNC_1 &pcfg_pull_none>;
> >                         
> >                         };
> >                 
> >                 };
> > 
> > +
> > +               usb2 {
> > +                       host_vbus_drv: host-vbus-drv {
> > +                               rockchip,pins =
> > +                                       <4 25 RK_FUNC_GPIO
> > &pcfg_pull_none>; +                       };
> > +               };
> 
> Are you certain this belongs in rk3399.dtsi?  It seems like it should
> be in the EVB file.

yep, while most boards follow a reference design, this is still highly board-
specific.
