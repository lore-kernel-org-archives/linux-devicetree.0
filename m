From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v4 0/2] Add support for Broadcom keypad controller
Date: Sat, 28 Feb 2015 08:35:55 -0800
Message-ID: <1425141357-7807-1-git-send-email-sbranden@broadcom.com>
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

Changes from v3:
- corrected GPL to GPL v2

Changes from v2:
- changed binding to use autorepeat
- stylistic updates

Changes from v1:
- updated dt documentation to remove to matrix-keymap.txt
- removed bcm_kp_remove as it is not necessary
- removed key-interrupt-trigger-type dt binding
- added bcm_kp_report_keys and call to process key registers

Scott Branden (2):
  Input: bcm-keypad: add device tree bindings
  Input: bcm-keypad: Add Broadcom keypad controller

 .../devicetree/bindings/input/brcm,bcm-keypad.txt  | 108 +++++
 drivers/input/keyboard/Kconfig                     |  10 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/bcm-keypad.c                | 463 +++++++++++++++++++++
 4 files changed, 582 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
 create mode 100644 drivers/input/keyboard/bcm-keypad.c

-- 
2.3.0
