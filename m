From: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH V4 0/6] Introduce framework for SLIMbus device drivers
Date: Sat,  6 Feb 2016 11:44:19 -0700
Message-ID: <1454784265-5194-1-git-send-email-sdharia@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, oded.gabbay-5C7GfCeVMHo@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
management are work-in-progress and will be sent out soon.

These patchsets were tested on Qualcomm Snapdragon processor board
using the controller driver, and a test slave device.

Changes from V3 to V4:
* Addressed inline-code review comments from Mark Brown and Rob Herring.
* Use existing device-model to get list of children of the controller.
* Use 4 cells to represent 4 components of the enumeration address.
* Commit-text and comments to document performance arguments in using
  coherently mapped buffers for transaction buffer management.
* Tried to address clock-pause management suggestion by making sure
  bus-framework votes/unvotes for runtime-PM while handling transfers.

Sagar Dharia (6):
  SLIMbus: Device management on SLIMbus
  of/slimbus: OF helper for SLIMbus
  slimbus: Add messaging APIs to slimbus framework
  slim: qcom: Add Qualcomm Slimbus controller driver
  slimbus: Add support for 'clock-pause' feature
  slim: qcom: Add runtime-pm support using clock-pause feature

 Documentation/devicetree/bindings/slimbus/bus.txt  |  54 ++
 .../devicetree/bindings/slimbus/slim-qcom-ctrl.txt |  43 ++
 Documentation/slimbus/summary                      | 109 +++
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/slimbus/Kconfig                            |  21 +
 drivers/slimbus/Makefile                           |   5 +
 drivers/slimbus/slim-core.c                        | 852 +++++++++++++++++++++
 drivers/slimbus/slim-messaging.c                   | 415 ++++++++++
 drivers/slimbus/slim-qcom-ctrl.c                   | 678 ++++++++++++++++
 drivers/slimbus/slim-qcom.h                        |  64 ++
 drivers/slimbus/slim-sched.c                       | 122 +++
 include/linux/mod_devicetable.h                    |  13 +
 include/linux/slimbus.h                            | 678 ++++++++++++++++
 14 files changed, 3057 insertions(+)
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
