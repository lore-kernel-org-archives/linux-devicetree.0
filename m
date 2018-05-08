From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next] dt-bindings: dsa: Remove unnecessary
 #address/#size-cells
Date: Tue, 8 May 2018 11:53:21 -0500
Message-ID: <20180508165321.GA5286@rob-hp-laptop>
References: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: davem@davemloft.net, f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 07, 2018 at 09:17:51AM -0300, Fabio Estevam wrote:
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
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa.txt | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
