From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] soc: qcom: Update properties for smem state referencing
Date: Fri, 10 Jun 2016 12:58:47 -0500
Message-ID: <20160610175847.GA31060@rob-hp-laptop>
References: <1465531882-25967-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465531882-25967-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 09, 2016 at 09:11:22PM -0700, Bjorn Andersson wrote:
> Update the property names to match device tree bindings, the correct
> values should be qcom,smem-states and qcom,smem-state-names.
> 
> Also update the #qcom,smem-state-cells for consistency, before we merge
> any users of these properties.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt |  4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt  |  4 ++--

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/soc/qcom/smem_state.c                             | 12 ++++++------
>  3 files changed, 10 insertions(+), 10 deletions(-)
