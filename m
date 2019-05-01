From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Wed, 1 May 2019 14:42:24 -0500
Message-ID: <20190501194224.GA991@bogus>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 30 Apr 2019 21:37:31 -0700, Bjorn Andersson wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
