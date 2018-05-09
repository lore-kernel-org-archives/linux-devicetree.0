From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] dt-bindings: dsa: Remove unnecessary
 #address/#size-cells
Date: Tue, 08 May 2018 20:28:58 -0400 (EDT)
Message-ID: <20180508.202858.1234294956740495060.davem@davemloft.net>
References: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: festevam@gmail.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, fabio.estevam@nxp.com
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  7 May 2018 09:17:51 -0300

> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> If the example binding is used on a real dts file, the following DTC
> warning is seen with W=1:
>     
> arch/arm/boot/dts/imx6q-b450v3.dtb: Warning (avoid_unnecessary_addr_size): /mdio-gpio/switch@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Remove unnecessary #address-cells/#size-cells to improve the binding
> document examples.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied, thank you.
