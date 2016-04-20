From: Jeppe Ledet-Pedersen <jlp@gomspace.com>
Subject: [PATCH 0/3] Cypress FM33256B processor companion support
Date: Wed, 20 Apr 2016 13:07:48 +0200
Message-ID: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, gregkh@linuxfoundation.org, alexandre.belloni@free-electrons.com, a.zummo@towertech.it, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series adds support for the Cypress Semiconductor FM33256B processor
companion. The device contains a 256 kbit FRAM, an RTC, a supply voltage
monitor, and a watchdog timer. Only the FRAM and RTC are supported by these
patches.

The device is implemented as an MFD device. The FRAM interface is currently
implemented as an SPI regmap, wrapped by a binary sysfs file. If another
interface would be a better choice, please let me know.

Thanks,

-Jeppe
