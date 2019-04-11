Return-Path: <shawnguo@kernel.org>
Date: Thu, 11 Apr 2019 10:24:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 0/5] ARM: imx7s: add media nodes
Message-ID: <20190411022407.GJ26817@dragon>
References: <20190328142516.30372-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328142516.30372-1-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 28, 2019 at 02:25:11PM +0000, Rui Miguel Silva wrote:
> This series is a continuation of the
> [PATCH v14 00/13] media: staging/imx7: add i.MX7 media driver [0] series.
> All code patches and bindings are already merged, missing only this
> dts patches.
> 
> The main difference from the version in the previous series is as
> commented by Laurent:
>  - split of dtsi and dts in 2 patches
>  - push endpoints to imx7s.dtsi
> 
> Cheers,
>    Rui
> 
> v2->v3:
> Laurent Pinchart:
>   - Add label to csi-mux
>   - Disable csi-mux in imx7s
>   - enable it in warp dts
>   - add port@0 to mux
> 
> v1->v2:
> Shawn Guo:
>   - sort alphabetically
>   - hyphen for node name
>   - indent align clocks
>   - send status to end of property list
> 
> Rui Miguel Silva (5):
>   ARM: dts: imx7s: add mipi phy power domain
>   ARM: dts: imx7s: add multiplexer controls
>   ARM: dts: imx7s: Add video mux, csi and mipi_csi
>   ARM: dts: imx7s-warp: add csi and mipi_csi node
>   ARM: dts: imx7s-warp: add ov2680 sensor node

Applied all, thanks.
