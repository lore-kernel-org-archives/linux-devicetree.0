From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v2 1/4] nfc: pn533: add UART phy driver
Date: Thu, 18 Oct 2018 17:00:28 +0200
Message-ID: <6CB47B97-F58D-4162-98C1-8C8C88CE2914@holtmann.org>
References: <20181018144251.30028-1-poeschel@lemonage.de>
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018144251.30028-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Lars,

> This adds the UART phy interface for the pn533 driver.
> The pn533 driver can be used through UART interface this way.
> It is implemented as a serdev device.
> 
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
> Changes in v2:
> - switched from tty line discipline to serdev, resulting in many
>  simplifications
> - SPDX License Identifier
> 
> drivers/nfc/pn533/Kconfig  |  10 ++
> drivers/nfc/pn533/Makefile |   2 +
> drivers/nfc/pn533/pn533.h  |   8 ++
> drivers/nfc/pn533/uart.c   | 283 +++++++++++++++++++++++++++++++++++++
> 4 files changed, 303 insertions(+)
> create mode 100644 drivers/nfc/pn533/uart.c
> 
> diff --git a/drivers/nfc/pn533/Kconfig b/drivers/nfc/pn533/Kconfig
> index d94122dd30e4..da3ea2dbaa8a 100644
> --- a/drivers/nfc/pn533/Kconfig
> +++ b/drivers/nfc/pn533/Kconfig
> @@ -25,3 +25,13 @@ config NFC_PN533_I2C
> 
> 	  If you choose to build a module, it'll be called pn533_i2c.
> 	  Say N if unsure.
> +
> +config NFC_PN532_UART
> +	tristate "NFC PN532 device support (UART)”

you are missing the "depends on SERIAL_DEV_BUS” here.

> +	select NFC_PN533
> +	---help---
> +	  This module adds support for the NXP pn532 UART interface.
> +	  Select this if your platform is using the UART bus.
> +
> +	  If you choose to build a module, it'll be called pn532_uart.
> +	  Say N if unsure.

Regards

Marcel
