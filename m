From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: axp20x: Add AXP806 to supported
 list of chips
Date: Mon, 17 Jul 2017 11:41:35 +0100
Message-ID: <20170717104135.cf3myouaumxzprhg@dell>
References: <20170622040833.15329-1-wens@csie.org>
 <20170622040833.15329-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170622040833.15329-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jun 2017, Chen-Yu Tsai wrote:

> The binding already lists compatibles and regulators for the AXP806,
> but it is missing from the list of supported chips at the beginning.
> 
> Add it.
> 
> Fixes: 204ae2963e10 ("mfd: axp20x: Add bindings for AXP806 PMIC")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 1 +
>  1 file changed, 1 insertion(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
> index aca09af66514..211a100c6b20 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -7,6 +7,7 @@ axp209 (X-Powers)
>  axp221 (X-Powers)
>  axp223 (X-Powers)
>  axp803 (X-Powers)
> +axp806 (X-Powers)
>  axp809 (X-Powers)
>  
>  Required properties:

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
