From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] ARM: dts: sun7i: add pinctrl for missing uart mux options
Date: Wed, 20 Feb 2019 16:58:49 +0800
Message-ID: <CAGb2v66C6HFKgF8kERfp2UQ5XUyNS0-prgC3sX2iobkz7SjBcw@mail.gmail.com>
References: <20190216182132.12895-1-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190216182132.12895-1-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 17, 2019 at 2:21 AM Mans Rullgard <mans@mansr.com> wrote:
>
> This adds pinctrl settings for various missing uart options.
>
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 45 ++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index af5b067a5f83..2295ff5adf48 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -944,6 +944,31 @@
>                                 function = "uart0";
>                         };
>
> +                       uart0_pf_pins: uart0-pf-pins {
> +                               pins = "PF2", "PF4";
> +                               function = "uart0";
> +                       };

We've had the policy of not adding pinctrl nodes that aren't used in-tree,
to avoid bloating up the blob size. However DTC 1.4.7 introduced the new
/omit-if-no-ref/ directive, which would make the compiler discard marked
nodes if they aren't referenced.

So please add this to all the new nodes. It seems to work regardless whether
you add it before or after the label, though having it after the label seems
to make vim syntax highlighting happier.

Regards
ChenYu
