From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v8 0/5] media/sun6i: Allwinner A64 CSI support
Date: Mon, 11 Feb 2019 13:52:39 +0530
Message-ID: <CAMty3ZCdm_RoVxoHy9u2-Xhg4_tf7Mr0Gedcrz-jVhc5ceL0CQ@mail.gmail.com>
References: <20190128085847.7217-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128085847.7217-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Mauro and Maxime,

On Mon, Jan 28, 2019 at 2:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add CSI support for Allwinner A64. Here is previous series[1]
>
> Changes for v8:
> - update proper enable and disable sequnce for clk_mod
> - fix warning for patch "media: sun6i: Add A64 CSI block support"
> - collect Maxime Acked-by
> Changes for v7:
> - Drop quirk change, and add as suggusted by Maxime
> - Use csi instead csi0 in pinctrl function
> Changes for v6:
> - set the mod rate in seett_power instead of probe
> Changes for v5:
> - Add mod_rate quirk for better handling clk_set code
> Changes for v4:
> - update the compatible string order
> - add proper commit message
> - included BPI-M64 patch
> - skipped amarula-a64 patch
> Changes for v3:
> - update dt-bindings for A64
> - set mod clock via csi driver
> - remove assign clocks from dtsi
> - remove i2c-gpio opendrian
> - fix avdd and dovdd supplies
> - remove vcc-csi pin group supply
>
> [1] https://patchwork.kernel.org/cover/10779831/
>
> Jagan Teki (5):
>   dt-bindings: media: sun6i: Add A64 CSI compatible
>   media: sun6i: Add A64 CSI block support
>   arm64: dts: allwinner: a64: Add A64 CSI controller
>   arm64: dts: allwinner: a64: Add pinmux setting for CSI MCLK on PE1

Any chance to apply this patches? dtsi patch is already been merged
and all been Acked as well.
