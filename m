Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 11:19:58 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 5/6] dt-bindings: power: reset: qcom: Add resin binding
Message-ID: <20180703171958.GA13898@rob-hp-laptop>
References: <20180628150850.15358-1-vkoul@kernel.org>
 <20180628150850.15358-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628150850.15358-6-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 28, 2018 at 08:38:49PM +0530, Vinod Koul wrote:
> Resin is similar to pwrkey, add the description and example
> for resin bindings
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/input/qcom,pm8941-pwrkey.txt       |  1 +
>  Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 14 ++++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
