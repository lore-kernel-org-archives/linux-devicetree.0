From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 14/16] ARM: dts: sunxi: Switch from phy-mode to
 phy-connection-type
Date: Wed, 19 Jun 2019 16:11:20 +0200
Message-ID: <20190619141120.GD18352@lunn.ch>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <50f869f466acb110c5924d7e8a67087fd97106fd.1560937626.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <50f869f466acb110c5924d7e8a67087fd97106fd.1560937626.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@bootlin.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 11:47:23AM +0200, Maxime Ripard wrote:
> The phy-mode device tree property has been deprecated in favor of
> phy-connection-type, let's replace it.

Hi Maxime

net/ethernet/stmicro/stmmac/dwmac-mediatek.c:		dev_err(plat->dev, "not find phy-mode\n");
net/ethernet/stmicro/stmmac/dwmac-anarion.c:		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
net/ethernet/stmicro/stmmac/dwmac-meson8b.c:		dev_err(&pdev->dev, "missing phy-mode property\n");

As a follow up patch, you might want to change these error messages.

   Andrew
