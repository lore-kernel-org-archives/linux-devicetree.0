From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 00/13] net: Add generic and Allwinner YAML bindings
Date: Thu, 27 Jun 2019 10:22:56 -0700 (PDT)
Message-ID: <20190627.102256.1839462093915893704.davem@davemloft.net>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: maxime.ripard@bootlin.com
Cc: mark.rutland@arm.com, robh+dt@kernel.org, frowand.list@gmail.com, wens@csie.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com, antoine.tenart@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 27 Jun 2019 17:31:42 +0200

> This is an attempt at getting the main generic DT bindings for the ethernet
> (and related) devices, and convert some DT bindings for the Allwinner DTs
> to YAML as well.
> 
> This should provide some DT validation coverage.

I don't think this should go via my tree as it's all DT stuff.
