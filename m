From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 3/4] clk: max77686: Add DT binding details for PMIC
 MAX77620
Date: Mon, 20 Jun 2016 11:41:43 -0500
Message-ID: <20160620164143.GB27492@rob-hp-laptop>
References: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com>
 <1466160667-28451-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466160667-28451-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 04:21:06PM +0530, Laxman Dewangan wrote:
> Maxim has used the same clock IP on multiple PMICs like MAX77686,
> MAX77802, MAX77620. Only differences are the number of clocks
> from these PMICs like MAX77686 has 3 clocks output, MAX776802 have
> two clock output and MAX77620 has one clock output.
> 
> Add clock binding details and DT example for the MAX77620.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> Changes from V1:
> - Use proper comment for the ::::
> - Added dt binding preprocessor file as maxim,max77620.h for max77620
>   inline with the other chip.
> - Refer the dt binding header for the supported clock index.
> 
> Changes from V2:
> - Collected RBs.
> ---
>  .../devicetree/bindings/clock/maxim,max77686.txt   | 52 +++++++++++++++++-----
>  include/dt-bindings/clock/maxim,max77620.h         | 21 +++++++++
>  2 files changed, 63 insertions(+), 10 deletions(-)
>  create mode 100644 include/dt-bindings/clock/maxim,max77620.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.txt b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> index 4d973b5..8398a3a 100644
> --- a/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> +++ b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
> @@ -1,14 +1,24 @@
> -Binding for Maxim MAX77686/MAX77802 32k clock generator block
> +Binding for Maxim MAX77686/MAX77802/MAX77620 32k clock generator block
>  
> -This is a part of device tree bindings of MAX77686/MAX77802 multi-function
> -device. More information can be found in bindings/mfd/max77686.txt file for
> -MAX77686 and bindings/mfd/max77802.txt for MAX77802.
> +This is a part of device tree bindings of MAX77686/MAX77802/MAX77620
> +multi-function device. More information can be found in MFD DT binding
> +doc as follows:
> +	bindings/mfd/max77686.txt for MAX77686 and
> +	bindings/mfd/max77802.txt for MAX77802 and
> +	bindings/mfd/max77620.txt for MAX77620.
>  
>  The MAX77686 contains three 32.768khz clock outputs that can be controlled
> -(gated/ungated) over I2C.
> +(gated/ungated) over I2C. Clocks are defined as preprocessor macros in
> +dt-bindings/clock/maxim,max77686.h.
> +
>  
>  The MAX77802 contains two 32.768khz clock outputs that can be controlled
> -(gated/ungated) over I2C.
> +(gated/ungated) over I2C. Clocks are defined as preprocessor macros in
> +dt-bindings/clock/maxim,max77802.h.
> +
> +The MAX77686 contains one 32.768khz clock outputs that can be controlled
> +(gated/ungated) over I2C. Clocks are defined as preprocessor macros in
> +dt-bindings/clock/maxim,max77620.h.
>  
>  Following properties should be presend in main device node of the MFD chip.

Same here. compatible string? Examples are not sufficient to document 
things.

Rob
