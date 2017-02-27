From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/6] ARM: dts: mvebu: Move mv98dx3236 clock bindings
Date: Mon, 27 Feb 2017 09:15:25 -0600
Message-ID: <20170227151525.cmtza63aw5ogszjr@rob-hp-laptop>
References: <20170216085041.28337-1-chris.packham@alliedtelesis.co.nz>
 <20170216085041.28337-7-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170216085041.28337-7-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 09:50:40PM +1300, Chris Packham wrote:
> Previously the coreclk binding for the 98dx3236 SoC was inherited from
> the armada-370/xp. This block is present in as much as it is possible to
> read from the register location without causing any harm. However the
> actual sampled at reset values are reflected in the DFX block.
> 
> Moving the binding to the DFX block enables support for different clock
> strapping options in hardware.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - New. Split out from "clk: mvebu: Expand mv98dx3236-core-clock support"
>     Changes in v3:
>     - Clarify why the old location was wrong (but worked).
> 
>  .../devicetree/bindings/clock/mvebu-core-clock.txt         |  7 +++++++
>  .../devicetree/bindings/clock/mvebu-gated-clock.txt        | 11 +++++++++++
>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi                  | 14 +++++++-------
>  3 files changed, 25 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
