From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: RE: [PATCH v2 10/11] dt-bindings: net: dwmac: Deprecate the PHY reset
 properties
Date: Mon, 10 Jun 2019 17:50:11 +0200
Message-ID: <20190610155011.4305-1-martin.blumenstingl@googlemail.com>
References: <ff6306c71a6b6ad174007f9f2823499d3093e21c.1560158667.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ff6306c71a6b6ad174007f9f2823499d3093e21c.1560158667.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>, linux-stm32@st-md-mailman.stormreply.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

> Even though the DWMAC driver uses some driver specific properties, the PHY
> core has a bunch of generic properties and can deal with them nicely.
> 
> Let's deprecate our specific properties.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
I am not sure about the yaml syntax for deprecated properties but
the description inside the .yaml file looks good to me so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
