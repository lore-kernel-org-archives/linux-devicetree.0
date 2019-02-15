Return-Path: <SRS0=n0G4=QW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34603 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726396AbfBOIhk (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Feb 2019 03:37:40 -0500
Subject: Re: [PATCH 3/3] media: mx2-emmaprp: Add DT bindings documentation
References: <20181216034907.15787-1-shc_work@mail.ru>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <799b49d0-0bea-7029-0259-baeacd06e105@xs4all.nl>
Date: Fri, 15 Feb 2019 09:37:34 +0100
MIME-Version: 1.0
In-Reply-To: <20181216034907.15787-1-shc_work@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Rob,

Can you take a look at this?

Thanks!

	Hans

On 12/16/18 4:49 AM, Alexander Shiyan wrote:
> This patch adds DT binding documentation for the Freescale enhanced
> Multimedia Accelerator (eMMA) video Pre-processor (PrP).
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/media/fsl-emmaprp.txt        | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl-emmaprp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl-emmaprp.txt b/Documentation/devicetree/bindings/media/fsl-emmaprp.txt
> new file mode 100644
> index 0000000..9dd7cc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl-emmaprp.txt
> @@ -0,0 +1,20 @@
> +* Freescale enhanced Multimedia Accelerator (eMMA) video Pre-processor (PrP)
> +  for i.MX21 & i.MX27 SoCs.
> +
> +Required properties:
> +- compatible : Shall contain "fsl,imx21-emmaprp" for compatible with
> +               the one integrated on i.MX21 SoC.
> +- reg        : Offset and length of the register set for the device.
> +- interrupts : Should contain eMMA PrP interrupt number.
> +- clocks     : Should contain the ahb and ipg clocks, in the order
> +               determined by the clock-names property.
> +- clock-names: Should be "ahb", "ipg".
> +
> +Example:
> +	emmaprp: emmaprp@10026400 {
> +		compatible = "fsl,imx21-emmaprp";
> +		reg = <0x10026400 0x100>;
> +		interrupts = <51>;
> +		clocks = <&clks 49>, <&clks 68>;
> +		clock-names = "ipg", "ahb";
> +	};
> 
