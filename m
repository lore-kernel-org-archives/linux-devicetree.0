From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: rockchip: consolidate veyron panel and
 backlight settings
Date: Wed, 24 Jul 2019 15:38:23 -0700
Message-ID: <20190724223823.GC250418@google.com>
References: <20190711223455.12210-1-mka@chromium.org>
 <20190711223455.12210-2-mka@chromium.org>
 <CAD=FV=Wj4Fei6t-STjY_FJkDKQYys5PcVquBJcdRE3wUN=y3Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wj4Fei6t-STjY_FJkDKQYys5PcVquBJcdRE3wUN=y3Yg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 02:46:30PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 11, 2019 at 3:35 PM Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
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

good catch, thanks!

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

will do

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

I agree that some repetition can be preferrable over /delete-node/
statements. In this case repetition is above my personal threshold,
especially since I'm about to add another device with eDP display and
would have to repeat the mostly redundant config yet another time.

If Heiko prefer's the repetition so be it :)

> Other than nits I have double-checked this patch, so feel free to add
> my Reviewed-by after nits are fixed.

Thanks for the review!
