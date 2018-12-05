From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add shutdown-ack irq
 for Q6v5
Date: Wed, 5 Dec 2018 16:54:34 -0600
Message-ID: <20181205225434.GA5059@bogus>
References: <20181120210209.9029-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120210209.9029-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Nov 2018 02:32:07 +0530, Sibi Sankar wrote:
> Add optional shutdown-irq binding required for sysmon shutdown on
> SDM845/MSM8996/QCS404 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
