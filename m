From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Tue, 09 Sep 2014 10:05:33 -0700
Message-ID: <D034802C.A7BEE%dvhart@linux.intel.com>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>
 <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 9/9/14, 11:07, "Weike Chen" <alvin.chen@intel.com> wrote:

>The Synopsys DesignWare APB GPIO driver only supports open firmware
>devices.
>But, like Intel Quark X1000 SOC, which has a single PCI function exporting
>a GPIO and an I2C controller, it is a Multifunction device. This patch is
>to enable the current Synopsys DesignWare APB GPIO driver to support the
>Multifunction device which exports the designware GPIO controller.
>
>Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
>Signed-off-by: Weike Chen <alvin.chen@intel.com>
>---
> drivers/gpio/Kconfig                     |    1 -
> drivers/gpio/gpio-dwapb.c                |  226
>++++++++++++++++++++++--------
> include/linux/platform_data/gpio-dwapb.h |   32 +++++
> 3 files changed, 201 insertions(+), 58 deletions(-)
> create mode 100644 include/linux/platform_data/gpio-dwapb.h
>
>diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>index 9de1515..8250a44 100644
>--- a/drivers/gpio/Kconfig
>+++ b/drivers/gpio/Kconfig
>@@ -136,7 +136,6 @@ config GPIO_DWAPB
> 	tristate "Synopsys DesignWare APB GPIO driver"
> 	select GPIO_GENERIC
> 	select GENERIC_IRQ_CHIP
>-	depends on OF_GPIO

You cover this specific dependencies with inline ifdefs, but you lose the
CONFIG_OF depends by dropping it, and there are no such checks in the
probe routine. Assumptions of OF are not limited to probe in this driver.

While I would like to see this assumption properly abstracted, the most
expedient/immediate fix is probably to add a depends on OF above.

--
Darren
Intel Open Source Technology Center


