From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: reset: Add PDC Global binding for
 SDM845 SoCs
Date: Tue, 28 Aug 2018 19:43:20 -0500
Message-ID: <20180829004320.GA1201@bogus>
References: <20180824131900.5353-1-sibis@codeaurora.org>
 <20180824131900.5353-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180824131900.5353-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 24 Aug 2018 18:48:55 +0530, Sibi Sankar wrote:
> Add PDC Global(Power Domain Controller) binding for SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/reset/qcom,pdc-global.txt        | 52 +++++++++++++++++++
>  include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
>  create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
