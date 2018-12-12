From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-binding: remoteproc: Remove lpass_aon clock from
 adsp pil clock list
Date: Tue, 11 Dec 2018 20:32:34 -0600
Message-ID: <20181212023234.GA4973@bogus>
References: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
 <1543562950-23997-2-git-send-email-rohitkr@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543562950-23997-2-git-send-email-rohitkr@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, Rohit kumar <rohitkr@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 30 Nov 2018 12:59:09 +0530, Rohit kumar wrote:
> LPASS_Audio_Wrapper_AON clock is on by default. Remove
> it from lpass clock list to avoid voting for it.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
