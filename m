From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware
 bindings for Q6V5
Date: Fri, 28 Dec 2018 16:17:06 -0600
Message-ID: <20181228221706.GA22610@bogus>
References: <20181228044819.5697-1-sibis@codeaurora.org>
 <20181228044819.5697-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181228044819.5697-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, briannorris@chromium.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 28 Dec 2018 10:18:18 +0530, Sibi Sankar wrote:
> Add optional "firmware-name" bindings for Q6V5 MSS and PAS based
> remoteprocs. For Q6V5 MSS/PAS the two/one relative firmware
> paths/path are to be listed respectively. Fallback to the default
> images for mba/modem for Q6V5 MSS or the default Hexagon image
> for Q6V5 PAS if the "firmware-name" binding is not present.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 6 ++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 +++++++
>  2 files changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
