From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Fri, 11 Jan 2019 16:10:10 -0600
Message-ID: <20190111221010.GA25365@bogus>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
 <20190106080915.4493-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190106080915.4493-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun,  6 Jan 2019 00:09:09 -0800, Bjorn Andersson wrote:
> Add binding for the QMP based side-channel communication mechanism to
> the AOSS, which is used to control resources not exposed through the
> RPMh interface.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Don't describe power-domain as a separate child node
> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 57 +++++++++++++++++++
>  include/dt-bindings/power/qcom-aoss-qmp.h     | 15 +++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
