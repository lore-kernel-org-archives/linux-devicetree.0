From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 4/5] gpio: max77620: add gpio driver for
 MAX77620/MAX20024
Date: Fri, 29 Jan 2016 10:30:35 -0600
Message-ID: <20160129163035.GA15053@rob-hp-laptop>
References: <1453903808-29788-1-git-send-email-ldewangan@nvidia.com>
 <1453903808-29788-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453903808-29788-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, Chaitanya Bandi <bandik@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 07:40:07PM +0530, Laxman Dewangan wrote:
> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
> pins. It also supports interrupts from these pins.
> 
> Add GPIO driver for these pins to control via GPIO APIs.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> ---
> Changes from V1:
> - Use the gpiochip_add_data and get the chip data from core APIs.
> - Cleanups based on comment received on mfd/rtc.
> - Avoid duplication on error message.
> 
> Changes form V2:
> - Run coccicheck and checkpatch in strict mode for the alignment.
> - update based on api changes from core.
> 
> Changes from V3: 
> - Change all sys initcall to module driver.
> - change the max77620_read argument to unisgned int from u8.
> 
> Changes from V4: 
> - Added DT binding document as devicetree/bindings/gpio/gpio-max77620.txt
> 
>  .../devicetree/bindings/gpio/gpio-max77620.txt     |  25 ++
>  drivers/gpio/Kconfig                               |   9 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-max77620.c                       | 292 +++++++++++++++++++++
>  4 files changed, 327 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
>  create mode 100644 drivers/gpio/gpio-max77620.c
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-max77620.txt b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
> new file mode 100644
> index 0000000..410e716
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
> @@ -0,0 +1,25 @@
> +GPIO driver for MAX77620 Power management IC from Maxim Semiconductor.
> +
> +Device has 8 GPIO pins which can be configured as GPIO as well as the
> +special IO functions.
> +
> +Required properties:
> +-------------------
> +- gpio-controller : 	Marks the device node as a gpio controller.
> +- #gpio-cells : 	Should be two.  The first cell is the pin number and
> +			the second cell is used to specify the gpio polarity:
> +				0 = active high
> +				1 = active low
> +For more details, please refer generic GPIO DT binding document
> +<devicetree/bindings/gpio/gpio.txt>.

I would just fold these 2 properties into the main max77620 document.

Rob
