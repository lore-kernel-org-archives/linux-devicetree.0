From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add basic support for orion-r68
Date: Fri, 15 Jan 2016 10:28:44 -0300
Message-ID: <CABxcv=m+hK3xS8_fYNns-xE5DaLHD0D_Yj8McjM72Y_5V=YmSw@mail.gmail.com>
References: <1452863192-29231-1-git-send-email-matthias.bgg@gmail.com>
	<1452863192-29231-2-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452863192-29231-2-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Ol
List-Id: devicetree@vger.kernel.org

Hello Matthias,

This is not a complete review but I just wanted to comment on two
things that I noticed:

On Fri, Jan 15, 2016 at 10:06 AM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

[snip]

> +       };
> +
> +       vcc_18: vcc18-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_18";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_sys>;
> +       };
> +
> +       /* supplies both host and otg */
> +       vcc_host: vcc-host-regulator {
> +               compatible = "regulator-fixed";
> +               gpio = <&gpio0 4 GPIO_ACTIVE_LOW>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&host_vbus_drv>;
> +               regulator-name = "vcc_host";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_sys>;
> +       };
> +
> +       vccio_sd: vcc-io-sd-regulator {
> +               regulator-name= "vccio_sd";
> +               gpio = <&gpio0 9 GPIO_ACTIVE_LOW>;
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +       };
> +
> +       vcc_sd: vcc-sd-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_sd";
> +               gpio = <&gpio3 11 GPIO_ACTIVE_LOW>;
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_io>;
> +       };
> +
> +       vcc_io: vcc-io-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_io";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_sys>;
> +       };
> +
> +       vcc_lan: vcc-lan-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_lan";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_io>;
> +       };
> +
> +       vcc_sys: vcc-sys-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_sys";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vccio_wl: vccio-wl-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vccio_wl";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_io>;
> +       };
> +
> +       vdd_10: vdd-10-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd_10";
> +               regulator-min-microvolt = <1000000>;
> +               regulator-max-microvolt = <1000000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               vin-supply = <&vcc_sys>;
> +       };
> +};

There is only one regulator that is not marked as always-on. This will
prevent the regulator subsystem to disable unused regulators. Do you
really need all of them to be always-on?

> +
> +&emmc {
> +       broken-cd;
> +       bus-width = <8>;
> +       cap-mmc-highspeed;
> +       disable-wp;
> +       mmc-pwrseq = <&emmc_pwrseq>;
> +       non-removable;

Non-removable assumes always present so there is no need for
broken-cd. In fact, these two properties are mutually exclusive
according to Documentation/devicetree/bindings/mmc/mmc.txt.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
