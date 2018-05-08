From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: dsa: Remove unnecessary
 #address/#size-cells
Date: Tue, 8 May 2018 13:58:12 -0700
Message-ID: <926828d5-477a-514f-ac54-42dc7a263f5a@gmail.com>
References: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, davem@davemloft.net
Cc: andrew@lunn.ch, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On 05/07/2018 05:17 AM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> If the example binding is used on a real dts file, the following DTC
> warning is seen with W=1:
>     
> arch/arm/boot/dts/imx6q-b450v3.dtb: Warning (avoid_unnecessary_addr_size): /mdio-gpio/switch@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Remove unnecessary #address-cells/#size-cells to improve the binding
> document examples.

In most cases this is unnecessary because the parent node is an MDIO,
I2C or SPI controller, and those typically have #address-cells = <1> and
#size-cells = <0> because of their specific binding, but this is not
necessarily true if using e.g: a MMIO mapped Ethernet switch.

With the particular example though, this appears fine:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
