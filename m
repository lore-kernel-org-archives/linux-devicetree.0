From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 net-next 5/6] dt-bindings: net: dsa: Add
 lantiq,xrx200-gswip DT bindings
Date: Tue, 11 Sep 2018 00:05:16 +0200
Message-ID: <20180910220516.GA16024@lunn.ch>
References: <20180909201647.32727-1-hauke@hauke-m.d>
 <20180909202027.411-1-hauke@hauke-m.de>
 <20180910220119.GA32582@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180910220119.GA32582@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > +See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of
> > +additional required and optional properties.
> > +
> > +

snip

> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	compatible = "lantiq,xrx200-gswip";
> > +	reg = <	0xE108000 0x3000 /* switch */
> > +		0xE10B100 0x70 /* mdio */
> > +		0xE10B1D8 0x30 /* mii */
> > +		>;
> > +	dsa,member = <0 0>;
> 
> Not documented.

Hi Rob

It is documented in Documentation/devicetree/bindings/net/dsa/dsa.txt
referenced above.

	   Andrew
