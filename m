From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Mon, 3 Dec 2018 17:51:45 -0600
Message-ID: <20181203235145.GA30118@bogus>
References: <20181112080557.22698-1-bjorn.andersson@linaro.org>
 <20181112080557.22698-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181112080557.22698-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2018 at 12:05:55AM -0800, Bjorn Andersson wrote:
> Add binding for the QMP based side-channel communication mechanism to
> the AOSS, which is used to control resources not exposed through the
> RPMh interface.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 63 +++++++++++++++++++
>  include/dt-bindings/power/qcom-aoss-qmp.h     | 15 +++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> new file mode 100644
> index 000000000000..e3c8cb4372f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -0,0 +1,63 @@
> +Qualcomm Always-On Subsystem side channel binding
> +
> +This binding describes the hardware component responsible for side channel
> +requests to the always-on subsystem (AOSS), used for certain power management
> +requests that is not handled by the standard RPMh interface. Each client in the
> +SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> +The protocol used to communicate in the message RAM is known as QMP.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,sdm845-aoss-qmp"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: the base address and size of the message RAM for this
> +		    client's communication with the AOSS
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the AOSS message IRQ for this client
> +
> +- mboxes:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: reference to the mailbox representing the outgoing doorbell
> +		    in APCS for this client, as described in mailbox/mailbox.txt
> +
> += AOSS Power-domains
> +The AOSS side channel exposes control over a set of resources, used to control
> +a set of debug related clocks and to affect the low power state of resources
> +related to the secondary subsystems. These resources are described as a set of
> +power-domains in a subnode of hte AOSS side channel node.

Why does this need to be a sub-node? Are there other sub-nodes needed?

> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,sdm845-aoss-qmp-pd"
> +
> +- #power-domain-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 1
