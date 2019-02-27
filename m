From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Add bindings for mdio mux
 consumers
Date: Wed, 27 Feb 2019 12:52:42 -0800 (PST)
Message-ID: <20190227.125242.102996489965200418.davem@davemloft.net>
References: <20190225114121.7878-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190225114121.7878-1-pankaj.bansal@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: pankaj.bansal@nxp.com
Cc: leoyang.li@nxp.com, peda@axentia.se, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Pankaj Bansal <pankaj.bansal@nxp.com>
Date: Mon, 25 Feb 2019 06:16:53 +0000

> When we use the bindings defined in Documentation/devicetree/bindings/mux
> to define mdio mux in producer and consumer terms, it results in two
> devices. one is mux producer and other is mux consumer.
> 
> Add the bindings needed for Mdio mux consumer devices.
> 
> Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>

Applied.
