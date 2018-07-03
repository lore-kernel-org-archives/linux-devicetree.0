Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 11:19:16 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: power: reset: Add qcom pon binding
Message-ID: <20180703171916.GA12849@rob-hp-laptop>
References: <20180628150850.15358-1-vkoul@kernel.org>
 <20180628150850.15358-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628150850.15358-2-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 28, 2018 at 08:38:45PM +0530, Vinod Koul wrote:
> The Power On device for Qcom PM 8xxx is a MFD supporting pwrkey and
> resin along with the Android reboot-mode.
> 
> Add the binding describing this.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/power/reset/qcom,pon.txt   | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt

Reviewed-by: Rob Herring <robh@kernel.org>
