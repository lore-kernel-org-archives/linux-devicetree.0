Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Mar 2018 17:23:05 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: ls: Remove "simple-bus" from ifc
 compatible
Message-ID: <20180326222305.fjj55cg34orccage@rob-hp-laptop>
References: <1521382651-10256-1-git-send-email-festevam@gmail.com>
 <1521382651-10256-2-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521382651-10256-2-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Mar 18, 2018 at 11:17:29AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Currently the following dtc warnings are seen when building with W=1:
> 
> Warning (simple_bus_reg): Node /soc/ifc@1530000/nor@0,0 simple-bus unit address format error, expected "0"
> Warning (simple_bus_reg): Node /soc/ifc@1530000/nand@1,0 simple-bus unit address format error, expected "100000000"
> Warning (simple_bus_reg): Node /soc/ifc@1530000/board-control@2,0 simple-bus unit address format error, expect"
> 
> Remove the "simple-bus" from the ifc compatible string to fix these
> warnings.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
