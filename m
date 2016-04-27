From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V5 0/6] Introduce framework for SLIMbus device drivers
Date: Wed, 27 Apr 2016 17:58:03 -0600
Message-ID: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SLIMbus (Serial Low Power Interchip Media Bus) is a specification
developed by MIPI (Mobile Industry Processor Interface) alliance.
SLIMbus is a 2-wire implementation, which is used to communicate with
peripheral components like audio-codec.
SLIMbus uses Time-Division-Multiplexing to accommodate multiple data
channels, and control channel. Control channel has messages to do
device-enumeration, messages to send/receive control-data to/from
slimbus devices, messages for port/channel management, and messages to
do bandwidth allocation.
Framework is introduced to support  multiple instances of the bus
(1 controller per bus), and multiple slave devices per controller.
SPI and I2C frameworks, and comments from last time when I submitted
the patches were referred-to while working on this framework.

These patchsets introduce device-management, OF helpers, and messaging
APIs, controller driver for Qualcomm's slimbus controller, and
clock-pause feature for entering/exiting low-power mode for SLIMbus.
Framework patches to do channel, port and bandwidth
management are work-in-progress and will be sent out once these
initial patches are accepted.

These patchsets were tested on Qualcomm Snapdragon processor board
using the controller driver, and a test slave device.

Changes from V4 to V5:
* Addressed inline-code review comments from Mark Brown and Rob Herring.
* Comments to document usage of workqueue while sending device-up/down
  notifications to slave drivers.
* Introduced module_slimbus_driver macro for ease of registering and
  de-registering slimbus client driver.
* Modified framework and controller remove functionality and tested
  bind/unbind for slimbus controller and slimbus device drivers.
* Modified Device Tree compatible string to follow format from other
  discoverable buses, and clarified documentation about when node
  definition and compatible fields should be used.
* Clock-pause initiated by the framework when controller is being
  removed to make sure there are no ongoing transfers.

Sagar Dharia (6):
  SLIMbus: Device management on SLIMbus
  of/slimbus: OF helper for SLIMbus
  slimbus: Add messaging APIs to slimbus framework
  slim: qcom: Add Qualcomm Slimbus controller driver
  slimbus: Add support for 'clock-pause' feature
  slim: qcom: Add runtime-pm support using clock-pause feature

 Documentation/devicetree/bindings/slimbus/bus.txt  |  55 ++
 .../devicetree/bindings/slimbus/slim-qcom-ctrl.txt |  45 ++
 Documentation/slimbus/summary                      | 109 +++
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/slimbus/Kconfig                            |  20 +
 drivers/slimbus/Makefile                           |   5 +
 drivers/slimbus/slim-core.c                        | 806 +++++++++++++++++++++
 drivers/slimbus/slim-messaging.c                   | 433 +++++++++++
 drivers/slimbus/slim-qcom-ctrl.c                   | 683 +++++++++++++++++
 drivers/slimbus/slim-qcom.h                        |  64 ++
 drivers/slimbus/slim-sched.c                       | 126 ++++
 include/linux/mod_devicetable.h                    |  13 +
 include/linux/slimbus.h                            | 685 +++++++++++++++++
 14 files changed, 3047 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
 create mode 100644 Documentation/slimbus/summary
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
