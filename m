Return-Path: <robherring2@gmail.com>
Date: Tue, 13 Aug 2019 09:32:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: interconnect: Add Qualcomm QCS404 DT
 bindings
Message-ID: <20190813153249.GA29326@bogus>
References: <20190723142339.27772-1-georgi.djakov@linaro.org>
 <20190723142339.27772-2-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723142339.27772-2-georgi.djakov@linaro.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 23 Jul 2019 17:23:35 +0300, Georgi Djakov wrote:
> The Qualcomm QCS404 platform has several buses that could be controlled
> and tuned according to the bandwidth demand.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> 
> v5:
> - Make reg and clocks DT properties required.
> - Remove the _clk suffix from clock names.
> 
> v4:
> - Add the DT header into this patch.
> - Pick Bjorn's r-b.
> 
> v3:
> - Add a reg property and move the interconnect nodes under the "soc" node.
> 
> v2:
> - No changes.
> 
>  .../bindings/interconnect/qcom,qcs404.txt     | 45 ++++++++++
>  .../dt-bindings/interconnect/qcom,qcs404.h    | 88 +++++++++++++++++++
>  2 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
>  create mode 100644 include/dt-bindings/interconnect/qcom,qcs404.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
