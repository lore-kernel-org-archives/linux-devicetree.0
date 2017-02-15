From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/6] ARM: dts: mvebu: Move mv98dx3236 clock bindings
Date: Wed, 15 Feb 2017 16:47:27 -0600
Message-ID: <20170215224727.ijjzo7a4f35k63my@rob-hp-laptop>
References: <20170207202815.20226-1-chris.packham@alliedtelesis.co.nz>
 <20170207202815.20226-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170207202815.20226-6-chris.packham@alliedtelesis.co.nz>
Sender: linux-clk-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 08, 2017 at 09:28:14AM +1300, Chris Packham wrote:
> This moves the coreclk binding for the 98dx3236 SoC to the DFX block
> where the sampled at reset register is located and switches to using the
> correct gating clock compatible string.

Moves why? It was wrong before?

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - New. Split out from "clk: mvebu: Expand mv98dx3236-core-clock support"
> 
>  .../devicetree/bindings/clock/mvebu-core-clock.txt         |  7 +++++++
>  .../devicetree/bindings/clock/mvebu-gated-clock.txt        | 11 +++++++++++
>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi                  | 14 +++++++-------
>  3 files changed, 25 insertions(+), 7 deletions(-)
