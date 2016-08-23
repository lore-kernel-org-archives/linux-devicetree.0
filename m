From: york sun <york.sun@nxp.com>
Subject: Re: [Patch v4 9/9] arm64: Update device tree for Layerscape SoCs
Date: Tue, 23 Aug 2016 21:37:35 +0000
Message-ID: <AM4PR0401MB173218BE03AEF9AB7D0F5FE79AEB0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
References: <1470780000-16750-1-git-send-email-york.sun@nxp.com>
Reply-To: york sun <york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, yangbo lu <yangbo.lu@freescale.com>, Gang Liu <gang.liu@nxp.com>, "morbidrsa@gmail.com" <morbidrsa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oss@buserror.net" <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>, Rajesh Bhagat <rajesh.bhagat@freescale.com>, Olof Johansson <olof@lixom.net>, Mingkai Hu <Mingkai.Hu@freescale.com>, Li Yang <leoli@freescale.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Yao Yuan <yao.yuan@nxp.com>
List-Id: devicetree@vger.kernel.org

+Shawn Guo

On 08/09/2016 03:00 PM, York Sun wrote:
> Add DDR memory controller nodes to enable EDAC driver.
>
> Signed-off-by: York Sun <york.sun@nxp.com>
>
> ---
> Change log
>   v4: no change
>   v3: no change
>   v2: no change
>
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |  7 +++++++
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 14 ++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> index de0323b..cb33f23 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -196,6 +196,13 @@
>  			bus-width = <4>;
>  		};
>
> +		ddr: memory-controller@1080000 {
> +			compatible = "fsl,qoriq-memory-controller";
> +			reg = <0x0 0x1080000 0x0 0x1000>;
> +			interrupts = <0 144 0x4>;
> +			big-endian;
> +		};
> +
>  		dspi0: dspi@2100000 {
>  			compatible = "fsl,ls1043a-dspi", "fsl,ls1021a-v1.0-dspi";
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index 3187c82..3221e5c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -689,4 +689,18 @@
>  			interrupts = <0 12 4>;
>  		};
>  	};
> +
> +	ddr1: memory-controller@1080000 {
> +		compatible = "fsl,qoriq-memory-controller";
> +		reg = <0x0 0x1080000 0x0 0x1000>;
> +		interrupts = <0 17 0x4>;
> +		little-endian;
> +	};
> +
> +	ddr2: memory-controller@1090000 {
> +		compatible = "fsl,qoriq-memory-controller";
> +		reg = <0x0 0x1090000 0x0 0x1000>;
> +		interrupts = <0 18 0x4>;
> +		little-endian;
> +	};
>  };
>
