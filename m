From: Christopher Obbard <chris-ljUBoSVpJTpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: a64-amarula-relic:
 Enable AP6330 WiFi support
Date: Thu, 31 May 2018 17:55:31 +0100
Message-ID: <CAP03XeoY8_-gG-2h8WP+3ZZFzxeyHERG=o7Y3Btk2svy5kco_Q@mail.gmail.com>
References: <20180531165109.8476-1-jagan@amarulasolutions.com>
Reply-To: chris-ljUBoSVpJTpWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCYL3TVT2APRBBWSYDMAKGQEOTEHOOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180531165109.8476-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jagan,

I cannot find any information on this board online, so I am guessing
it has not been released yet and you are developing software support
now.

Do you have any datasheet/overview document of the board?

Rather than making a lot of noise on the various MLs, why not wait
until all hardware has a driver written for it & bugs have been been
smashed, then patch in one series?

Christopher Obbard
64 Studio Ltd.


On 31 May 2018 at 17:51, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> Enable AP6330 WiFi/BT combo chip on Amarula A64-Relic board:
> - WiFi SDIO interface is connected to MMC1
> - WiFi WL-PMU-EN pin connected to gpio PL2: attach to mmc-pwrseq
> - WiFi WL-WAKE-AP pin connected to gpio PL3
> - 32kHz external oscillator gate clock from RTC
>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v2:
> - Move external rtc clock nodes into main rtc node definition
>   of sun50i-a64.dtsi
>
>  .../dts/allwinner/sun50i-a64-amarula-relic.dts     | 31 ++++++++++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  3 +++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> index ce4a256ff086..eac4793c8502 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> @@ -21,12 +21,43 @@
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               clocks = <&rtc 1>;
> +               clock-names = "ext_clock";
> +               reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* WL-PMU-EN: PL2 */
> +       };
>  };
>
>  &ehci0 {
>         status = "okay";
>  };
>
> +&mmc1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc1_pins>;
> +       vmmc-supply = <&reg_dcdc1>;
> +       /*
> +        * Schematic shows both dldo4 and eldo1 connected for vcc-io-wifi, but
> +        * dldo4 connection shows DNP(Do Not Populate) and eldo1 connected with
> +        * 0Ohm register to vcc-io-wifi so eldo1 is used.
> +        */
> +       vqmmc-supply = <&reg_eldo1>;
> +       mmc-pwrseq = <&wifi_pwrseq>;
> +       bus-width = <4>;
> +       non-removable;
> +       status = "okay";
> +
> +       brcmf: wifi@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&r_pio>;
> +               interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>;  /* WL-WAKE-AP: PL3 */
> +               interrupt-names = "host-wake";
> +       };
> +};
> +
>  &mmc2 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc2_pins>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 1b2ef28c42bd..82516aec4153 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -634,6 +634,9 @@
>                         reg = <0x01f00000 0x54>;
>                         interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +                       clock-output-names = "rtc-osc32k", "rtc-osc32k-out";
> +                       clocks = <&osc32k>;
> +                       #clock-cells = <1>;
>                 };
>
>                 r_intc: interrupt-controller@1f00c00 {
> --
> 2.14.3
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
