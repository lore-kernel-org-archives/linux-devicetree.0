From: Yunhui Cui <yunhui.cui@nxp.com>
Subject: RE: [PATCH] dts/ls1043a-rdb: add the DTS for DSPI support
Date: Wed, 13 Apr 2016 02:12:11 +0000
Message-ID: <DB5PR0401MB19128790EBA4E995AAC665EE94960@DB5PR0401MB1912.eurprd04.prod.outlook.com>
References: <1456897935-40507-1-git-send-email-B56489@freescale.com>
 <20160413015313.GC28903@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160413015313.GC28903@tiger>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Yunhui Cui <B56489@freescale.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Yao Yuan <yao.yuan@nxp.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "leoli@freescale.com" <leoli@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Many thanks !

Thanks
Yunhui 

-----Original Message-----
From: Shawn Guo [mailto:shawnguo@kernel.org] 
Sent: Wednesday, April 13, 2016 9:53 AM
To: Yunhui Cui
Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com; ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Yao Yuan; leoli@freescale.com; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
Subject: Re: [PATCH] dts/ls1043a-rdb: add the DTS for DSPI support

On Wed, Mar 02, 2016 at 01:52:15PM +0800, Yunhui Cui wrote:
> This patch adds dts nodes for DSPI on LS1043A-RDB.
> 
> Signed-off-by: Yunhui Cui <B56489@freescale.com>
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>

The patch subject prefix should be like 'arm64: dts: ls1043a-rdb: '.  I fixed it up and applied the patch.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts 
> b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> index ce23557..f895fc0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> @@ -107,6 +107,19 @@
>  		};
>  };
>  
> +&dspi0 {
> +	bus-num = <0>;
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "n25q128a13", "jedec,spi-nor";  /* 16MB */
> +		reg = <0>;
> +		spi-max-frequency = <1000000>; /* input clock */
> +	};
> +};
> +
>  &duart0 {
>  	status = "okay";
>  };
> --
> 2.1.0.27.g96db324
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
