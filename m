Return-Path: <SRS0=NcRe=GD=ni.com=prvs=261051e907=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v5 net-next 0/4] net: macb: Introduce phy-handle DT functionality
Date: Tue, 13 Mar 2018 16:32:12 -0500
Message-ID: <20180313213216.109153-1-brad.mouring@ni.com>
In-Reply-To: <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
References: <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


Consider the situation where a macb netdev is connected through
a phydev that sits on a mii bus other than the one provided to
this particular netdev. This situation is what this patchset aims
to accomplish through the existing phy-handle optional binding.

This optional binding (as described in the ethernet DT bindings doc)
directs the netdev to the phydev to use. This is precisely the
situation this patchset aims to solve, so it makes sense to introduce
the functionality to this driver (where the physical layout discussed
was encountered).

The devicetree snippet would look something like this:

...
   ethernet@feedf00d {
           ...
           phy-handle = <&phy0> // the first netdev is physically wired to phy0
           ...
           phy0: phy@0 {
                   ...
                   reg = <0x0> // MDIO address 0
                   ...
           }
           phy1: phy@1 {
                   ...
                   reg = <0x1> // MDIO address 1
                   ...
           }
           ...
   }

   ethernet@deadbeef {
           ...
           phy-handle = <&phy1> // tells the driver to use phy1 on the
                                // first mac's mdio bus (it's wired thusly)
           ...
   }
...

The work done to add the phy_node in the first place (dacdbb4dfc1a1:
"net: macb: add fixed-link node support") will consume the
device_node (if found).

v2: Reorganization of mii probe/init functions, suggested by Andrew Lunn
v3: Moved some of the bus init code back into init (erroneously moved to probe)
    some style issues, and an unintialized variable warning addressed.
v4: Add Reviewed-by: tags
    Skip fallback code if phy-handle phandle is found
v5: Cleanup formatting issues
    Fix compile failure introduced in 1/4 "net: macb: Reorganize macb_mii
        bringup"
    Fix typo in "Documentation: macb: Document phy-handle binding"
