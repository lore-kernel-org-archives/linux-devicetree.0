Return-Path: <robherring2@gmail.com>
Date: Mon, 25 Jun 2018 11:27:47 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: Input: Add additional property to
 qcom pwrkey
Message-ID: <20180625172747.GA32100@rob-hp-laptop>
References: <20180625063840.30173-1-vkoul@kernel.org>
 <20180625063840.30173-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625063840.30173-4-vkoul@kernel.org>
To: Vinod Koul <vinod.koul@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 25, 2018 at 12:08:38PM +0530, Vinod Koul wrote:
> Pwrkey and reset have similar properties so add additional
> property for linux,code to use the code for sending events.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
