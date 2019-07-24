From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/2] ARM: dts: rockchip: consolidate veyron panel and
 backlight settings
Date: Thu, 25 Jul 2019 00:38:05 +0200
Message-ID: <1769449.YPoKHCOSj6@phil>
References: <20190711223455.12210-1-mka@chromium.org>
 <20190711223455.12210-2-mka@chromium.org>
 <CAD=FV=Wj4Fei6t-STjY_FJkDKQYys5PcVquBJcdRE3wUN=y3Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=Wj4Fei6t-STjY_FJkDKQYys5PcVquBJcdRE3wUN=y3Yg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Matthias Kaehlcke <mka@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 24. Juli 2019, 23:46:30 CEST schrieb Doug Anderson:
> Hi,
> 
> On Thu, Jul 11, 2019 at 3:35 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> > index 4cc7d3659484..2b0801a539c9 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> > @@ -15,40 +15,6 @@
> >                      "google,veyron-minnie-rev0", "google,veyron-minnie",
> >                      "google,veyron", "rockchip,rk3288";
> >
> > -       backlight_regulator: backlight-regulator {
> > -               compatible = "regulator-fixed";
> > -               enable-active-high;
> > -               gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
> > -               pinctrl-names = "default";
> > -               pinctrl-0 = <&bl_pwr_en>;
> > -               regulator-name = "backlight_regulator";
> > -               vin-supply = <&vcc33_sys>;
> > -               startup-delay-us = <15000>;
> > -       };
> > -
> > -       panel_regulator: panel-regulator {
> > -               compatible = "regulator-fixed";
> > -               enable-active-high;
> > -               gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
> > -               pinctrl-names = "default";
> > -               pinctrl-0 = <&lcd_enable_h>;
> > -               regulator-name = "panel_regulator";
> > -               startup-delay-us = <100000>;
> > -               vin-supply = <&vcc33_sys>;
> > -       };
> > -
> > -       vcc18_lcd: vcc18-lcd {
> > -               compatible = "regulator-fixed";
> > -               enable-active-high;
> > -               gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> > -               pinctrl-names = "default";
> > -               pinctrl-0 = <&avdd_1v8_disp_en>;
> > -               regulator-name = "vcc18_lcd";
> > -               regulator-always-on;
> > -               regulator-boot-on;
> > -               vin-supply = <&vcc18_wl>;
> > -       };
> > -
> >         volume_buttons: volume-buttons {
> >                 compatible = "gpio-keys";
> >                 pinctrl-names = "default";
> 
> You forgot to remove the line:
> 
> power-supply = <&backlight_regulator>;
> 
> ...from minnie.
> 
> 
> > diff --git a/arch/arm/boot/dts/rk3288-veyron-pinky.dts b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > index 9b6f4d9b03b6..06af58e37a4b 100644
> > --- a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > +++ b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
> > @@ -14,7 +14,14 @@
> >         compatible = "google,veyron-pinky-rev2", "google,veyron-pinky",
> >                      "google,veyron", "rockchip,rk3288";
> >
> > +       /delete-node/backlight-regulator;
> > +       /delete-node/panel-regulator;
> >         /delete-node/emmc-pwrseq;
> > +       /delete-node/vcc18-lcd;
> > +};
> > +
> > +&backlight {
> > +       /delete-property/power-supply;
> >  };
> >
> >  &emmc {
> > @@ -52,7 +59,17 @@
> >         i2c-scl-rising-time-ns = <300>;
> >  };
> >
> > +&panel {
> > +       power-supply= <&vcc33_lcd>;
> 
> Might as well put a space before the "="?
> 
> 
> >  &pinctrl {
> > +       /delete-node/ lcd;
> > +
> > +       backlight {
> > +               /delete-node/ bl_pwr_en;
> > +       };
> 
> I general as the defender of "pinky", I'll let Heiko confirm he's OK
> with the color of this bikeshed.  Sometimes a bit of repetition is
> preferred over a bunch of confusing /delete-node/ statements since
> those tend to make things harder to reason about in general.  In this
> case I think things are cleaner after your patch but I won't say it's
> 100% clear cut.

going this way with the delete-nodes looks good to me :-) ... pinky is
the "odd" one in that, so I think it can carry the burden ... especially
as you said, this really only affects me and my boardfarm at all ;-) .


Heiko

> 
> Other than nits I have double-checked this patch, so feel free to add
> my Reviewed-by after nits are fixed.
> 
> -Doug
> 
