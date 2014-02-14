From: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Subject: How to select between different display timings? (was: [PATCH 7/8]
 ARM: dts: tx28: restructure and update DTS file)
Date: Fri, 14 Feb 2014 14:50:37 +0100
Message-ID: <52FE1F2D.4010102@de.bosch.com>
References: <1375966287-6784-1-git-send-email-LW@KARO-electronics.de> <1375966287-6784-8-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375966287-6784-8-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lothar and Shawn,

On 08.08.2013 14:51, Lothar Wa=C3=9Fmann wrote:
> - add Copyright header
> - use label references for better readability
> - sort the entries alphabetically
> - add some aliases used by U-Boot to edit the DT data
>
> Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>   arch/arm/boot/dts/imx28-tx28.dts |  693 +++++++++++++++++++++++++++=
++++++-----
>   1 files changed, 611 insertions(+), 82 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx=
28-tx28.dts
> index 37be532..866af60 100644
> --- a/arch/arm/boot/dts/imx28-tx28.dts
> +++ b/arch/arm/boot/dts/imx28-tx28.dts
=2E..
> +&lcdif {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&lcdif_24bit_pins_a &lcdif_sync_pins_a &lcdif_=
ctrl_pins_a>;
> +       lcd-supply =3D <&reg_lcd>;
> +       display =3D <&display>;
> +       status =3D "okay";
> +
> +       display: display@0 {
> +               bits-per-pixel =3D <32>;
> +               bus-width =3D <24>;
> +
> +               display-timings {
> +                       native-mode =3D <&timing5>;
> +                       timing0: timing0 {
> +                               panel-name =3D "VGA";
> +                               clock-frequency =3D <25175000>;
> +                               hactive =3D <640>;
> +                               vactive =3D <480>;
> +                               hback-porch =3D <48>;
> +                               hsync-len =3D <96>;
> +                               hfront-porch =3D <16>;
> +                               vback-porch =3D <33>;
> +                               vsync-len =3D <2>;
> +                               vfront-porch =3D <10>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <1>;
> +                               pixelclk-active =3D <1>;
> +                       };
> +
> +                       timing1: timing1 {
> +                               panel-name =3D "ETV570";
> +                               clock-frequency =3D <25175000>;
> +                               hactive =3D <640>;
> +                               vactive =3D <480>;
> +                               hback-porch =3D <114>;
> +                               hsync-len =3D <30>;
> +                               hfront-porch =3D <16>;
> +                               vback-porch =3D <32>;
> +                               vsync-len =3D <3>;
> +                               vfront-porch =3D <10>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <1>;
> +                               pixelclk-active =3D <1>;
> +                       };
> +
> +                       timing2: timing2 {
> +                               panel-name =3D "ET0350";
> +                               clock-frequency =3D <6500000>;
> +                               hactive =3D <320>;
> +                               vactive =3D <240>;
> +                               hback-porch =3D <34>;
> +                               hsync-len =3D <34>;
> +                               hfront-porch =3D <20>;
> +                               vback-porch =3D <15>;
> +                               vsync-len =3D <3>;
> +                               vfront-porch =3D <4>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <1>;
> +                               pixelclk-active =3D <1>;
> +                       };
> +
> +                       timing3: timing3 {
> +                               panel-name =3D "ET0430";
> +                               clock-frequency =3D <9000000>;
> +                               hactive =3D <480>;
> +                               vactive =3D <272>;
> +                               hback-porch =3D <2>;
> +                               hsync-len =3D <41>;
> +                               hfront-porch =3D <2>;
> +                               vback-porch =3D <2>;
> +                               vsync-len =3D <10>;
> +                               vfront-porch =3D <2>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <1>;
> +                               pixelclk-active =3D <1>;
> +                       };
> +
> +                       timing4: timing4 {
> +                               panel-name =3D "ET0500", "ET0700";
> +                               clock-frequency =3D <33260000>;
> +                               hactive =3D <800>;
> +                               vactive =3D <480>;
> +                               hback-porch =3D <88>;
> +                               hsync-len =3D <128>;
> +                               hfront-porch =3D <40>;
> +                               vback-porch =3D <33>;
> +                               vsync-len =3D <2>;
> +                               vfront-porch =3D <10>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <1>;
> +                               pixelclk-active =3D <1>;
> +                       };
> +
> +                       timing5: timing5 {
> +                               panel-name =3D "ETQ570";
> +                               clock-frequency =3D <6400000>;
> +                               hactive =3D <320>;
> +                               vactive =3D <240>;
> +                               hback-porch =3D <38>;
> +                               hsync-len =3D <30>;
> +                               hfront-porch =3D <30>;
> +                               vback-porch =3D <16>;
> +                               vsync-len =3D <3>;
> +                               vfront-porch =3D <4>;
> +                               hsync-active =3D <0>;
> +                               vsync-active =3D <0>;
> +                               de-active =3D <1>;
> +                               pixelclk-active =3D <1>;
> +                       };
> +               };
> +       };
> +};

Being no graphics expert, looking at above device tree change, I'd like=
=20
to understand how this can be used to switch between different display=20
timings?

In the kernel, I've found the code which selects the default/native-mod=
e=20
(of_display_timing.c). But, as here, if there is a native/default mode,=
=20
there are alternative modes. I haven't understood how and who to select=
=20
these other modes? In this case, how could the alternative modes=20
timing0/1/2/3/4 be selected in the kernel?

Do you have any pointers regarding this?

Many thanks and best regards

Dirk



--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
