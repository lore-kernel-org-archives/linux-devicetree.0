From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH 0/2] Add support for Broadcom keypad controller
Date: Mon, 9 Feb 2015 16:07:39 -0800
Message-ID: <1423526861-29579-1-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Scott Branden <sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

This series of patchsets contains the Broadcom keypad controller driver
and device tree binding documentation.

Scott Branden (2):
  Input: bcm-keypad: add device tree bindings
  Input: bcm-keypad: Add Broadcom keypad controller

 .../devicetree/bindings/input/brcm,bcm-keypad.txt  | 118 +++++
 drivers/input/keyboard/Kconfig                     |  10 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/bcm-keypad.c                | 489 +++++++++++++++++++++
 4 files changed, 618 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
 create mode 100644 drivers/input/keyboard/bcm-keypad.c

-- 
2.2.2
