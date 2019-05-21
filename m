From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Tue, 21 May 2019 16:12:11 +0530
Message-ID: <20190521104211.GF15118@vkoul-mobl>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30-04-19, 21:37, Bjorn Andersson wrote:
> Add binding for the QMP based side-channel communication mechanism to
> the AOSS, which is used to control resources not exposed through the
> RPMh interface.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - Added #clock-cells
> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 81 +++++++++++++++++++
>  include/dt-bindings/power/qcom-aoss-qmp.h     | 14 ++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> new file mode 100644
> index 000000000000..14a45b3dc059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -0,0 +1,81 @@
> +Qualcomm Always-On Subsystem side channel binding
> +
> +This binding describes the hardware component responsible for side channel
> +requests to the always-on subsystem (AOSS), used for certain power management
> +requests that is not handled by the standard RPMh interface. Each client in the
> +SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> +The protocol used to communicate in the message RAM is known as Qualcomm
> +Messagin Protocol (QMP)

s/Messagin/Messaging?

Rest lgtm:
Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
