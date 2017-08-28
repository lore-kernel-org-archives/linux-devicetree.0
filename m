From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add pfc device node
Date: Mon, 28 Aug 2017 10:39:47 +0200
Message-ID: <CAMuHMdWzc0A-16LUz4rVHJBRk9Fdhs_BLBHqpgPrYOdm23qzAg@mail.gmail.com>
References: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san, Simon,

On Wed, Aug 9, 2017 at 2:20 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>
>  This patch set is based on the renesas-drivers.git /
> topic/r8a77995-integration branch and depends on the following patch
>  "pinctrl: sh-pfc: r8a77995: Initial R8A77995 PFC support"
>
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 7419688..240b0f8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -123,6 +123,11 @@
>                         reg = <0 0xe6160000 0 0x0200>;
>                 };
>
> +               pfc: pfc@e6060000 {

Upon second look, this should use the generic "pin-controller@..." node name.
I will fix the example in the bindings.

> +                       compatible = "renesas,pfc-r8a77995";
> +                       reg = <0 0xe6060000 0 0x508>;
> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
