From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH 1/6] arm64: dts: rockchip: Fix rk3399-roc-pc pwm2 pin
Date: Tue, 1 Oct 2019 12:34:42 +0200
Message-ID: <CAOf5uwkXt7mD_OZFx+bmP6YVHQ6=yU4Lzz+u0hxy+6HUxiR1KQ@mail.gmail.com>
References: <20190919052822.10403-1-jagan@amarulasolutions.com>
 <20190919052822.10403-2-jagan@amarulasolutions.com> <6797961.eJj5WIFbM9@phil> <CAMty3ZDKaywoPxCSD-5N2pLjtGmZ-dZ7ZgUOJqiB1V_9rfR26A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZDKaywoPxCSD-5N2pLjtGmZ-dZ7ZgUOJqiB1V_9rfR26A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Da Xue <da@lessconfused.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Hi

On Tue, Oct 1, 2019 at 12:26 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Heiko,
>
> On Mon, Sep 30, 2019 at 2:51 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Hi Jagan,
> >
> > Am Donnerstag, 19. September 2019, 07:28:17 CEST schrieb Jagan Teki:
> > > ROC-PC is not able to boot linux console if PWM2_d is
> > > unattached to any pinctrl logic.
> > >
> > > To be precise the linux boot hang with last logs as,
> > > ...
> > > .....
> > > [    0.003367] Console: colour dummy device 80x25
> > > [    0.003788] printk: console [tty0] enabled
> > > [    0.004178] printk: bootconsole [uart8250] disabled
> > >

The only sense is that is connected with
vdd_log: vdd-log {
compatible = "pwm-regulator";
pwms = <&pwm2 0 25000 1>;
regulator-name = "vdd_log";
regulator-min-microvolt = <800000>;
regulator-max-microvolt = <1100000>;
regulator-always-on;
regulator-boot-on;

/* for rockchip boot on */
rockchip,pwm_id= <2>;
rockchip,pwm_voltage = <1000000>;
};

I don't know how this in mailine is mapped

Michael

> > > In ROC-PC the PWM2_d pin is connected to LOG_DVS_PWM of
> > > VDD_LOG. So, for normal working operations this needs to
> > > active and pull-down.
> > >
> > > This patch fix, by attaching pinctrl active and pull-down
> > > the pwm2.
> >
> > This looks highly dubious on first glance. The pwm subsystem nor
> > the Rockchip pwm driver do not do any pinctrl handling.
> >
> > So I don't really see where that "active" pinctrl state is supposed
> > to come from.
> >
> > Comparing with the pwm driver in the vendor tree I see that there
> > is such a state defined there. But that code there also looks strange
> > as that driver never again leaves this active state after entering it.
> >
> > Also for example all the Gru devices run with quite a number of pwm-
> > regulators without needing additional fiddling with the pwm itself, so
> > I don't really see why that should be different here.
>
> I deed, I was supposed to think the same. but the vendor kernel dts
> from firefly do follow the pwm2 pinctrl [1]. I wouldn't find any
> information other than this vensor information, ie one of the reason I
> have marked "Levin Du" who initially supported this board.
>
> One, think I have seen was this pinctrl active fixed the boot hang.
> any inputs from would be very helpful.
>
> Levin Du, any inputs?
>
> [1] https://github.com/FireflyTeam/kernel/blob/stable-4.4-rk3399-linux/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi#L1184
>
>


-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
