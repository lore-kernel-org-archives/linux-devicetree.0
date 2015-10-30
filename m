From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 19/19] ARM: sun5i: chip: Enable the TV Encoder
Date: Fri, 30 Oct 2015 23:20:41 +0800
Message-ID: <CAGb2v66vjp=5GtGD-0i3OOw-wK3H4bogfvPoNzuwYvY8vt4fMQ@mail.gmail.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-20-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1446214865-3972-20-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 10:21 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The TV encoder is used to drive VGA and composite display.
>
> Enable it on the CHIP

The commit message does not match the contents. Missing a patch? :)

ChenYu

>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  arch/arm/boot/dts/sun5i-r8.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
> index d69df3a73cbf..e39c903da864 100644
> --- a/arch/arm/boot/dts/sun5i-r8.dtsi
> +++ b/arch/arm/boot/dts/sun5i-r8.dtsi
> @@ -86,4 +86,16 @@
>                                              "ahb_mali400";
>                 };
>         };
> +
> +       soc@01c00000 {
> +               tve: encoder@01c0a000 {
> +                       compatible = "allwinner,sun4i-a10-tv-encoder";
> +                       reg = <0x01c0a000 0x1000>;
> +                       clocks = <&ahb_gates 34>;
> +               };
> +       };
> +};
> +
> +&de {
> +       allwinner,tv-encoder = <&tve>;
>  };
> --
> 2.6.2
>
