From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 3/4] dt-bindings: drm/msm/gpu: Document a5xx / a6xx
 zap shader region
Date: Thu, 28 Mar 2019 08:32:15 -0500
Message-ID: <20190328133215.GA14020@bogus>
References: <1552414422-9568-1-git-send-email-jcrouse@codeaurora.org>
 <1552414422-9568-4-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552414422-9568-4-git-send-email-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 12:13:41PM -0600, Jordan Crouse wrote:
> Describe the zap-shader node that defines a reserved memory region
> to store the zap shader.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index aad1aef..1e6d870 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -25,6 +25,9 @@ Required properties:
>  - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
>    control the power for the GPU. Applicable targets:
>      - qcom,adreno-630.2
> +- zap-shader: For a5xx and a6xx devices this node contains a memory-region that
> +  points to reserved memory to store the zap shader that can be used to help
> +  bring the GPU out of secure mode.

This is the properties section and zap-shader is not a property.

But why do you need a child node in the first place? Just add 
'memory-region' to the parent.

>  
>  Example 3xx/4xx/a5xx:
>  
> @@ -71,5 +74,9 @@ Example a6xx (with GMU):
>  		operating-points-v2 = <&gpu_opp_table>;
>  
>  		qcom,gmu = <&gmu>;
> +
> +		zap-shader {
> +			memory-region = <&zap_shader_region>;
> +		};
>  	};
>  };
> -- 
> 2.7.4
> 
