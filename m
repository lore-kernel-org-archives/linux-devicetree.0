From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH 3/6] net: stmmac: sun8i: Use devm_regulator_get for PHY
 regulator
Date: Tue, 20 Aug 2019 18:20:27 +0200
Message-ID: <20190820162027.7erc2rlvoqasfjk7@core.my.home>
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-4-megous@megous.com>
 <20190820153939.GL29991@lunn.ch>
 <20190820154714.2rt4ctovil5ol3u2@core.my.home>
 <20190820155744.GN29991@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820155744.GN29991@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Aug 20, 2019 at 05:57:44PM +0200, Andrew Lunn wrote:
> On Tue, Aug 20, 2019 at 05:47:14PM +0200, Ondřej Jirman wrote:
> > Hi Andrew,
> > 
> > On Tue, Aug 20, 2019 at 05:39:39PM +0200, Andrew Lunn wrote:
> > > On Tue, Aug 20, 2019 at 04:53:40PM +0200, megous@megous.com wrote:
> > > > From: Ondrej Jirman <megous@megous.com>
> > > > 
> > > > Use devm_regulator_get instead of devm_regulator_get_optional and rely
> > > > on dummy supply. This avoids NULL checks before regulator_enable/disable
> > > > calls.
> > > 
> > > Hi Ondrej
> > > 
> > > What do you mean by a dummy supply? I'm just trying to make sure you
> > > are not breaking backwards compatibility.
> > 
> > Sorry, I mean dummy regulator. See:
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L1874
> > 
> > On systems that use DT (i.e. have_full_constraints() == true), when the
> > regulator is not found (ENODEV, not specified in DT), regulator_get will return
> > a fake dummy regulator that can be enabled/disabled, but doesn't do anything
> > real.
> 
> Hi Ondrej
> 
> But we also gain a new warning:
> 
> 	dev_warn(dev,
> 		 "%s supply %s not found, using dummy regulator\n",
> 	         devname, id);
> 
> This regulator is clearly optional, so there should not be a warning.
> 
> Maybe you can add a new get_type, OPTIONAL_GET, which does not issue
> the warning, but does give back a dummy regulator.

We already had a info message. See my other e-mail with the dmesg output.

IMO, that warning is useful during development, and more informative than the
previous one.

regards,
	o.

> Thanks
> 	Andrew
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
