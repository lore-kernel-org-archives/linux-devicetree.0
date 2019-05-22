From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: phy: dp83867: Add
 documentation for disabling clock output
Date: Wed, 22 May 2019 21:11:48 +0200
Message-ID: <20190522191148.GH7281@lunn.ch>
References: <20190522184255.16323-1-tpiepho@impinj.com>
 <20190522184255.16323-2-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522184255.16323-2-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 06:43:21PM +0000, Trent Piepho wrote:
> The clock output is generally only used for testing and development and
> not used to daisy-chain PHYs.  It's just a source of RF noise afterward.
> 
> Add a mux value for "off".  I've added it as another enumeration to the
> output property.  In the actual PHY, the mux and the output enable are
> independently controllable.  However, it doesn't seem useful to be able
> to describe the mux setting when the output is disabled.
> 
> Document that PHY's default setting will be left as is if the property
> is omitted.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
