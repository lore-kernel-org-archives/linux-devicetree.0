From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v3 0/9] Improve cp110 clk support on Marvell Armada 7K/8K
Date: Mon, 12 Jun 2017 17:43:59 +0200
Message-ID: <87k24h9pog.fsf@free-electrons.com>
References: <cover.6bb422e6a233460049bb63792b32a5ba851dcddd.1496328934.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.6bb422e6a233460049bb63792b32a5ba851dcddd.1496328934.git-series.gregory.clement@free-electrons.com>
        (Gregory CLEMENT's message of "Thu, 1 Jun 2017 16:55:33 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen and Mike,
 
 On jeu., juin 01 2017, Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> Hi,
>
> We got more information about the clock controllers and the clock tree
> of the CP110 part that we find in the Marvell Armada 7K/8K SoCs.
>
> In this 3rd version I removed the GOP changes because the clock is
> actually shared between GOP and SD/eMMC.
>
> The last two patches modifying the device tree _must_ be merged
> through the mvebu tree to avoid future conflict (especially with the
> recent ICU series sent by Thomas Petazzoni).
>

I would like to know the status of this series.

I am about to send a binding documentation series to ease the merging of
the pinctrl part and I also plan adding the patch 2, 4 and 6 from this
series. So if you have not yet applied them you can skip them else I
will need the reference to your stable branch.

Thanks,

Gregory

> Changelog:
> v2 -> v3
>  - removed the GOP changed
> cover letter for v2:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-May/509816.html
>
> v1 -> v2
>  - split the patch to have separate patch for the binding documentation
>  - added the acked-by from Rob Herring
> cover letter for v2:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-May/507381.html
>
> Thanks,
>
> Gregory
>
> Gregory CLEMENT (8):
>   clk: mvebu: cp110: make failure labels more meaningful
>   dt-bindings: cp110: do not depend anymore of the *-clock-output-names
>   clk: mvebu: cp110: do not depend anymore of the *-clock-output-names
>   dt-bindings: cp110: introduce a new binding
>   clk: mvebu: cp110: introduce a new binding
>   dt-bindings: cp110: add sdio clock to cp-110 system controller
>   arm64: dts: marvell: remove *-clock-output-names on cp110
>   arm64: dts: marvell: use new binding for the system controller on cp110
>
> Konstantin Porotchkin (1):
>   clk: mvebu: cp110: add sdio clock to cp-110 system controller
>
>  Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt |  33 +++++-------
>  arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi                       |  54 +++++++------------
>  arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi                        |  48 ++++++-----------
>  drivers/clk/mvebu/cp110-system-controller.c                                | 200 +++++++++++++++++++++++++++++++++++++++++++++++++-----------------------
>  4 files changed, 194 insertions(+), 141 deletions(-)
>
> base-commit: 2ea659a9ef488125eb46da6eb571de5eae5c43f6
> -- 
> git-series 0.9.1

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
