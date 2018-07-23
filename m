From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: meson: add DT documentation for emmc clock controller
Date: Mon, 23 Jul 2018 09:12:21 -0500
Message-ID: <7hbmay3ut6.fsf@baylibre.com>
References: <20180710163658.6175-1-yixun.lan@amlogic.com>
        <20180710163658.6175-2-yixun.lan@amlogic.com>
        <20180711194346.GA32414@rob-hp-laptop>
        <f2eb8632-1113-3bb8-506f-ac0d4e838fd4@amlogic.com>
        <CABGGisw64MpYx7Pvp+XGt6gfZzie6EKeHdchqS6CPDjmAHBuVA@mail.gmail.com>
        <5442a2e8-eb49-2aa8-e53e-8db88cd0bd58@amlogic.com>
        <CAL_Jsq+r+7BaJAPBn3L26sdxATVyDiuC=V3xE+yz0-27q0RJhA@mail.gmail.com>
        <8bf565d3-dbfd-e06d-7076-ba78d7a2e766@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8bf565d3-dbfd-e06d-7076-ba78d7a2e766@amlogic.com> (Yixun Lan's
        message of "Fri, 13 Jul 2018 09:55:32 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.
List-Id: devicetree@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

[...]

>> 
>>> Second, we might like to convert eMMC driver to also use mmc-clkc model.
>> 
>> IMO, this should be done as part of merging this series. Otherwise, we
>> have duplicated code for the same thing.
>
> IMO, I'd leave this out of this series, since this patch series is quite
> complete as itself. Although, the downside is code duplication.
>
> Still, I need to hear Jerome, or Kevin's option, to see if or how we
> should proceed the eMMC's clock conversion.
>
> I could think of three option myself
> 1) don't do the conversion, downside is code duplication, upside is NO
> DT change, no compatibility issue
> 2) add a syscon node into eMMC DT node, then only convert clock part
> into this mmc-clkc model, while still leave other eMMC register access
> as the usual iomap way (still no race condition)
> 3) convert all eMMC register access by using regmap interface.
>
> both 2) and 3) need to update the DT.
>
> and probably 2) is a compromise way, and 1) is also OK, 3) is probably
> the worst way due to dramatically change (I think this was already
> rejected in the previous discussion)

Because the devices (NAND and eMMC_C) are mutually exclusive, taking the
step-by-step approach is fine (and preferred) by me.

Phase 1:
- add new mmc-clk provider
- add NAND driver using new mmc-clk provider
- boards using NAND should ensure emmc_c is disabled in DT

This allows us to not touch the MMC driver or existing upstream
bindings.  Yes, this means there is duplicate code in the MMC driver and
the new mmc-clk provider, but that can be removed in the next phase.

Phase 2:
- convert MMC driver to use new mmc-clk provider
- update MMC users in DT and bindings

Kevin
