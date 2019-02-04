From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next RFC/PATCH] net: nixge: Make mdio child node optional
Date: Mon, 4 Feb 2019 15:58:54 +0100
Message-ID: <20190204145854.GD22111@lunn.ch>
References: <20190202025048.14772-1-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190202025048.14772-1-mdf@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <mdf@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, davem@davemloft.net, alex.williams@ni.com, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 01, 2019 at 06:50:48PM -0800, Moritz Fischer wrote:
> Make MDIO child optional and only instantiate the
> MDIO bus if the child is actually present.
> 
> There are currently no (in-tree) users of this
> binding; all (out-of-tree) users use overlays that
> get shipped together with the FPGA images that contain
> the IP.
> 
> This will significantly increase maintainabilty
> of future revisions of this IP.
> 
> Signed-off-by: Moritz Fischer <mdf@kernel.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Rob Herring <robh+dt@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
