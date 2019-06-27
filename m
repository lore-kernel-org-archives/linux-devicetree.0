From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 00/13] net: Add generic and Allwinner YAML bindings
Date: Thu, 27 Jun 2019 13:17:40 -0600
Message-ID: <CAL_JsqJ9VtRv6QKuPO9kXst61ndG1UNBnx8qMkkv879GG7JTXg@mail.gmail.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <20190627.102256.1839462093915893704.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190627.102256.1839462093915893704.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 11:22 AM David Miller <davem@davemloft.net> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, 27 Jun 2019 17:31:42 +0200
>
> > This is an attempt at getting the main generic DT bindings for the ethernet
> > (and related) devices, and convert some DT bindings for the Allwinner DTs
> > to YAML as well.
> >
> > This should provide some DT validation coverage.
>
> I don't think this should go via my tree as it's all DT stuff.

That's fine. I can take it. There's one conflict with commit
79b647a0c0d5 ("dt-bindings: net: document new usxgmii phy mode"), but
that's easy enough to handle. Any other changes to the binding docs
will need to go thru me this cycle.

Rob
