Return-Path: <robherring2@gmail.com>
Date: Tue, 11 Dec 2018 15:36:20 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: clk: armada3700: document the PCIe clock
Message-ID: <20181211213620.GA15108@bogus>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
 <20181123094444.27956-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123094444.27956-5-miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, 23 Nov 2018 10:44:43 +0100, Miquel Raynal wrote:
> Add a reference to the missing PCIe clock managed by this IP. The
> clock resides in the south bridge.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/clock/armada3700-periph-clock.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
