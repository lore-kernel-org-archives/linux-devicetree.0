From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V1] mfd: pv88080: Expand driver for GPIO function support.
Date: Tue, 25 Oct 2016 07:40:40 +0100
Message-ID: <20161025064040.GE8574@dell>
References: <20161025014148.7DF655FA17@krsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161025014148.7DF655FA17@krsrvapps-01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Oct 2016, Eric Jeong wrote:

> 
> From: Eric Jeong <eric.jeong.opensource@diasemi.com>
> 
> This patch adds support for the PV88080 PMIC.
> 
> This pathch is done as part of the existing PV88080 regulator driver
> by expanding the driver for GPIO function support.
> 
> The MFD core driver provides communication through the I2C interface.
> and contains the following components:
> 
>     - Regulators
>     - Configurable GPIOs
> 
> Kconfig and Makefile are updated to reflect support for PV88080 PMIC.
> 
> Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>
> 
> ---
> This patch applies against linux-next and next-20161024
> 
> Hi,
> 
> This change is made as a single patch. Because, to ensure that
> kernel builds and runs properly after this patch.
> 
> The regulator device driver for PV88080 IC is submitted to Linux kernel.
> And now, GPIO function is required. In order to add GPIO driver,
> MFD driver is also required.
> 
> Changes
>  - Add MFD driver.
>  - Add GPIO driver.
>  - Update regulator driver to reflect the support.
>  - Delete pv88080-regulator.h file.
>  - Move binding document to mfd directory.
>  
> Regards,
> Eric Jeong, Dialog Semiconductor Ltd.
> 
> 
>  Documentation/devicetree/bindings/mfd/pv88080.txt  |   63 +++++
>  .../devicetree/bindings/regulator/pv88080.txt      |   62 -----
>  drivers/gpio/Kconfig                               |   11 +
>  drivers/gpio/Makefile                              |    1 +
>  drivers/gpio/gpio-pv88080.c                        |  195 ++++++++++++++
>  drivers/mfd/Kconfig                                |   12 +
>  drivers/mfd/Makefile                               |    2 +
>  drivers/mfd/pv88080-core.c                         |  270 ++++++++++++++++++++
>  drivers/mfd/pv88080-i2c.c                          |   99 +++++++
>  drivers/regulator/Kconfig                          |    5 +-
>  drivers/regulator/pv88080-regulator.c              |  202 ++++++---------
>  drivers/regulator/pv88080-regulator.h              |  118 ---------
>  include/linux/mfd/pv88080.h                        |  236 +++++++++++++++++
>  13 files changed, 970 insertions(+), 306 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/pv88080.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/pv88080.txt
>  create mode 100644 drivers/gpio/gpio-pv88080.c
>  create mode 100644 drivers/mfd/pv88080-core.c
>  create mode 100644 drivers/mfd/pv88080-i2c.c
>  delete mode 100644 drivers/regulator/pv88080-regulator.h
>  create mode 100644 include/linux/mfd/pv88080.h

You're going to need to split this patch up as much as possible.

No one is going to want to review a 1200 line patch.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
