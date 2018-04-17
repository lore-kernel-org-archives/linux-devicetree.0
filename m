From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/3] net: phy: Change the array size to 32 for
 device_ids
Date: Tue, 17 Apr 2018 14:54:29 +0200
Message-ID: <20180417125429.GE2591@lunn.ch>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
 <20180417090233.21548-3-vicentiu.galanopulo@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417090233.21548-3-vicentiu.galanopulo@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Cc: robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org, alexandru.marginean@nxp.com, madalin.bucur@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2018 at 04:02:32AM -0500, Vicentiu Galanopulo wrote:
> In the context of enabling the discovery of the PHYs
> which have the C45 MDIO address space in a non-standard
> address:  num_ids in get_phy_c45_ids, has the
> value 8 (ARRAY_SIZE(c45_ids->device_ids)), but the
> u32 *devs can store 32 devices in the bitfield.
> 
> If a device is stored in *devs, in bits 32 to 9
> (bit counting in lookup loop starts from 1), it will
> not be found.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
