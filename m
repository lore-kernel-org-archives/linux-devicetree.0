From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/3] arm64: dts: fsl: ls1028a-rdb: Add ENETC
 external eth ports for the LS1028A RDB board
Date: Wed, 13 Feb 2019 19:15:54 +0100
Message-ID: <20190213181554.GB708@lunn.ch>
References: <1550055743-15542-1-git-send-email-claudiu.manoil@nxp.com>
 <1550055743-15542-3-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550055743-15542-3-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 01:02:22PM +0200, Claudiu Manoil wrote:
> The LS1028A RDB board features an Atheros PHY connected over
> SGMII to the ENETC PF0 (or Port0).  ENETC Port1 (PF1) has no
> external connection on this board, so it can be disabled for now.
> 
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> index fdeb417..c8487893 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> @@ -71,3 +71,18 @@
>  &duart1 {
>  	status = "okay";
>  };
> +
> +&enetc_port0 {
> +	phy-handle = <&sgmii_phy0>;
> +	phy-connection-type = "sgmii";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: ethernet-phy@2 {
> +		reg = <0x2>;
> +	};
> +};
> +

Hi Claudiu

It is better to use:

&enetc_port0 {
	phy-handle = <&sgmii_phy0>;
	phy-connection-type = "sgmii";
	#address-cells = <1>;
	#size-cells = <0>;

	mdio {
		sgmii_phy0: ethernet-phy@2 {
			reg = <0x2>;
		};
	};
};

	Andrew
