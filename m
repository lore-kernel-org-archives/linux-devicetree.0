From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Date: Tue, 13 Sep 2016 09:56:07 -0500
Message-ID: <20160913145607.GA11998@rob-hp-laptop>
References: <1473130643-12310-1-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473130643-12310-1-git-send-email-linshunquan1@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linshunquan 00354166 <linshunquan1@hisilicon.com>
Cc: mark.rutland@arm.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, howell.yang@hisilicon.com, xuejiancheng@hisilicon.com, jalen.hsu@hisilicon.com, lvkuanliang@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, kevin.lixu@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 06, 2016 at 10:57:22AM +0800, linshunquan 00354166 wrote:
> From: Shunquan Lin <linshunquan1@hisilicon.com>
> 
> This patch adds driver support for HiSilicon Flash Memory
> Controller(FMC). HiSilicon FMC is a multi-functions device which
> supports SPI Nor flash controller, SPI nand Flash controller and
> parallel nand flash controller.
> 
> Signed-off-by: Shunquan Lin <linshunquan1@hisilicon.com>
> ---
>  .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  54 ++++++++++
>  drivers/mfd/Kconfig                                |  10 ++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
>  include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
>  5 files changed, 266 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
>  create mode 100644 drivers/mfd/hisi_fmc.c
>  create mode 100644 include/linux/mfd/hisi_fmc.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt b/Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
> new file mode 100644
> index 0000000..cdaa0bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
> @@ -0,0 +1,54 @@
> +HiSilicon Flash Memory Controller
> +
> +The HiSilicon Flash Memory Controller(FMC) is a feature-rich controller
> +that supports SPI Nor, SPI Nand and Parallel Nand devices. This document
> +describes the binding for HiSilicon FMC device and its sub-notes.
> +
> +Required properties:
> +- compatible : Should be "hisilicon,hisi-fmc".
> +- reg : Offset and length of the register set for the controller device.
> +- reg-names : Must include the following two entries: "control", "memory".
> +- address-cells : Should be 1.
> +- size-cells : Should be 0.
> +- clocks : A phandle to the HiSilicon FMC controller clock.
> +
> +Optional sub-nodes:
> +	- spi-nor:
> +	Required properties:
> +		- compatible : "hisilicon,fmc-spi-nor"
> +	see "Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
> +
> +	- spi-nand:
> +	Required properties:
> +		- compatible : "hisilicon,fmc-spi-nand"
> +		- reg : The chipselect for spi-nand devices
> +		- address-cells : Should be 1.
> +		- size-cells : Should be 0.
> +
> +	- nand:
> +	Required properties:
> +		- compatible : "hisilicon,fmc-nand"
> +		- reg : The chipselect for nand devices
> +		- address-cells : Should be 1.
> +		- size-cells : Should be 0.
> +
> +Example:
> +fmc: spi-nor-controller@10000000 {
> +		 compatible = "hisilicon,hisi-fmc";
> +		 reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
> +		 reg-names = "control", "memory";
> +		 clocks = <&crg FMC_CLK>;
> +		 #address-cells = <1>;
> +		 #size-cells = <0>;
> +
> +		 hisfc:spi-nor@0 {
> +				   compatible = "hisilicon,fmc-spi-nor";

Is this an actual h/w sub-block? If not remove this node and make the 
spi-nor the immediate child.

> +				   #address-cells = <1>;
> +				   #size-cells = <0>;
> +				   hi_sfc {
> +					   compatible = "jedec,spi-nor";
> +					   reg = <0>;
> +				   };
> +		};
> +
> +};
