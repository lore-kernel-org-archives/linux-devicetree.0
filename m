From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt: bindings: add bindings for wifi iommu node
Date: Mon, 24 Sep 2018 15:53:14 -0700
Message-ID: <5baa1b0b.1c69fb81.79d38.4171@mx.google.com>
References: <20180921090907.25937-1-govinds@codeaurora.org>
 <20180921090907.25937-4-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180921090907.25937-4-govinds@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
To: Govind Singh <govinds@codeaurora.org>
Cc: andy.gross@linaro.org, devicetree@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 02:39:06PM +0530, Govind Singh wrote:
> WCN3990 wifi module can optionally make use of the IOMMU.

Can the other compatibles use IOMMU too?

> Add binding documentation for phandle to the IOMMU and
> the stream id of wifi iommu block.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 22dea7d83ee8..07e58008c665 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -59,6 +59,10 @@ Optional properties:
>  - <supply-name>-supply: handle to the regulator device tree node
>  			   optional "supply-name" are "vdd-0.8-cx-mx",
>  			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
> +- iommus:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: A list of phandle and IOMMU specifier pairs.
>  
>  Example (to supply the calibration data alone):
>  
> @@ -157,4 +161,5 @@ wifi@18000000 {
>  		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>  		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>  		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +		iommus = <&apps_smmu 0x0040 0x1>;
>  };
> -- 
> 2.17.0
> 
