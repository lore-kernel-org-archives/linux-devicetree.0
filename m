From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v4 13/13] ARM: dts: sunxi: Switch from phy to phy-handle
Date: Tue, 30 Jul 2019 11:51:02 +0800
Message-ID: <CAGb2v67u3pvS1veHTHVPySK1YGJYwGzPF7-iziefsbWRNZNyrg@mail.gmail.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <a1a33392c64c71099021fb49cc811a30790d40a8.1561649505.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <a1a33392c64c71099021fb49cc811a30790d40a8.1561649505.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 11:32 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> The phy device tree property has been deprecated in favor of phy-handle,
> let's replace it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

This patch breaks Ethernet on all my dwmac-sunxi, i.e. old GMAC, boards, with
the following error messages:

    sun7i-dwmac 1c50000.ethernet eth0: no phy at addr -1
    sun7i-dwmac 1c50000.ethernet eth0: stmmac_open: Cannot attach to
PHY (error: -19)

Reverting this patch fixes it.

It also breaks the A10/A10s, but that's probably because the sun4i-emac
driver doesn't recognize the "phy-handle" property.

ChenYu
