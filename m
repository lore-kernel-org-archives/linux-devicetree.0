From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH 3/6] net: stmmac: sun8i: Use devm_regulator_get for PHY
 regulator
Date: Tue, 20 Aug 2019 17:56:48 +0200
Message-ID: <20190820155648.hjr5mlmsc6krecby@core.my.home>
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-4-megous@megous.com>
 <20190820153939.GL29991@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820153939.GL29991@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 05:39:39PM +0200, Andrew Lunn wrote:
> On Tue, Aug 20, 2019 at 04:53:40PM +0200, megous@megous.com wrote:
> > From: Ondrej Jirman <megous@megous.com>
> > 
> > Use devm_regulator_get instead of devm_regulator_get_optional and rely
> > on dummy supply. This avoids NULL checks before regulator_enable/disable
> > calls.
> 
> Hi Ondrej
> 
> What do you mean by a dummy supply? I'm just trying to make sure you
> are not breaking backwards compatibility.

I have tested it on Orange Pi PC 2, that uses only phy-supply, but not
phy-io-supply, and the kernel now prints:

[    1.410137] dwmac-sun8i 1c30000.ethernet: 1c30000.ethernet supply phy-io not found, using dummy regulator

I have also tested it on Orange Pi PC, that doesn't use external phy, and
instead of:

[    1.081378] dwmac-sun8i 1c30000.ethernet: No regulator found

The kernel now prints:

[    1.112752] dwmac-sun8i 1c30000.ethernet: 1c30000.ethernet supply phy not found, using dummy regulator
[    1.112814] dwmac-sun8i 1c30000.ethernet: 1c30000.ethernet supply phy-io not found, using dummy regulator

Ethernet works in both cases, so that should cover all existing combinations. :)

regards,
	Ondrej


>      Thanks
> 	Andrew
