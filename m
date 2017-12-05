From: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: dts: imx7d-sbc-iot: add initial iot gateway dts
Date: Tue, 5 Dec 2017 12:58:44 -0800
Message-ID: <CAH=dhFTsaQMgxSdbLEjTpmE9Q8ugYUFpt1P8eK782e9dyw7bWQ@mail.gmail.com>
References: <20171130201434.14122-1-tyler@opensourcefoundries.com>
 <20171130201434.14122-2-tyler@opensourcefoundries.com> <CAOMZO5DAEMCnEoD_k8d787wk392zYMoKkiMM-TOcRco9UJL2Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DAEMCnEoD_k8d787wk392zYMoKkiMM-TOcRco9UJL2Lw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 1, 2017 at 12:10 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Nov 30, 2017 at 6:14 PM,  <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org> wrote:
>
>> +&ecspi3 {
>> +       fsl,spi-num-chipselects = <1>;
>
> Please remove this property. It is no longer used.

Ack.

>
>
>> +       dvicape@39 {
>> +               compatible = "sil164_simple";
>
> This compatible string does not exist.

I'm going to drop this, and address the display hardware it in a later series.

>
>
>
>> +&lcdif {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_lcdif_dat
>> +                    &pinctrl_lcdif_ctrl>;
>> +       display = <&display0>;
>> +       status = "okay";
>> +
>> +       display0: display {
>> +               bits-per-pixel = <24>;
>> +               bus-width = <24>;
>> +
>> +               display-timings {
>> +                       native-mode = <&timing0>;
>> +                       timing0: dvi {
>> +                               /* 1024x768p60 */
>> +                               clock-frequency = <65000000>;
>> +                               hactive = <1024>;
>> +                               hfront-porch = <40>;
>> +                               hback-porch = <220>;
>> +                               hsync-len = <60>;
>> +                               vactive = <768>;
>> +                               vfront-porch = <7>;
>> +                               vback-porch = <21>;
>> +                               vsync-len = <10>;
>> +
>> +                               hsync-active = <0>;
>> +                               vsync-active = <0>;
>> +                               de-active = <1>;
>> +                               pixelclk-active = <0>;
>
> Which panel is this? Could you use a simple panel driver compatible
> string instead?

I'll switch to a simple panel driver and do some more testing. Will
submit a follow up series to address the LCD panel and dvi cape.

>
>
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&uart2 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_uart2>;
>> +       assigned-clocks = <&clks IMX7D_UART2_ROOT_SRC>;
>> +       assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
>> +       fsl,uart-has-rtscts;
>
> Please use 'uart-has-rtscts' instead.

Ack.

>
>> +       status = "okay";
>> +};
>> +
>> +&uart5 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_uart5>;
>> +       assigned-clocks = <&clks IMX7D_UART5_ROOT_SRC>;
>> +       assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
>> +       fsl,uart-has-rtscts;
>
> Ditto.

Ack.

>
>> +       status = "okay";
>> +};
>> +
>> +&uart7 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_uart7>;
>> +       assigned-clocks = <&clks IMX7D_UART7_ROOT_SRC>;
>> +       assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
>> +       fsl,uart-has-rtscts;
>
> Ditto

Ack.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
