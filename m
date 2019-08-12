From: Rob Herring <robh@kernel.org>
Subject: Re: [v2 2/3] dt/bindings: display: Add optional property node
 defined for Mali DP500
Date: Mon, 12 Aug 2019 17:19:46 -0600
Message-ID: <20190812231946.GA31179@bogus>
References: <20190719095842.11683-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719095842.11683-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mark.rutland@arm.com, liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie, daniel@ffwll.ch, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2019 at 05:58:42PM +0800, Wen He wrote:
> Add optional property node 'arm,malidp-arqos-value' for the Mali DP500.
> This property describe the ARQoS levels of DP500's QoS signaling.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/arm,malidp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.txt b/Documentation/devicetree/bindings/display/arm,malidp.txt
> index 2f7870983ef1..76a0e7251251 100644
> --- a/Documentation/devicetree/bindings/display/arm,malidp.txt
> +++ b/Documentation/devicetree/bindings/display/arm,malidp.txt
> @@ -37,6 +37,8 @@ Optional properties:
>      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
>      to be used for the framebuffer; if not present, the framebuffer may
>      be located anywhere in memory.
> +  - arm,malidp-arqos-high-level: integer of u32 value describing the ARQoS
> +    levels of DP500's QoS signaling.

u32 here, and...

>  
>  
>  Example:
> @@ -54,6 +56,7 @@ Example:
>  		clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
>  		clock-names = "pxlclk", "mclk", "aclk", "pclk";
>  		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +		arm,malidp-arqos-high-level = <&rqosvalue>;

phandle here?

>  		port {
>  			dp0_output: endpoint {
>  				remote-endpoint = <&tda998x_2_input>;
> -- 
> 2.17.1
> 
