Return-Path: <SRS0=cwsg=GG=redhat.com=davem@kernel.org>
Date: Fri, 16 Mar 2018 11:15:02 -0400 (EDT)
Message-Id: <20180316.111502.1114520128775594462.davem@redhat.com>
Subject: Re: [PATCH v5 net-next 0/4] net: macb: Introduce phy-handle DT
 functionality
From: David Miller <davem@redhat.com>
In-Reply-To: <20180313213216.109153-1-brad.mouring@ni.com>
References: <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
	<20180313213216.109153-1-brad.mouring@ni.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
To: brad.mouring@ni.com
Cc: nicolas.ferre@microchip.com, robh+dt@kernel.org, m.grzeschik@pengutronix.de, andrew@lunn.ch, mark.rutland@arm.com, netdev@vger.kernel.org, julia@ni.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Brad Mouring <brad.mouring@ni.com>
Date: Tue, 13 Mar 2018 16:32:12 -0500

> Consider the situation where a macb netdev is connected through
> a phydev that sits on a mii bus other than the one provided to
> this particular netdev. This situation is what this patchset aims
> to accomplish through the existing phy-handle optional binding.
> 
> This optional binding (as described in the ethernet DT bindings doc)
> directs the netdev to the phydev to use. This is precisely the
> situation this patchset aims to solve, so it makes sense to introduce
> the functionality to this driver (where the physical layout discussed
> was encountered).
> 
> The devicetree snippet would look something like this:
 ...
> The work done to add the phy_node in the first place (dacdbb4dfc1a1:
> "net: macb: add fixed-link node support") will consume the
> device_node (if found).
> 
> v2: Reorganization of mii probe/init functions, suggested by Andrew Lunn
> v3: Moved some of the bus init code back into init (erroneously moved to probe)
>     some style issues, and an unintialized variable warning addressed.
> v4: Add Reviewed-by: tags
>     Skip fallback code if phy-handle phandle is found
> v5: Cleanup formatting issues
>     Fix compile failure introduced in 1/4 "net: macb: Reorganize macb_mii
>         bringup"
>     Fix typo in "Documentation: macb: Document phy-handle binding"

Series applied, thank you.
