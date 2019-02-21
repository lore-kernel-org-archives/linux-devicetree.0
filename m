From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] dt-bindings: Add bindings for mdio mux consumers
Date: Thu, 21 Feb 2019 14:45:04 +0100
Message-ID: <20190221134504.GE5653@lunn.ch>
References: <20190221182349.4057-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190221182349.4057-1-pankaj.bansal@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 12:59:19PM +0000, Pankaj Bansal wrote:
> When we use the bindings defined in Documentation/devicetree/bindings/mux
> to define mdio mux in producer and consumer terms, it results in two
> devices. one is mux producer and other is mux consumer.
> 
> Add the bindings needed for Mdio mux consumer devices.

Hi Pankaj

Please thread this binding patch with the code which implements the
binding. The two should be reviewed together.

Thanks
	Andrew
