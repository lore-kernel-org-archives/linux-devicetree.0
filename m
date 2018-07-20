Return-Path: <robherring2@gmail.com>
Date: Fri, 20 Jul 2018 08:20:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] clk: renesas: mstp: Document R7S9210 support
Message-ID: <20180720142049.GA2249@rob-hp-laptop>
References: <20180711170313.80321-1-chris.brandt@renesas.com>
 <20180711170313.80321-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180711170313.80321-3-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 11, 2018 at 12:03:13PM -0500, Chris Brandt wrote:
> Renesas R7S9210 SoC also has the CPG MSTP clocks.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
