From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] arm64: dts: allwinner: orange-pi-3:
 Enable WiFi
Date: Sun, 7 Apr 2019 17:31:52 +0200
Message-ID: <CAJiuCcdRHj56p_KFRhK8H9xO+M3ycNp1Jpzw_QWcKQZorcKGpA@mail.gmail.com>
References: <20190405234514.6183-1-megous@megous.com> <20190405234514.6183-13-megous@megous.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCELXIX7UICBBC5PVDSQKGQEYZYGRCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190405234514.6183-13-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, 6 Apr 2019 at 01:45, megous via linux-sunxi
<linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
>
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> Orange Pi 3 has AP6256 WiFi/BT module. WiFi part of the module is
> called bcm43356 and can be used with the brcmfmac driver. The module
> is powered by the two always on regulators (not AXP805).
>
> WiFi uses a PG port with 1.8V voltage level signals. SoC needs to be
> configured so that it sets up an 1.8V input bias on this port. This is
> done by the pio driver by reading the vcc-pg-supply voltage.
>
> You'll need a fw_bcm43456c5_ag.bin firmware file and nvram.txt
> configuration that can be found in the Xulongs's repository for H6:
>
> https://github.com/orangepi-xunlong/OrangePiH6_external/tree/master/ap6256
>
> Mainline brcmfmac driver expects the firmware and nvram at the
> following paths relative to the firmware directory:
>
>   brcm/brcmfmac43456-sdio.bin
>   brcm/brcmfmac43456-sdio.txt
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index 5270142527f5..6a201829bb62 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -66,6 +66,26 @@
>                 regulator-always-on;
>         };
>
> +       reg_vcc33_wifi: vcc33-wifi {
> +               /* Always on 3.3V regulator for WiFi and BT */
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc33-wifi";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +                vin-supply = <&reg_vcc5v>;
> +       };
> +
> +       reg_vcc_wifi_io: vcc-wifi-io {
> +               /* Always on 1.8V/300mA regulator for WiFi and BT IO */
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc-wifi-io";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +                vin-supply = <&reg_vcc33_wifi>;
> +       };
> +
>         /*
>          * The board uses 2.5V RGMII signalling. Power sequence
>          * to enable the phy is to enable GMAC-2V5 and GMAC-3V3 (aldo2)
> @@ -86,6 +106,14 @@
>                   */
>                  vin-supply = <&reg_aldo2>; /* GMAC-3V3 */
>          };
> +
> +       wifi_pwrseq: wifi_pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               clocks = <&rtc 1>;

Maybe I missed something, but the RTC in H6 is not yet available :
https://lkml.org/lkml/2018/10/31/822

Regards,
Clement

> +               clock-names = "ext_clock";
> +               reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> +               post-power-on-delay-ms = <200>;
> +       };
>  };
>
>  &cpu0 {
> @@ -146,6 +174,25 @@
>         status = "okay";
>  };
>
> +&mmc1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc1_pins>;
> +       vmmc-supply = <&reg_vcc33_wifi>;
> +       vqmmc-supply = <&reg_vcc_wifi_io>;
> +       mmc-pwrseq = <&wifi_pwrseq>;
> +       bus-width = <4>;
> +       non-removable;
> +       status = "okay";
> +
> +       brcm: sdio-wifi@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&r_pio>;
> +               interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
> +               interrupt-names = "host-wake";
> +       };
> +};
> +
>  &ohci0 {
>         status = "okay";
>  };
> @@ -157,6 +204,7 @@
>  &pio {
>         vcc-pc-supply = <&reg_bldo2>;
>         vcc-pd-supply = <&reg_cldo1>;
> +       vcc-pg-supply = <&reg_vcc_wifi_io>;
>  };
>
>  &r_i2c {
> --
> 2.21.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
