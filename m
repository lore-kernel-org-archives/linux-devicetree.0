From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl
 binding
Date: Fri, 2 Aug 2019 12:03:17 +0530
Message-ID: <20190802063317.GB12733@vkoul-mobl.Dlink>
References: <20190802041507.12365-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190802041507.12365-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linus.walleij@linaro.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jitendra Sharma <shajit@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 02-08-19, 09:45, Rajendra Nayak wrote:
> From: Jitendra Sharma <shajit@codeaurora.org>
> 
> Add the binding for the TLMM pinctrl block found in the SC7180 platform
> 
> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [rnayak: Fix some copy-paste issues, sort and fix functions]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

changes since v1: ..?

> +- reg-names:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Defintiion: names for the cells of reg, must contain "north", "south"

s/Defintiion/Definition

> +Example:
> +
> +	tlmm: pinctrl@3000000 {

this should be: pinctrl@3500000

with these two nitpicks fixed:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
