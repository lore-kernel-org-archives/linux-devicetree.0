From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 2/4] clk: Combine DT binding doc for max77686 and
 max77802
Date: Mon, 20 Jun 2016 11:39:47 -0500
Message-ID: <20160620163947.GA27492@rob-hp-laptop>
References: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com>
 <1466160667-28451-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466160667-28451-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 04:21:05PM +0530, Laxman Dewangan wrote:
> The clock IP used on the Maxim PMICs max77686 and max77802 are
> same. The configuration of clock register is also same except
> the number of clocks.
> 
> Define the common DT binding file for the clocks of Maxim PMICs
> MAX77686 and MAX77802. For this, remove the separate DT binding
> document file for maxim,max77802 and move all information to
> maxim,max77686 DT binding document.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Changes from V1:
> - Rewrite description to remvoe ref to driver.
> - Taken care of comment from Krzysztof on the supported clocks and
>   DT bindings.
> 
> Changes from V2:
> - Collected RBs.
> ---
>  .../devicetree/bindings/clock/maxim,max77686.txt   | 82 ++++++++++++++++------
>  .../devicetree/bindings/clock/maxim,max77802.txt   | 44 ------------
>  2 files changed, 59 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max77802.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.txt b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> index 9c40739..4d973b5 100644
> --- a/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> +++ b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> @@ -1,11 +1,15 @@
> -Binding for Maxim MAX77686 32k clock generator block
> +Binding for Maxim MAX77686/MAX77802 32k clock generator block
>  
> -This is a part of device tree bindings of MAX77686 multi-function device.
> -More information can be found in bindings/mfd/max77686.txt file.
> +This is a part of device tree bindings of MAX77686/MAX77802 multi-function
> +device. More information can be found in bindings/mfd/max77686.txt file for
> +MAX77686 and bindings/mfd/max77802.txt for MAX77802.
>  
>  The MAX77686 contains three 32.768khz clock outputs that can be controlled
>  (gated/ungated) over I2C.
>  
> +The MAX77802 contains two 32.768khz clock outputs that can be controlled
> +(gated/ungated) over I2C.
> +
>  Following properties should be presend in main device node of the MFD chip.
>  
>  Required properties:

I'd expect to see compatible strings updated...

> @@ -17,30 +21,62 @@ Optional properties:
