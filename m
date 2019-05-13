From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect
 bindings for MDSS on SDM845
Date: Mon, 13 May 2019 10:48:03 -0400
Message-ID: <20190513144803.GP17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-4-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-4-robdclark@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jayant Shekhar <jshekhar@codeaurora.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, Rob Herring <robh@kernel.org>, Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 01:42:13PM -0700, Rob Clark wrote:
> From: Jayant Shekhar <jshekhar@codeaurora.org>
> 
> Add interconnect properties such as interconnect provider specifier
> , the edge source and destination ports which are required by the
> interconnect API to configure interconnect path for MDSS.
> 
> Changes in v2:
> 	- None
> 
> Changes in v3:
> 	- Remove common property definitions (Rob Herring)
> 
> Changes in v4:
> 	- Use port macros and change port string names (Georgi Djakov)
> 
> Changes in v5-v7:
> 	- None
> 
> Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index ad2e8830324e..a61dd40f3792 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -28,6 +28,11 @@ Required properties:
>  - #address-cells: number of address cells for the MDSS children. Should be 1.
>  - #size-cells: Should be 1.
>  - ranges: parent bus address space is the same as the child bus address space.
> +- interconnects : interconnect path specifier for MDSS according to
> +  Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
> +  2 paths corresponding to 2 AXI ports.
> +- interconnect-names : MDSS will have 2 port names to differentiate between the
> +  2 interconnect paths defined with interconnect specifier.
>  
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> @@ -86,6 +91,11 @@ Example:
>  		interrupt-controller;
>  		#interrupt-cells = <1>;
>  
> +		interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_EBI1>,
> +				<&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EBI1>;
> +
> +		interconnect-names = "mdp0-mem", "mdp1-mem";
> +
>  		iommus = <&apps_iommu 0>;
>  
>  		#address-cells = <2>;
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
