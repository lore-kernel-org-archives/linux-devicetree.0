From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 2/8] clk: berlin: add clock binding docs for Marvell
 Berlin2 SoCs
Date: Tue, 13 May 2014 16:47:15 +0200
Message-ID: <20140513144715.GF29318@piout.net>
References: <1399839881-29895-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1399839881-29895-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399839881-29895-3-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi,

Not much to say,

On 11/05/2014 at 22:24:35 +0200, Sebastian Hesselbarth wrote :
> +* Single-register clock dividers
> +
> +Single-register clock dividers are complex divider cells, allowing
> +to divide a reference clock with a set of fixed dividers. Also they
> +comprise and input clock mux with bypass and an ouput clock gate.
typo here-----^

> +
> +Required properties:
> +- compatible: shall be "marvell,berlin2-clk-div"
> +- reg: address and length of the corresponding DIV registers
> +- #clock-cells: shall be set to 0
> +- clocks: clock specifiers referencing the DIV input clocks
> +- clock-names: array of strings describing the clock specifiers above.
> +    Allowed clock-names are "mux_bypass" for the clock mux bypass selection
> +    and "muxN" (N=0..7) for each of the 8 possible clock mux inputs.
> +

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
