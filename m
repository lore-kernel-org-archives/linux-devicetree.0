From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V3 0/6] Introduce framework for SLIMbus device drivers
Date: Mon,  3 Aug 2015 00:59:44 -0600
Message-ID: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes since V2:
* Multiple files to represent corresponding functionality of the
  framework per Srini's suggestion
* Documentation/slimbus/summary to capture documentation
* register_controller now adds slave devices as well for that
  controller (rather than additional step) per Mark's suggestion
* Changed framework to make sure synchronous transactions are waited-
  for in framework itself per Mark's suggestion
* Addressed other inline comments.

Sagar Dharia (6):
  SLIMbus: Device management on SLIMbus
  of/slimbus: OF helper for SLIMbus
  slimbus: Add messaging APIs to slimbus framework
  slim: qcom: Add Qualcomm Slimbus controller driver
  slimbus: Add support for 'clock-pause' feature
  slim: qcom: Add runtime-pm support using clock-pause feature

 Documentation/devicetree/bindings/slimbus/bus.txt  |  46 ++
 .../devicetree/bindings/slimbus/slim-qcom-ctrl.txt |  42 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/slimbus/Kconfig                            |  21 +
 drivers/slimbus/Makefile                           |   5 +
 drivers/slimbus/slim-core.c                        | 855 +++++++++++++++++++++
 drivers/slimbus/slim-messaging.c                   | 378 +++++++++
 drivers/slimbus/slim-qcom-ctrl.c                   | 734 ++++++++++++++++++
 drivers/slimbus/slim-qcom.h                        |  66 ++
 drivers/slimbus/slim-sched.c                       | 121 +++
 include/linux/mod_devicetable.h                    |  13 +
 include/linux/slimbus.h                            | 678 ++++++++++++++++
 13 files changed, 2962 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
 create mode 100644 drivers/slimbus/Kconfig
 create mode 100644 drivers/slimbus/Makefile
 create mode 100644 drivers/slimbus/slim-core.c
 create mode 100644 drivers/slimbus/slim-messaging.c
 create mode 100644 drivers/slimbus/slim-qcom-ctrl.c
 create mode 100644 drivers/slimbus/slim-qcom.h
 create mode 100644 drivers/slimbus/slim-sched.c
 create mode 100644 include/linux/slimbus.h

-- 
1.8.2.1
