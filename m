From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [RFC PATCH 0/8] firmware: ARM System Control and Management Interface(SCMI) support
Date: Wed,  7 Jun 2017 17:10:04 +0100
Message-ID: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi all,

Let me begin admitting that we are introducing yet another protocol to
achieve same things as many existing protocols like ARM SCPI, TI SCI,
QCOM RPM, Nvidia Tegra BPMP, and so on.

All I can say is that this new ARM System Control and Management
Interface(SCMI) is more flexible and easily extensible than any of the
existing ones. Many vendors were involved in the making of this formal
specification and is now officially published[1].

There is a strong trend in the industry to provide micro-controllers in
systems to abstract various power, or other system management tasks.
These controllers usually have similar interfaces, both in terms of the
functions that are provided by them, and in terms of how requests are
communicated to them.

This specification is to standardise and avoid (any further)
fragmentation in the design of such interface by various vendors.

This patch set is intended to get feedback on the design and structure
of the code. This is not complete and not fully tested due to
non-availability of firmware with full feature set at this time.

It currently doesn't support notification, asynchronous/delayed response,
perf/power statistics region and sensor register region to name a few.
I have borrowed some of the ideas of message allocation/management from
TI SCI.

--
Regards,
Sudeep

[1] http://infocenter.arm.com/help/topic/com.arm.doc.den0056a/index.html

Sudeep Holla (8):
  Documentation: add DT binding for ARM System Control and Management
    Interface(SCMI) protocol
  firmware: arm_scmi: add basic driver infrastructure for SCMI
  firmware: arm_scmi: add common infrastructure and support for base
    protocol
  firmware: arm_scmi: add initial support for performance protocol
  firmware: arm_scmi: add initial support for clock protocol
  firmware: arm_scmi: add initial support for power protocol
  firmware: arm_scmi: add initial support for sensor protocol
  firmware: arm_scmi: probe and initialise all the supported protocols

 Documentation/devicetree/bindings/arm/arm,scmi.txt | 193 +++++
 drivers/firmware/Kconfig                           |  21 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   2 +
 drivers/firmware/arm_scmi/base.c                   | 290 +++++++
 drivers/firmware/arm_scmi/clock.c                  | 340 +++++++++
 drivers/firmware/arm_scmi/common.h                 | 127 ++++
 drivers/firmware/arm_scmi/driver.c                 | 832 +++++++++++++++++++++
 drivers/firmware/arm_scmi/perf.c                   | 398 ++++++++++
 drivers/firmware/arm_scmi/power.c                  | 237 ++++++
 drivers/firmware/arm_scmi/sensors.c                | 269 +++++++
 include/linux/scmi_protocol.h                      | 160 ++++
 12 files changed, 2870 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,scmi.txt
 create mode 100644 drivers/firmware/arm_scmi/Makefile
 create mode 100644 drivers/firmware/arm_scmi/base.c
 create mode 100644 drivers/firmware/arm_scmi/clock.c
 create mode 100644 drivers/firmware/arm_scmi/common.h
 create mode 100644 drivers/firmware/arm_scmi/driver.c
 create mode 100644 drivers/firmware/arm_scmi/perf.c
 create mode 100644 drivers/firmware/arm_scmi/power.c
 create mode 100644 drivers/firmware/arm_scmi/sensors.c
 create mode 100644 include/linux/scmi_protocol.h

--
2.7.4
