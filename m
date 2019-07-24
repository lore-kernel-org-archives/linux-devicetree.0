From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/13] dt-bindings: power: avs: Add support for CPR (Core
 Power Reduction)
Date: Wed, 24 Jul 2019 10:06:01 -0600
Message-ID: <20190724160601.GA9333@bogus>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-10-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-10-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, linux-arm-msm@vger.kernel.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri,  5 Jul 2019 11:57:20 +0200, Niklas Cassel wrote:
> Add DT bindings to describe the CPR HW found on certain Qualcomm SoCs.
> 
> Changes since RFC:
> -Make compatible string SoC specific.
> -Changed interrupt definition.
> -Use clock binding for reference clock.
> -Clarified qcom,vdd-apc-step-up-limit description.
> -Added missing properties.
> -Updated the example.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  .../bindings/power/avs/qcom,cpr.txt           | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
