From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/2] dt-bindings: net:  Add bindings for mdio mux
 consumers
Date: Sun, 24 Feb 2019 16:00:40 +0100
Message-ID: <20190224150040.GE26626@lunn.ch>
References: <20190224141338.29907-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190224141338.29907-1-pankaj.bansal@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 24, 2019 at 08:49:21AM +0000, Pankaj Bansal wrote:
> When we use the bindings defined in Documentation/devicetree/bindings/mux
> to define mdio mux in producer and consumer terms, it results in two
> devices. one is mux producer and other is mux consumer.
> 
> Add the bindings needed for Mdio mux consumer devices.
> 
> Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
