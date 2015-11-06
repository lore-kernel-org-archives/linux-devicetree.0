From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] pinctrl: qcom: ipq4019: Add IPQ4019 pinctrl support
Date: Thu, 5 Nov 2015 20:34:11 -0600
Message-ID: <20151106023411.GA17997@rob-hp-laptop>
References: <1446761276-9111-1-git-send-email-mmcclint@codeaurora.org>
 <1446761276-9111-2-git-send-email-mmcclint@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446761276-9111-2-git-send-email-mmcclint@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Varadarajan Narayanan <varada@codeaurora.org>, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 05, 2015 at 04:07:52PM -0600, Matthew McClintock wrote:
> From: Varadarajan Narayanan <varada@codeaurora.org>
> 
> Add pinctrl driver support for IPQ4019 platform
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt      |  116 ++
>  drivers/pinctrl/qcom/Kconfig                       |    8 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq4019.c             | 1280 ++++++++++++++++++++
>  4 files changed, 1405 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq4019.c
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> new file mode 100644
> index 0000000..045c5aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> @@ -0,0 +1,116 @@
> +Qualcomm Atheros IPQ4019 TLMM block
> +
> +Required properties:
> +- compatible: "qcom,ipq4019-pinctrl"

Perhaps the name should have TLMM in it. Whatever that stands for.

> +- reg: Should be the base address and length of the TLMM block.
> +- interrupts: Should be the parent IRQ of the TLMM block.
