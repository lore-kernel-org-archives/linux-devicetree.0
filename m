From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2.1 24/34] dt-bindings: arm: Convert Rockchip board/soc
 bindings to json-schema
Date: Mon, 10 Dec 2018 09:13:01 -0600
Message-ID: <CAL_JsqL9PyD=0jy+GF5g8ee-FO_ijvArnzEohuvqK5Od3yr7fg@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <3170130.k0DT9deCHj@phil>
 <CAL_JsqLwSg=CWQYzvfCq9WVexU5donsF6ugib2ONNN3vvjzZXw@mail.gmail.com> <2386212.ILKoqq0Ivo@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2386212.ILKoqq0Ivo@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: "heiko@sntech.de" <heiko@sntech.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 9, 2018 at 4:14 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Convert Rockchip SoC bindings to DT schema format using json-schema.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> [move to per-board entries and added recently added boards]
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Hi Rob,
>
> there are boards where the description adds much value and on others
> it is maybe less, but personally I'd like to keep things uniform,
> as that makes reading these things easier if the format stays the
> same all the time, so I've gone forward and just did the conversion
>
> make dtbs_check did not complain about the schema it seems but I
> did end up with an error later on:
>
> FATAL ERROR: Unknown output format "yaml"
> make[2]: *** [scripts/Makefile.lib:313: arch/arm/boot/dts/rk3036-evb.dt.yaml] Fehler 1

You need libyaml and its headers installed so dtc can output yaml, but
that's not needed for checking the schema against the meta-schema.

> But I guess I did not mess up the schema yet.
>
> So does it look ok that way?

Yes, but one comment...

> +      - description: Firefly Firefly-RK3288
> +        items:
> +          - const: firefly,firefly-rk3288
> +          - const: rockchip,rk3288
> +
> +      - description: Firefly Firefly-RK3288 (beta board)
> +        items:
> +          - const: firefly,firefly-rk3288-beta
> +          - const: rockchip,rk3288
> +
> +      - description: Firefly Firefly-RK3288 Reload

Seems like combining these 3 (or first 2?) would make sense if this is
just revs of the same board.

But either way is fine.

> +        items:
> +          - const: firefly,firefly-rk3288-reload
> +          - const: rockchip,rk3288
