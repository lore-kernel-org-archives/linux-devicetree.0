Return-Path: <robherring2@gmail.com>
Date: Wed, 1 May 2019 17:38:11 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [v4] arm64: dts: ls1028a: Add properties for Mali DP500 node
Message-ID: <20190501223811.GA14221@bogus>
References: <20190422101941.11335-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190422101941.11335-1-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, 22 Apr 2019 10:18:10 +0000, Wen He wrote:
> The LS1028A has a LCD controller and Displayport interface that
> connects to eDP and Displayport connectors on the LS1028A board.
> 
> This patch enables the LCD controller driver on the LS1028A.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
> change in v4:
>         - using 'malidp0:display' instead of the node name
>         'display0:malidp'.
> change in v3:
>         - using 'display0' instead of node name 'display-0' to
>         fixed syntax error.
> 
> change in v2:
>         - renamed node name 'dp0' to be generic name 'display-0'.
>         - replace clk name 'xxclk' to 'clock-xx'.
>         - add newline between properties and child node.
> 
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
