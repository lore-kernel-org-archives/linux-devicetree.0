From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: enable otg mode for dwc3 usb ip on
 layerscape
Date: Mon, 14 Oct 2019 14:52:12 +0800
Message-ID: <20191014065210.GE12262@dragon>
References: <20190924032903.32775-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924032903.32775-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, xiaobo.xie@nxp.com, jiafei.pan@nxp.com, Ran Wang <ran.wang_1@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 11:29:03AM +0800, Yinbo Zhu wrote:
> layerscape otg function should be supported HNP SRP and ADP protocol
> accroing to rm doc, but dwc3 code not realize it and use id pin to
> detect who is host or device(0 is host 1 is device) this patch is to
> enable OTG mode on ls1028ardb ls1088ardb and ls1046ardb in dts
> 
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 4 ++++
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 4 ++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts | 1 +

This is an arm64 DTS patch, so the patch prefix should be something
like 'arm64 dts: fsl: ...'

Shawn

>  3 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> index 9fb9113..076cac6 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> @@ -171,3 +171,7 @@
>  &sata {
>  	status = "okay";
>  };
> +
> +&usb1 {
> +	dr_mode = "otg";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> index 6a6514d..0c742be 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> @@ -122,6 +122,10 @@
>  	};
>  };
>  
> +&usb1 {
> +	dr_mode = "otg";
> +};
> +
>  #include "fsl-ls1046-post.dtsi"
>  
>  &fman0 {
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index 8e925df..90b1989 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -95,5 +95,6 @@
>  };
>  
>  &usb1 {
> +	dr_mode = "otg";
>  	status = "okay";
>  };
> -- 
> 2.9.5
> 
