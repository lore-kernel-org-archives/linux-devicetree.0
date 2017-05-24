From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/5] mfd: arizona: Update GPIO binding for newly
 supported specifiers
Date: Wed, 24 May 2017 09:35:19 +0100
Message-ID: <20170524083519.mi7n6nw6ysc5xdeb@dell>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1495550852-3672-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1495550852-3672-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com, frowand.list@gmail.com, ldewangan@nvidia.com
List-Id: devicetree@vger.kernel.org

On Tue, 23 May 2017, Charles Keepax wrote:

> Link to the generic GPIO specifier bindings now that the second cell of
> the binding has some support in the driver.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
> 
> Changes since v1:
>  - Now just points at the standard gpio binding stuff
> 
> Thanks,
> Charles
> 
>  Documentation/devicetree/bindings/mfd/arizona.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I'll take this if/when the GPIO changes are merged.

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
  
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index 8f2e282..b37bdde 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -30,7 +30,8 @@ Required properties:
>  
>    - gpio-controller : Indicates this device is a GPIO controller.
>    - #gpio-cells : Must be 2. The first cell is the pin number and the
> -    second cell is used to specify optional parameters (currently unused).
> +    second cell is used to specify optional parameters, see ../gpio/gpio.txt
> +    for details.
>  
>    - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
>      as covered in Documentation/devicetree/bindings/regulator/regulator.txt

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
