From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: RFC: board dts-file naming scheme
Date: Tue, 16 Aug 2016 11:43:40 -0500
Message-ID: <CAL_JsqJqY4GFrUfwudN4BP7ph9s7R78aof_YiEC-GDbS12U2_Q@mail.gmail.com>
References: <20160816181321.d90e979cae6c7b5d0959b381@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160816181321.d90e979cae6c7b5d0959b381-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, feedback-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 16, 2016 at 10:13 AM, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi all!
>
> I have not found any recomendation on board dts-file naming scheme
> in linux.git/Documentation/devicetree/.
>
> ARM/ARM64 Linux mostly uses <soc-name>-<board-name>.dts board dts-file
> naming scheme (also see slide "Adding the support for a new ARM board" from [1]).
>
>    arch/arm/boot/dts/am335x-baltos-ir5221.dts
>    arch/arm/boot/dts/at91-ariag25.dts
>    arch/arm/boot/dts/exynos5250-arndale.dts
>    arch/arm/boot/dts/imx6dl-gw54xx.dts
>    arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
>    arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
>    arm64/boot/dts/qcom/apq8016-sbc.dts
>    arm64/boot/dts/cavium/thunder-88xx.dts
>    arm64/boot/dts/broadcom/ns2-svk.dts
>    arm64/boot/dts/rockchip/rk3368-r88.dts
>    arm64/boot/dts/mediatek/mt8173-evb.dts
>
> MIPS Linux mostly uses <soc-name>_<board-name>.dts naming scheme:
>
>    arch/mips/boot/dts/netlogic/xlp_gvp.dts
>    arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
>    arch/mips/boot/dts/ralink/mt7620a_eval.dts
>
> Can we elaborate some common rule on board dts-file naming scheme
> and add it into linux.git/Documentation/devicetree/?

My guidance is follow what most other files in a given directory do.
In absence of that, use '-'.

If you want to add documentation, then I'll take it. I can tell you
that arm-soc maintainers are not going to take renames for things that
don't follow the documentation.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
