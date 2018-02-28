Return-Path: <SRS0=DCbQ=FW=codeaurora.org=kramasub@kernel.org>
From: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Subject: [PATCH v3 0/4] Introduce GENI SE Controller Driver
Date: Tue, 27 Feb 2018 18:38:05 -0700
Message-Id: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
To: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org
List-ID: <devicetree@vger.kernel.org>

Generic Interface (GENI) firmware based Qualcomm Universal Peripheral (QUP)
Wrapper is a next generation programmable module for supporting a wide
range of serial interfaces like UART, SPI, I2C, I3C, etc. A single QUP
module can provide upto 8 Serial Interfaces using its internal Serial
Engines (SE). The protocol supported by each interface is determined by
the firmware loaded to the Serial Engine.

This patch series introduces GENI SE Driver to manage the GENI based QUP
Wrapper and the common aspects of all SEs inside the QUP Wrapper. This
patch series also introduces the UART and I2C Controller drivers to
drive the SEs that are programmed with the respective protocols.

[v3]
 * Update the driver dependencies
 * Use the SPDX License Expression
 * Squash all the controller device tree bindings together
 * Use kernel doc format for documentation
 * Add additional documentation for packing configuration
 * Use clk_bulk_* API for related clocks
 * Remove driver references to pinctrl and their states
 * Replace magic numbers with appropriate macros
 * Update memory barrier usage and associated comments
 * Reduce interlacing of register reads/writes
 * Fix poll_get_char() operation in console UART driver under polling mode
 * Address other comments from Bjorn Andersson to improve code readability

[v2]
 * Updated device tree bindings to describe the hardware
 * Updated SE DT node as child node of QUP Wrapper DT node
 * Moved common AHB clocks to QUP Wrapper DT node
 * Use the standard "clock-frequency" I2C property
 * Update compatible field in UART Controller to reflect hardware manual
 * Addressed other device tree binding specific comments from Rob Herring

Karthikeyan Ramasubramanian (4):
  dt-bindings: soc: qcom: Add device tree binding for GENI SE
  soc: qcom: Add GENI based QUP Wrapper driver
  i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C
    controller
  tty: serial: msm_geni_serial: Add serial driver support for GENI based
    QUP

 .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |   89 ++
 drivers/i2c/busses/Kconfig                         |   11 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-qcom-geni.c                 |  626 +++++++++++
 drivers/soc/qcom/Kconfig                           |    9 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/qcom-geni-se.c                    |  971 ++++++++++++++++
 drivers/tty/serial/Kconfig                         |   11 +
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/qcom_geni_serial.c              | 1181 ++++++++++++++++++++
 include/linux/qcom-geni-se.h                       |  247 ++++
 11 files changed, 3148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
 create mode 100644 drivers/i2c/busses/i2c-qcom-geni.c
 create mode 100644 drivers/soc/qcom/qcom-geni-se.c
 create mode 100644 drivers/tty/serial/qcom_geni_serial.c
 create mode 100644 include/linux/qcom-geni-se.h

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
