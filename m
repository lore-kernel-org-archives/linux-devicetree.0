From: Y Vo <yvo@apm.com>
Subject: [PATCH v1] gpio: add ACPI support for APM X-Gene GPIO standby driver
Date: Fri, 29 May 2015 16:52:40 +0700
Message-ID: <1432893161-3888-1-git-send-email-yvo@apm.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Loc Ho <lho@apm.com>, Tai Nguyen <ttnguyen@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

This patch adds ACPI support for APM X-Gene GPIO standby driver.

V1 change:
	- Remove check CONFIG_ACPI when call acpi_gpiochip_request_interrupts() function.
	- Add acpi_gpiochip_free_interrupts() function to unregister the interrupt.

Y Vo (1):
  gpio: xgene: add ACPI support for APM X-Gene GPIO standby driver

 drivers/gpio/gpio-xgene-sb.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

