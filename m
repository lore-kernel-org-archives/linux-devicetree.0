From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv3 1/3] dt-bindings: net: Add DT bindings for Socionext
 Netsec
Date: Wed, 27 Dec 2017 09:28:47 +0100
Message-ID: <20171227082847.GB10517@lunn.ch>
References: <1513858196-14137-1-git-send-email-jassisinghbrar@gmail.com>
 <1513858254-14197-1-git-send-email-jassisinghbrar@gmail.com>
 <20171221135541.GC15416@lunn.ch>
 <f42d29cc-6b3f-20dc-3f42-bc9a9fc7ce4a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f42d29cc-6b3f-20dc-3f42-bc9a9fc7ce4a@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: jassisinghbrar@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, davem@davemloft.net, arnd.bergmann@linaro.org, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 26, 2017 at 11:34:26AM -0800, Florian Fainelli wrote:
> On 12/21/2017 05:55 AM, Andrew Lunn wrote:
> >> +- mdio device tree subnode: When the Netsec has a phy connected to its local
> >> +		mdio, there must be device tree subnode with the following
> >> +		required properties:
> >> +
> >> +	- compatible: Must be "socionext,snq-mdio".
> > 
> > Is there a need for a compatible string? Is there different versions
> > of the MDIO bus hardware? If it was an independent MDIO bus driver,
> > then yes, you need a compatible string. But since it is embedded in
> > the MAC driver, there should not be a need.
> 
> I don't see a problem with doing that though, it may be extra
> information, but if we ever have a standalone MDIO bus controller that
> happens to be supported by the same HW/driver, and the Ethernet driver
> delegates the MDIO management to this MDIO bus driver, then having the
> compatible string is kind of mandatory for proper matching/identification.

Hi Florian

I does not create a problem. It does however make it different to
every other embedded MDIO bus.

My preference is not to have the compatible string, but i can live
with it.

      Andrew
