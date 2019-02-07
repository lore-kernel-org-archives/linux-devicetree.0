From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add HI3670 reset controller
 binding
Date: Thu, 07 Feb 2019 11:41:34 +0100
Message-ID: <1549536094.4557.8.camel@pengutronix.de>
References: <20190201153841.21903-1-manivannan.sadhasivam@linaro.org>
 <20190201153841.21903-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201153841.21903-2-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, guodong.xu@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On Fri, 2019-02-01 at 21:08 +0530, Manivannan Sadhasivam wrote:
> HI3670 SoC is architecturally same as the HI3660 SoC. Hence, the same
> driver is reused for HI3670 SoC and the binding is documented here.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/reset/hisilicon,hi3660-reset.txt     | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> index 2bf3344b2a02..5d60ec541331 100644
> --- a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> @@ -5,11 +5,12 @@ Please also refer to reset.txt in this directory for common reset
>  controller binding usage.
>  
>  The reset controller registers are part of the system-ctl block on
> -hi3660 SoC.
> +hi3660 and hi3670 SoCs.
>  
>  Required properties:
> -- compatible: should be
> +- compatible: should be one of the following:
>  		 "hisilicon,hi3660-reset"
> +		 "hisilicon,hi3670-reset"

If the HI3670 reset controller is compatible to the HI3660 reset
controller, this could be:

- compatible: should be one of the following:
              "hisilicon,hi3660-reset" for HI3660
              "hisilicon,hi3670-reset", "hisilicon,hi3660-reset" for HI3670

That way there would be no need to change the driver and it would be
documented that the two reset controllers are compatible.

regards
Philipp
