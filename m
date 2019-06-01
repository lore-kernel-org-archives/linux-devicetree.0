Return-Path: <SRS0=DAy5=UA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46338 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfFAJSf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 1 Jun 2019 05:18:35 -0400
Date: Sat, 1 Jun 2019 11:18:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 07/10] media: dt-bindings: Document i.MX8MQ and
 i.MX8MM VPU bindings
Message-ID: <20190601111829.5643f57d@collabora.com>
In-Reply-To: <20190531085523.10892-8-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-8-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Fri, 31 May 2019 10:55:20 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ
> and for the Hantro G1/G2/H1 VPU on i.MX8MM.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/imx8m-vpu.txt   | 56 +++++++++++++++++++

Hm, shouldn't we have a single bindings file for all hantro-based VPUs?

>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8m-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/imx8m-vpu.txt b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> new file mode 100644
> index 000000000000..659bd28dd002
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> @@ -0,0 +1,56 @@
> +device-tree bindings for Hantro G1/G2/H1 VPU codecs implemented on i.MX8M SoCs
> +
> +Required properties:
> +- compatible: value should be one of the following
> +		"nxp,imx8mq-vpu",
> +		"nxp,imx8mm-vpu";
> +- regs: VPU core and control block register ranges
> +- reg-names: should be
> +		"g1", "g2", "ctrl" on i.MX8MQ,
> +		"g1", "g2", "h1", "ctrl" on i.MX8MM.
> +- interrupts: encoding and decoding interrupt specifiers
> +- interrupt-names: should be
> +		"g1", "g2" on i.MX8MQ,
> +		"g1", "g2", "h1" on i.MX8MM.
> +- clocks: phandle to VPU core clocks and bus clock
> +- clock-names: should be
> +		"g1", "g2", "bus" on i.MX8MQ,
> +		"g1", "g2", "h1", "bus" on i.MX8MM.
> +- power-domains: phandle to power domain node
> +
> +Examples:
> +
> +	vpu: vpu@38300000 {
> +		compatible = "nxp,imx8mq-vpu";
> +		reg = <0x38300000 0x10000>,
> +		      <0x38310000 0x10000>,
> +		      <0x38320000 0x10000>;
> +		reg-names = "g1", "g2", "ctrl";
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "g1", "g2";
> +		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +		clock-names = "g1", "g2", "bus";
> +		power-domains = <&pgc_vpu>;
> +	};
> +
> +	vpu: vpu@38300000 {
> +		compatible = "nxp,imx8mm-vpu";
> +		reg = <0x38300000 0x10000>,
> +		      <0x38310000 0x10000>,
> +		      <0x38320000 0x10000>;
> +		      <0x38330000 0x10000>;
> +		reg-names = "g1", "g2", "h1", "ctrl";
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "g1", "g2", "h1";
> +		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_H1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +		clock-names = "g1", "g2", "h1", "bus";
> +		power-domains = <&pgc_vpu>;
> +	};
