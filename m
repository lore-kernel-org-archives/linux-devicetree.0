From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 07/16] dt-bindings: net: sun4i-mdio: Convert the
 binding to a schemas
Date: Wed, 19 Jun 2019 08:19:11 -0600
Message-ID: <CAL_Jsq+thwOWdfu8Wa2=VeHNHbcUDtAzYEisntY=txnKriG2BA@mail.gmail.com>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <36bc43471d12502b3b49169ca16cf1f5de415f95.1560937626.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <36bc43471d12502b3b49169ca16cf1f5de415f95.1560937626.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 3:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch our Allwinner A10 MDIO controller binding to a YAML schema to enable
> the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Add the generic MDIO YAML schema
>
> Changes from v1:
>   - Add a select statement with the deprecated compatible, and remove it
>     from the valid compatibles
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt      | 27 ---------------------------
>  2 files changed, 70 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt

Reviewed-by: Rob Herring <robh@kernel.org>
