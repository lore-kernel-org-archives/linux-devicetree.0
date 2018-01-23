From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/4] arm64: add support for i.MX8M EVK board
Date: Tue, 23 Jan 2018 18:39:32 +0800
Message-ID: <20180123103931.GE27764@dragon>
References: <20180117183244.28303-1-l.stach@pengutronix.de>
 <20180117183244.28303-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180117183244.28303-3-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 07:32:43PM +0100, Lucas Stach wrote:

> +	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_SD2_CLK_USDHC2_CLK			0x85
> +			MX8MQ_IOMUXC_SD2_CMD_USDHC2_CMD			0xc5
> +			MX8MQ_IOMUXC_SD2_DATA0_USDHC2_DATA0		0xc5
> +			MX8MQ_IOMUXC_SD2_DATA1_USDHC2_DATA1		0xc5
> +			MX8MQ_IOMUXC_SD2_DATA2_USDHC2_DATA2		0xc5
> +			MX8MQ_IOMUXC_SD2_DATA3_USDHC2_DATA3		0xc5
> +			MX8MQ_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xc1
> +		>;
> +		};

Bad indentation.

Shawn

> +
> +	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_SD2_CLK_USDHC2_CLK			0x87
> +			MX8MQ_IOMUXC_SD2_CMD_USDHC2_CMD			0xc7
> +			MX8MQ_IOMUXC_SD2_DATA0_USDHC2_DATA0		0xc7
> +			MX8MQ_IOMUXC_SD2_DATA1_USDHC2_DATA1		0xc7
> +			MX8MQ_IOMUXC_SD2_DATA2_USDHC2_DATA2		0xc7
> +			MX8MQ_IOMUXC_SD2_DATA3_USDHC2_DATA3		0xc7
> +			MX8MQ_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xc1
> +		>;
> +	};
> +};
> -- 
> 2.11.0
> 
