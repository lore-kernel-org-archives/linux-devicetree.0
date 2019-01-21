Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52755 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfAUK7h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Jan 2019 05:59:37 -0500
Message-ID: <1548068375.3287.1.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 21 Jan 2019 11:59:35 +0100
In-Reply-To: <20190118133716.29288-2-m.tretter@pengutronix.de>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
         <20190118133716.29288-2-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 2019-01-18 at 14:37 +0100, Michael Tretter wrote:
> Add device-tree bindings for the Allegro DVT video IP core found on the
> Xilinx ZynqMP EV family.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes since v1:
> none
> 
> ---
>  .../devicetree/bindings/media/allegro.txt     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Documentation/devicetree/bindings/media/allegro.txt
> new file mode 100644
> index 000000000000..765f4b0c1a57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegro.txt
> @@ -0,0 +1,35 @@
> +Device-tree bindings for the Allegro DVT video IP codecs present in the Xilinx
> +ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H.265
> +decoder ip core.
> +
> +Each actual codec engines is controlled by a microcontroller (MCU). Host
> +software uses a provided mailbox interface to communicate with the MCU. The
> +MCU share an interrupt.
> +
> +Required properties:
> +  - compatible: value should be one of the following
> +    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
> +    "allegro,al5d-1.1", "allegro,al5d": decoder IP core
> +  - reg: base and length of the memory mapped register region and base and
> +    length of the memory mapped sram
> +  - reg-names: must include "regs" and "sram"
> +  - interrupts: shared interrupt from the MCUs to the processing system
> +  - interrupt-names: "vcu_host_interrupt"
> +
> +Example:
> +	al5e: al5e@a0009000 {

Should the node names be "vpu" or "video-codec"?

> +		compatible = "allegro,al5e";
> +		reg = <0 0xa0009000 0 0x1000>,
> +		      <0 0xa0000000 0 0x8000>;
> +		reg-names = "regs", "sram";
> +		interrupt-names = "vcu_host_interrupt";
> +		interrupts = <0 96 4>;
> +	};
> +	al5d: al5d@a0029000 {
> +		compatible = "allegro,al5d";
> +		reg = <0 0xa0029000 0 0x1000>,
> +		      <0 0xa0020000 0 0x8000>;
> +		reg-names = "regs", "sram";
> +		interrupt-names = "vcu_host_interrupt";
> +		interrupts = <0 96 4>;
> +	};

regards
Philipp
