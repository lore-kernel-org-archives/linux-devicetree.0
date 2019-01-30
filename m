From: Rob Herring <robh@kernel.org>
Subject: Re: [v7 3/3] dt-bindings: msm/disp: Introduce interconnect bindings
 for MDSS on SDM845
Date: Wed, 30 Jan 2019 09:48:18 -0600
Message-ID: <20190130154818.GA24282@bogus>
References: <1548306592-4708-1-git-send-email-jshekhar@codeaurora.org>
 <1548306592-4708-4-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548306592-4708-4-git-send-email-jshekhar@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, Jayant Shekhar <jshekhar@codeaurora.org>, linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org, Sravanthi Kollukuduru <skolluku@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Jan 2019 10:39:52 +0530, Jayant Shekhar wrote:
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
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
