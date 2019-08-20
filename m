From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/6] net: stmmac: sun8i: Use devm_regulator_get for PHY
 regulator
Date: Tue, 20 Aug 2019 17:39:39 +0200
Message-ID: <20190820153939.GL29991@lunn.ch>
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-4-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820145343.29108-4-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 04:53:40PM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Use devm_regulator_get instead of devm_regulator_get_optional and rely
> on dummy supply. This avoids NULL checks before regulator_enable/disable
> calls.

Hi Ondrej

What do you mean by a dummy supply? I'm just trying to make sure you
are not breaking backwards compatibility.

     Thanks
	Andrew
