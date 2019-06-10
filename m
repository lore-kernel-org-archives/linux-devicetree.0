From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 04/11] dt-bindings: net: phy: The interrupt property
 is not mandatory
Date: Mon, 10 Jun 2019 16:25:02 +0200
Message-ID: <20190610142502.GF28724@lunn.ch>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <19f160b6edf5a11171cea249305b7458c96a7187.1560158667.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19f160b6edf5a11171cea249305b7458c96a7187.1560158667.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 11:25:43AM +0200, Maxime Ripard wrote:
> Unlike what was initially claimed in the PHY binding, the interrupt
> property of a PHY can be omitted, and the OS will turn to polling instead.
> 
> Document that.

Ah!

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
