From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v8 3/3] arm64: dts: rockchip: add usb2-phy support for rk3399
Date: Thu, 21 Jul 2016 11:26:49 +0200
Message-ID: <3513562.kdo4J8AU27@diego>
References: <1468913311-23977-1-git-send-email-frank.wang@rock-chips.com> <CAD=FV=Wc0RdgpfzWhEVsrQhj5Pjf4RF3a81mZKaZfpZS41ce5g@mail.gmail.com> <d01e6b5c-8e7a-bcba-477b-cfe3a9088964@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d01e6b5c-8e7a-bcba-477b-cfe3a9088964@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: Doug Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Ziyuan Xu <xzy.xu@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, =?utf-8?B?5ZC06Imv5bOw?= <william.wu@rock-chips.com>, daniel.meng@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Frank,

Am Donnerstag, 21. Juli 2016, 10:49:53 schrieb Frank Wang:
> >> @@ -69,6 +69,15 @@
> >> 
> >>                  regulator-max-microvolt = <3300000>;
> >>          
> >>          };
> >> 
> >> +       vbus_host: vbus-host-regulator {
> >> +               compatible = "regulator-fixed";
> >> +               enable-active-high;
> >> +               gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
> >> +               pinctrl-names = "default";
> >> +               pinctrl-0 = <&host_vbus_drv>;
> >> +               regulator-name = "vbus_host";
> >> +       };
> >> +
> > 
> > To match my schematics, this would probably be "vcc5v0_host".
> > Technically there are two regulators but since they are the same
> > voltage and enabled by the same GPIO it seems like modeling it as one
> > regulator is fine.
> 
> Yep, you are right, I will rename it.
> 
> > If you really wanted to model things you could also include the input
> > supply (VCC5V0_SYS).  Not sure how much you care to model in EVB.
> 
> Actually, from
> "Documentation/devicetree/bindings/regulator/fixed-regulator.txt" show,
> input supply name is just optional property, and it seems that only do
> assign "vin" value for input_supply (the second member of struct
> fixed_voltage_config) if "vin-supply" is specified.
> 
> So is input supply name  (VCC5V0_SYS) required here? Would you like to
> give more comments please?

While vin-supply is optional, I think that is meant for real top-level 
regulators (our vcc_sys or whatever) that really don't have a parent 
regulator.

It is always nicer to model the whole power-tree [in a sane way], as it makes 
following the schematics a lot easier. If you mount a debugfs these days you 
can even get a nice tree graph of the regulator infrastructure ... where the 
parent-relationship is also needed to create something meaningful.


Heiko
