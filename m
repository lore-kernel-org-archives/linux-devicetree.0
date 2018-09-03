From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 00/11] mscc: ocelot: add support for SerDes muxing
 configuration
Date: Mon, 3 Sep 2018 15:34:15 +0200
Message-ID: <20180903133415.GF4445@lunn.ch>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903093308.24366-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

> I suggest patches 1 and 8 go through MIPS tree, 2 to 5 and 11 go through
> net while the others (6, 7, 9 and 10) go through the generic PHY subsystem.

Hi Quentin

Are you expecting merge conflicts? If not, it might be simpler to gets
ACKs from each maintainer, and then merge it though one tree.

     Andrew
