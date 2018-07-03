From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v6 0/2] Input: Add Cypress Gen5 Touchscreen driver
Date: Tue,  3 Jul 2018 11:43:07 +0200
Message-ID: <20180703094309.18514-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com, maxime.ripard@free-electrons.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

Here is a V6 series to add the driver of the touchscreen Cypress,
TrueTouch Generation 5.
Based on v4.18-rc3.

This patch series has already been posted in several iterations:
    - v1: Sent on 2017/05/29
    - v2: Sent on 2017/08/18
    - v3: Sent on 2017/09/27
    - v4: Sent on 2017/12/01
    - v5: Sent on 2017/12/20

I did not have any comments the last 4 versions.
And no reviews on my v5 during 6 months. Could I have any updates
or feedback on my series to know why it is not merged (to be able to
correct what is wrong)?

Changes since v5:
   - Rebased on v4.17-rc3
   - Use SPDX header
   - Called "touchscreen_report_pos" function to perform some
   DT properties on position (such as X/Y swapping)
   - Called "__set_bit" for ABS_X, ABS_Y and BTN_TOUCH to be able
   to use "ts_lib" otherwise, it returns an error:
      tslib: Selected device is not a touchscreen (must support
             ABS and KEY event types)
Changes since v4:
   - Fixed kbuild errors about enum hid_cmd_state and .owner
Changes since v3:
   - Rebased on last input's branch
   - Changed the CRC table to use crc_itu_t_table instead of
   crc_ccitt_false_table which is not merged.
   - Added selection of CRC_ITU_T on KConfig
Changes since v2:
   - Removed pinctrl in dt-binding example which is uncessecary.
   - Added Acked-by and Reviewed-by received.
Changes since v1:
   - Updated the driver according to reviews. Most important modifications:
   removed unnecessary mutex, updated dev_err output, handled return cases
   in a better way, created a HID_ENUM, removed magic value, used an
   existing CRC table and used "linux-keycodes" instead of sub-nodes.
   - Updated the dt-bindings to use linux-keycodes and removed properties'
   description that comes from touchscreen's binding.

Patch 01: Add the basis of the driver for Cypress Gen5 Touchscreen.
Patch 02: Add the binding documentation for this driver.

Thank you,

Best regards,
Mylène

Mylène Josserand (2):
  Input: Add driver for Cypress Generation 5 touchscreen
  dt-bindings: input: Add documentation for cyttsp5

 .../bindings/input/touchscreen/cypress,cyttsp5.txt |   39 +
 drivers/input/touchscreen/Kconfig                  |   16 +
 drivers/input/touchscreen/Makefile                 |    1 +
 drivers/input/touchscreen/cyttsp5.c                | 1110 ++++++++++++++++++++
 4 files changed, 1166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.txt
 create mode 100644 drivers/input/touchscreen/cyttsp5.c

-- 
2.11.0
