From: "suresh.gupta@freescale.com" <suresh.gupta@freescale.com>
Subject: RE: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for
 LS1021A
Date: Thu, 11 Sep 2014 08:41:32 +0000
Message-ID: <fa256d13e4304175b14369b9d3b55729@BL2PR03MB579.namprd03.prod.outlook.com>
References: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com>
 <1410253952-15631-2-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410253952-15631-2-git-send-email-jingchang.lu@freescale.com>
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
To: Shawn Guo <Shawn.Guo@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "chenhui.zhao@freescale.com" <chenhui.zhao@freescale.com>, Chao Fu <B44548@freescale.com>, "shaveta@freescale.com" <shaveta@freescale.com>, Ruchika Gupta <ruchika.gupta@freescale.com>, "bhupesh.sharma@freescale.com" <bhupesh.sharma@freescale.com>, "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>, Jingchang Lu <jingchang.lu@freescale.com>, "nikhil.badola@freescale.com" <nikhil.badola@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Jingchang Lu [mailto:jingchang.lu@freescale.com]
> Sent: Tuesday, September 09, 2014 2:42 PM
> To: Guo Shawn-R65073
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; Lu
> Jingchang-B35083; Badola Nikhil-B46172; Zhao Chenhui-B35336; Gupta Suresh-
> B42813; Leekha Shaveta-B20052; Gupta Ruchika-R66431; Sharma Bhupesh-
> B45370; Fu Chao-B44548; Xiubo Li-B47053; Lu Jingchang-B35083
> Subject: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for LS1021A
> 
> From: Jingchang Lu <b35083@freescale.com>
> 
> Add Freescale LS1021A SoC device tree support
> 
> +
> +		usb@3100000 {
> +			compatible = "fsl,fsl-dwc3";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			dwc3 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x3100000 0x0 0x10000>;
> +				interrupts = <GIC_SPI 93
> IRQ_TYPE_LEVEL_HIGH>;
> +				dr_mode = "host";
> +				maximum-speed = "high-speed";
> +			};
> +		};
> +	};
> +
> +
[SuresH]  Can you please pick this node form ls1-linux -> ls1-dev branch
This node should look like


	usb3@3100000 {
                        compatible = "snps,dwc3";
                        reg = <0x0 0x3100000 0x0 0x10000>;
                        interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
                        dr_mode = "host";
                };
