From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 6/8] dt-bindings: net: stmmac: Convert the binding to a
 schemas
Date: Thu, 23 May 2019 13:07:15 +0200
Message-ID: <20190523110715.ckyzpec3quxr26cp@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi!

On Thu, May 23, 2019 at 10:11:39AM +0000, Jose Abreu wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, May 23, 2019 at 10:56:49
>
> > Switch the STMMAC / Synopsys DesignWare MAC controller binding to a YAML
> > schema to enable the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> How exactly can I see the final results of this ? Do you have any link ?
> (I'm no expert in YAML at all).

You need some extra tooling, that you can find here:
https://github.com/devicetree-org/dt-schema

You can then run make dtbs_check, and those YAML files will be used to
validate that any devicetree using those properties are doing it
properly. That implies having the right node names, properties, types,
ranges of values when relevant, and so on.

Maxime
