From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: qcom: Add SDM845 bindings
Date: Mon, 19 Feb 2018 13:34:26 -0600
Message-ID: <20180219193426.darxcui4g4oxyf32@rob-hp-laptop>
References: <20180216060503.22006-1-rnayak@codeaurora.org>
 <20180216060503.22006-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180216060503.22006-3-rnayak@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, dianders@chromium.org, evgreen@chromium.org, linux-kernel@vger.kernel.org, andy.gross@linaro.org, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 16, 2018 at 11:35:01AM +0530, Rajendra Nayak wrote:
> Add a SoC string 'sdm845' for the qualcomm SDM845 SoC
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
> index 0ed4d39d7fe1..ee532e705d6c 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.txt
> +++ b/Documentation/devicetree/bindings/arm/qcom.txt
> @@ -26,6 +26,7 @@ The 'SoC' element must be one of the following strings:
>  	msm8996
>  	mdm9615
>  	ipq8074
> +	sdm845

These should really be the full string with 'qcom,', but you don't have 
to fix that now.

Reviewed-by: Rob Herring <robh@kernel.org>
