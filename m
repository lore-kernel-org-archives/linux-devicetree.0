From: George Cherian <george.cherian@ti.com>
Subject: [PATCH 0/2] Add dt support for extcon gpio driver
Date: Tue, 14 Oct 2014 20:09:03 +0530
Message-ID: <1413297545-26521-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com, cw00.choi@samsung.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Baohua.Song@csr.com, rongjun.ying@csr.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, George Cherian <george.cherian@ti.com>
List-Id: devicetree@vger.kernel.org

This series
        - Adds dt support to extcon-gpio driver.
	- Add cable name support in case of dt.

George Cherian (2):
  extcon: gpio: Add dt support for the driver
  extcon: gpio: Add support for using cable names

 drivers/extcon/extcon-gpio.c       | 87 +++++++++++++-------------------------
 include/linux/extcon/extcon-gpio.h | 59 --------------------------
 2 files changed, 29 insertions(+), 117 deletions(-)
 delete mode 100644 include/linux/extcon/extcon-gpio.h

-- 
1.8.3.1
