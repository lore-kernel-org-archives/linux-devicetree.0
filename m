From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 06/11] dt-bindings: net: sun4i-mdio: Convert the
 binding to a schemas
Date: Mon, 10 Jun 2019 16:37:30 +0200
Message-ID: <20190610143730.GH28724@lunn.ch>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <664da05aaf9a7029494d72d7c536baa192672fbe.1560158667.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <664da05aaf9a7029494d72d7c536baa192672fbe.1560158667.git-series.maxime.ripard@bootlin.com>
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

On Mon, Jun 10, 2019 at 11:25:45AM +0200, Maxime Ripard wrote:
> Switch our Allwinner A10 MDIO controller binding to a YAML schema to enable
> the DT validation.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Should there be a generic part to cover what is listed in:

Documentation/devicetree/bindings/net/mdio.txt

	Andrew
