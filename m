From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Add HI3670 MMC controller binding
Date: Wed, 27 Mar 2019 14:31:10 -0500
Message-ID: <20190327193110.GA11175@bogus>
References: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
 <20190228154511.17566-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190228154511.17566-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: xuwei5@hisilicon.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, amit.kucheria@linaro.org, guodong.xu@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Feb 2019 21:15:09 +0530, Manivannan Sadhasivam wrote:
> HI3670 SoC is architecturally same as the HI3660 SoC. Hence, the same
> K3 specific designware driver is reused for HI3670 SoC and the binding
> is documented with fallback approach for compatible property.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
