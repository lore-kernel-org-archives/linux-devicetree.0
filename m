From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: RE: [PATCH v2 1/1] arm64: Add DTS support for FSL's LS1012A SoC
Date: Fri, 30 Sep 2016 13:57:59 +0000
Message-ID: <VI1PR0401MB2638C032B77C9313C17BBE898DC10@VI1PR0401MB2638.eurprd04.prod.outlook.com>
References: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472207241-18461-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
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
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Bhaskar U <bhaskar.upadhaya@nxp.com>, "oss@buserror.net" <oss@buserror.net>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, "linux-devel@gforge.freescale.net" <linux-devel@gforge.freescale.net>, Pratiyush Srivastava <pratiyush.srivastava@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> +		dspi0: dspi@2100000 {
> +			compatible = "fsl,ls1012a-dspi",
> +				     "fsl,ls1043a-dspi",
> +				     "fsl,ls1021a-v1.0-dspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x2100000 0x0 0x10000>;
> +			interrupts = <0 64 0x4>;
> +			clock-names = "dspi";
> +			clocks = <&clockgen 4 0>;
> +			spi-num-chipselects = <5>;
> +			big-endian;
> +			status = "enabled";

"enabled" is not a valid status value.

Stuart
