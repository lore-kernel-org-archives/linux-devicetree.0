From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/8] clk: add device tree binding for artpec-6 pll1 clock
Date: Wed, 10 Feb 2016 15:36:03 +0100
Message-ID: <12746231.crYxCXlbXY@wuerfel>
References: <cover.1455107681.git.larper@axis.com> <c092f501a595032f9b76f18fc4bf093503a181c8.1455107681.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c092f501a595032f9b76f18fc4bf093503a181c8.1455107681.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lars Persson <lars.persson@axis.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wednesday 10 February 2016 13:41:50 Lars Persson wrote:
> Signed-off-by: Lars Persson <larper@axis.com>
> ---

Always write a changelog comment.

> +* Clock bindings for Axis ARTPEC-6 chip
> +
> +Required properties:
> +- compatible: Should be "axis,artpec6-pll1-clock"
> +- #clock-cells: Should be <1>

What is the clock cell used for?

> +Examples:
> +
> +pll1_clk: pll1_clk {
> +	#clock-cells = <1>;
> +	compatible = "axis,artpec6-pll1-clock";
> +	clocks = <&ext_clk>;
> +	status = "okay";
> +};
> 
