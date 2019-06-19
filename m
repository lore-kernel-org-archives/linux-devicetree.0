From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 11/16] dt-bindings: net: dwmac: Deprecate the PHY reset properties
Date: Wed, 19 Jun 2019 08:47:24 -0600
Message-ID: <CAL_Jsq+69nL40xUxYAEWaixEqs9=oNdbp-59Jogx8o2wyYFdnw@mail.gmail.com>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <07bc6b607cf1ad88214b7ce528fadf0b1ce30784.1560937626.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <07bc6b607cf1ad88214b7ce528fadf0b1ce30784.1560937626.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 3:47 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Even though the DWMAC driver uses some driver specific properties, the PHY
> core has a bunch of generic properties and can deal with them nicely.
>
> Let's deprecate our specific properties.
>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Use the deprecated keyword instead of duplicating them
>
> Changes from v1:
>   - New patch
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
