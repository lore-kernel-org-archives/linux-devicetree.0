From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
Date: Wed, 29 May 2019 11:48:29 +0000
Message-ID: <AM0PR04MB44810069F874677C6A2DE795881F0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190520032020.7920-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190520032020.7920-1-peng.fan@nxp.com>
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
To: Peng Fan <peng.fan@nxp.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Srinivas

> Subject: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property

Do you have any comments about this patch?

Thanks,
Peng.

> 
> Introduce fusable-node property for i.MX OCOTP driver.
> The property will only be used by Firmware(eg. U-Boot) to runtime disable the
> nodes.
> 
> Take i.MX6ULL for example, there are several parts that only have limited
> modules enabled controlled by OCOTP fuse. It is not flexible to provide several
> dts for the serval parts, instead we could provide one device tree and let
> Firmware to runtime disable the device tree nodes for those modules that are
> disable(fused).
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> Currently NXP vendor use U-Boot to set status to disabled for devices that
> could not function,
> https://source.codeaurora.org/external/imx/uboot-imx/tree/arch/arm/mach
> -imx/mx6/module_fuse.c?h=imx_v2018.03_4.14.98_2.0.0_ga#n149
> But this approach is will not work if kernel dts node path changed.
> 
> There are two approaches to resolve:
> 
> 1. This patch is to add a fusable-node property, and Firmware will parse
>    the property and read fuse to decide whether to disable or keeep enable
>    the nodes.
> 
> 2. There is another approach is that add nvmem-cells for all nodes that
>    could be disabled(fused). Then in each linux driver to use nvmem
>    api to detect fused or not, or in linux driver common code to check
>    device functionable or not with nvmem API.
> 
> 
> To make it easy to work, we choose [1] here. Please advise whether it is
> acceptable, because the property is not used by linux driver in approach [1].
> Or you prefer [2] or please advise if any better solution.
> 
> Thanks.
> 
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 7a999a135e56..e9a998588dbd 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -21,6 +21,8 @@ Required properties:
> 
>  Optional properties:
>  - read-only: disable write access
> +- fusable-node: array of phandles with reg base and bit offset, this
> +		property is used by Firmware to runtime disable nodes.
> 
>  Optional Child nodes:
> 
> @@ -42,4 +44,7 @@ Example:
>  		tempmon_temp_grade: temp-grade@20 {
>  			reg = <0x20 4>;
>  		};
> +
> +		fusable-node = <&usdhc1 0x10 4
> +				&usdhc2 0x10 5>;
>  	};
> --
> 2.16.4
