From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: ethernet: Update mt7622
 docs and dts to reflect the new phylink API
Date: Thu, 25 Jul 2019 21:31:23 +0200
Message-ID: <20190725193123.GA32542@lunn.ch>
References: <20190724192411.20639-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724192411.20639-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +	gmac0: mac@0 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <0>;
> +		phy-mode = "sgmii";
> +
> +		fixed-link {
> +			speed = <2500>;
> +			full-duplex;
> +			pause;
> +		};
> +	};

Hi René

SGMII and fixed-link is rather odd. Why do you need this combination?

      Andrew
