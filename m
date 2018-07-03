From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/8] dt-bindings: reset: Add AOSS reset bindings for
 SDM845 SoCs
Date: Mon, 2 Jul 2018 20:32:11 -0600
Message-ID: <20180703023211.GA24698@rob-hp-laptop>
References: <20180627142443.1570-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180627142443.1570-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: p.zabel@pengutronix.de, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, kyan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2018 at 07:54:42PM +0530, Sibi Sankar wrote:
> Add SDM845 AOSS (always on subsystem) reset controller binding
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> Not including Rob's earlier Reviewed-by due to change in compatible 
> 
>  .../bindings/reset/qcom,aoss-reset.txt        | 52 +++++++++++++++++++
>  include/dt-bindings/reset/qcom,sdm845-aoss.h  | 17 ++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>  create mode 100644 include/dt-bindings/reset/qcom,sdm845-aoss.h

Reviewed-by: Rob Herring <robh@kernel.org>
