From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt: binding: Add Qualcomm WCNSS control binding
Date: Wed, 8 Jun 2016 14:50:08 -0500
Message-ID: <20160608195008.GA4874@rob-hp-laptop>
References: <1465256804-27281-1-git-send-email-bjorn.andersson@linaro.org>
 <1465257500-28176-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465257500-28176-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 06, 2016 at 04:58:19PM -0700, Bjorn Andersson wrote:
> This binding describes the control interface for the Qualcomm WCNSS.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Included missed fixup of the smem-state properties
> 
> Changes since v2:
> - Fixup some misstakes in the document pointed out by Rob
> 
> Changes since v1:
> - Introduce reference to wcnss block node for register block definition
> - Use wcnss block node compatible for hw version detection (riva vs pronto)
> - Clean up compatible name for bt node
> 
>  .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt

Acked-by: Rob Herring <robh@kernel.org>
