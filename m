From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun7i: Add OOB irq support to
 boards with broadcom sdio wifi
Date: Sun, 8 Mar 2015 11:12:40 +0800
Message-ID: <CAGb2v642i_Yg9PAg=iMyVgzm0gNwe6v7wmziYJTZcjoDBAFmcw@mail.gmail.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com> <1425754884-7875-6-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQX452TQKGQEXV5KXXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425754884-7875-6-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 8, 2015 at 3:01 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 11 +++++++++++
>  arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts  | 11 +++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> index 0c219a4..8111b0c 100644
> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
> @@ -167,12 +167,23 @@
>  };
>
>  &mmc3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc3_pins_a>;
>         vmmc-supply = <&reg_vmmc3>;
>         bus-width = <4>;
>         non-removable;
>         status = "okay";
> +
> +       brcmf: bcrmf@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&pio>;
> +               interrupts = <10 8>; /* PH10 / EINT10 */
> +               interrupt-names = "host-wake";
> +       };

I gave this a spin on my Cubietruck. (I was running cap-sdio-irq before.)

Ran a few ping tests with a simple
"sudo ping -i 0.1 -I wlan0 -s 65500 192.168.1.1"
After a few runs I got

sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD SBE !!
sunxi-mmc 1c12000.mmc: data error, sending stop command
brcmfmac: brcmf_sdio_readframes: RXHEADER FAILED: -110
brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
brcmfmac: brcmf_sdiod_regrw_helper: failed to write data F1@0x0a040, err: -5
brcmfmac: brcmf_sdio_hdparse: seq 226: sequence number error, expect 227
sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD DTO !!
sunxi-mmc 1c12000.mmc: data error, sending stop command
sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD DTO !!
sunxi-mmc 1c12000.mmc: data error, sending stop command
sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD DTO !!
sunxi-mmc 1c12000.mmc: data error, sending stop command
brcmfmac: brcmf_sdiod_regrw_helper: failed to read data F1@0x0a020, err: -110
brcmfmac: brcmf_sdio_dpc: failed backplane access over SDIO, halting operation
sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD DTO !!
sunxi-mmc 1c12000.mmc: data error, sending stop command
sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD DTO !!
sunxi-mmc 1c12000.mmc: data error, sending stop command
sunxi-mmc 1c12000.mmc: smc 1 err, cmd 53, RD DTO !!
sunxi-mmc 1c12000.mmc: data error, sending stop command

The chip is pretty much dead afterwards.

With cap-sdio-irq it doesn't happen so soon, but it does.
Without either, the response time is bad with packet losses,
but at least it doesn't die.

Is this the problem Arend (CC-ed) was looking into?

Regards
ChenYu

>  };
>
>  &mmc3_pins_a {
> diff --git a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
> index baee563..4a8defd 100644
> --- a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
> @@ -164,12 +164,23 @@
>  };
>
>  &mmc3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc3_pins_a>;
>         vmmc-supply = <&reg_vmmc3>;
>         bus-width = <4>;
>         non-removable;
>         status = "okay";
> +
> +       brcmf: bcrmf@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&pio>;
> +               interrupts = <10 8>; /* PH10 / EINT10 */
> +               interrupt-names = "host-wake";
> +       };
>  };
>
>  &mmc3_pins_a {
> --
> 2.3.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
