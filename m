From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [RFC PATCH v2 0/5] Support for Qualcomm QPNP PMIC's
Date: Thu,  3 Jul 2014 16:13:58 +0300
Message-ID: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Lee Jones <lee.jones@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Hello to all,

Here is the second version of the RFC for Qualcomm QPNP PMIC's support.
The difference since first version [1] is that now we use platform
devices for PMIC peripherals instead of new qpnp-bus. The first patch
in the set implements an *of* based parsing of PMIC peripheral
resources and adding mfd cell for it. The devicetree node should
contain a compatible and reg proparties. The intention was to keep
things simple and similar to the other mfd drivers.

The second patch describes the devicetree binding of the slave devices
attached to the SPMI interface. The other few patches are example of
a qpnp-rtc driver and binding documentation.

Comments are welcome.

regards,
Stan

[1] http://www.spinics.net/lists/linux-arm-msm/msg09745.html

Ivan T. Ivanov (1):
  dt: qcom: msm8974: add qpnp-spmi device nodes

Josh Cartwright (1):
  mfd: qpnp: add support for Qualcomm QPNP PMICs

Stanimir Varbanov (3):
  rtc: add qpnp rtc driver
  dt: msm8974: add qpnp rtc device node
  dt: rtc: add binding document for qpnp rtc

 .../devicetree/bindings/rtc/qcom,rtc-qpnp.txt      |   24 +
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   53 +++
 drivers/mfd/Kconfig                                |   15 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/qpnp-spmi.c                            |  129 +++++
 drivers/rtc/Kconfig                                |    8 +
 drivers/rtc/Makefile                               |    1 +
 drivers/rtc/rtc-qpnp.c                             |  489 ++++++++++++++++++++
 8 files changed, 720 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/qcom,rtc-qpnp.txt
 create mode 100644 drivers/mfd/qpnp-spmi.c
 create mode 100644 drivers/rtc/rtc-qpnp.c
