From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V4 2/5] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Wed, 20 Jan 2016 14:22:37 +0900
Message-ID: <569F199D.9020207@samsung.com>
References: <1453198783-28383-1-git-send-email-ldewangan@nvidia.com>
 <1453198783-28383-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <1453198783-28383-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, vreddytalla@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 19.01.2016 19:19, Laxman Dewangan wrote:
> MAX77620/MAX20024 are Power Management IC from the MAXIM.
> It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> watchdog, clock etc.
> 
> Add MFD drier to provides common support for accessing the
> device; additional drivers is developed on respected subsystem
> in order to use the functionality of the device.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> ---
> Changes from V1:
> - Code cleanups per review from V1. 
> - Move register acccess APIs from header to c file.
> - Remove some of non required variable, remove duplication in error message
>  and simplify some of function implementation.
> - Register RTC driver such that it can get the regmap handle form parent device
> 
> Changes from V2:
> - Run coccicheck and checkpatch in strict mode for the alignment.
> - Drop RTC driver and its i2c client registration.
> 
> Changes from V3: 
> - Change all sys initcall to module driver.
> - change the max77620_read argument to unisgned int from u8.
> 
>  drivers/mfd/Kconfig          |  15 +
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77620.c       | 871 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77620.h | 404 ++++++++++++++++++++
>  4 files changed, 1291 insertions(+)
>  create mode 100644 drivers/mfd/max77620.c
>  create mode 100644 include/linux/mfd/max77620.h
> 


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

