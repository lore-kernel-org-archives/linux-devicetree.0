From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add bus clock for Mali Midgard GPUs
Date: Tue, 11 Dec 2018 16:09:08 -0600
Message-ID: <20181211220908.GA7630@bogus>
References: <20181127074249.15204-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181127074249.15204-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 03:42:48PM +0800, Icenowy Zheng wrote:
> Some SoCs adds a bus clock gate to the Mali Midgard GPU.
> 
> Add the binding for the bus clock.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> index 18a2cde2e5f3..02f870cd60e6 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -31,6 +31,12 @@ Optional properties:
>  
>  - clocks : Phandle to clock for the Mali Midgard device.
>  
> +- clock-names : Specify the names of the clocks specified in clocks
> +  when multiple clocks are present.
> +    * bus: bus clock for the GPU
> +    * core: clock driving the GPU itself (When only one clock is present,
> +      assume it's this clock.)

'core' should be first since it already exists.

> +
>  - mali-supply : Phandle to regulator for the Mali device. Refer to
>    Documentation/devicetree/bindings/regulator/regulator.txt for details.
>  
> -- 
> 2.18.1
> 
