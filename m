From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence
 CSI2RX version 2.1
Date: Fri, 16 Aug 2019 16:18:02 -0500
Message-ID: <20190816211802.GA12657@bogus>
References: <20190725102648.13445-1-jank@cadence.com>
 <20190725102648.13445-2-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725102648.13445-2-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: maxime.ripard@bootlin.com, mchehab@kernel.org, mark.rutland@arm.com, rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 11:26:46AM +0100, Jan Kotas wrote:
> This patch adds a DT bindings documentation for
> Cadence CSI2RX v2.1 controller.

And 1.3?

> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  Documentation/devicetree/bindings/media/cdns,csi2rx.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> index 6b02a0657..a35bb0aed 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> @@ -5,7 +5,9 @@ The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
>  lanes in input, and 4 different pixel streams in output.
>  
>  Required properties:
> -  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
> +  - compatible: must be set to "cdns,csi2rx" or "cdns,csi2rx-1.3"
> +    for version 1.3 of the controller, "cdns,csi2rx-2.1" for v2.1
> +    and an SoC-specific compatible

This wording is now not clear that an SoC-specific compatible is always 
required or just for 2.1. Please format one compatible per line.

>    - reg: base address and size of the memory mapped region
>    - clocks: phandles to the clocks driving the controller
>    - clock-names: must contain:
> -- 
> 2.15.0
> 
