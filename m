From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/5] mtd: mchp23k256: Add OF device ID table
Date: Wed, 31 May 2017 12:50:40 -0500
Message-ID: <20170531175040.n4eerwek4isjfg3m@rob-hp-laptop>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170524234916.16181-2-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch, computersforpeace@gmail.com, dwmw2@infradead.org, boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 11:49:12AM +1200, Chris Packham wrote:
> This allows registering of this device via a Device Tree.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Changes in v2:
> - collect review/test from Andrew
> Changes in v3:
> - None
> Changes in v4:
> - None
> 
>  .../devicetree/bindings/mtd/microchip,mchp23k256.txt   | 18 ++++++++++++++++++
>  drivers/mtd/devices/mchp23k256.c                       |  8 ++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

Acked-by: Rob Herring <robh@kernel.org>
