From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/7] clk: mvebu: cp110 fix name of the GOP gate clock
Date: Tue, 23 May 2017 10:18:08 -0500
Message-ID: <20170523151808.iz7jtqgdfbskfh4y@rob-hp-laptop>
References: <cover.737145f06ff0191d1a9210bcd141e679bf45fe5f.1495208533.git-series.gregory.clement@free-electrons.com>
 <062f869fb140c2626efadef80f325d9f03c330f6.1495208533.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <062f869fb140c2626efadef80f325d9f03c330f6.1495208533.git-series.gregory.clement@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 05:55:19PM +0200, Gregory CLEMENT wrote:
> Actually the GOP clock (bit 18) is not at all used for emmc but only
> for GOP: let's fix the name.
> 
> Changing the name in the device tree is not an issue because the name
> itself is not used to reference the clock. Thanks to this the ABI remains
> backward compatible.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 6 +++---
>  arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi                       | 2 +-
>  arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi                        | 2 +-
>  drivers/clk/mvebu/cp110-system-controller.c                                | 5 +++--
>  4 files changed, 8 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
