From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH 0/2] TTY Driver for Newhaven LCD module
Date: Tue, 17 Mar 2015 15:36:45 -0500
Message-ID: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alan Tull <atull@opensource.altera.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Supports a 2 line by 16 character LCD module over I2C.

Alan Tull (2):
  newhaven lcd: device tree bindings documentation
  add newhaven lcd tty driver on i2c

 .../devicetree/bindings/tty/newhaven_lcd.txt       |   21 +
 drivers/tty/Kconfig                                |    5 +
 drivers/tty/Makefile                               |    1 +
 drivers/tty/newhaven_lcd.c                         |  733 ++++++++++++++++++++
 include/linux/platform_data/newhaven_lcd.h         |   25 +
 5 files changed, 785 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/tty/newhaven_lcd.txt
 create mode 100644 drivers/tty/newhaven_lcd.c
 create mode 100644 include/linux/platform_data/newhaven_lcd.h

-- 
1.7.9.5
