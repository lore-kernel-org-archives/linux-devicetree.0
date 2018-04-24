From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] net: phy: TLK10X initial driver submission
Date: Tue, 24 Apr 2018 19:52:34 +0200
Message-ID: <20180424175234.GC2360@lunn.ch>
References: <20180419082816.109338-1-mans.andersson@nibe.se>
 <20180424163455.vmftcg5xbj6svtcu@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424163455.vmftcg5xbj6svtcu@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: =?iso-8859-1?Q?M=E5ns?= Andersson <mans.andersson@nibe.se>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > +Required properties:
> > +	- reg - The ID number for the phy, usually a small integer
> 
> Isn't this the MDIO bus address?

Hi Rob

Yes. This text has been take direct from the generic PHY binding.
 
> This should have a compatible string too.

Please see Documentation/devicetree/bindings/net/phy.txt

compatible strings are optional. We know what device it is from its ID
registers, which are in a well known location.

	Andrew
