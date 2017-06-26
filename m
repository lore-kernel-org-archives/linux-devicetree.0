From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/9] firmware: ARM System Control and Management Interface(SCMI) support
Date: Mon, 26 Jun 2017 16:55:04 +0100
Message-ID: <1498492513-29771-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
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

I had previously posted RFC[2].

Changes RFC->v1:
	- Add generic mailbox binding for shared memory(Rob H)
	- Dropped compatibles per protocol(Suggested by Matt S)
	- Dropped lot of unnecessary pointer casting(Arnd B)
	- Dropped packing of structures(Arnd B)
	- Few other changes/additions based initial testing with firmware
	  providing SCMI interface to OSPM

--
Regards,
Sudeep

[1] http://infocenter.arm.com/help/topic/com.arm.doc.den0056a/index.html

Sudeep Holla (9):
  Documentation: dt-bindings: add support for mailbox client shared
    memory
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

 Documentation/devicetree/bindings/arm/arm,scmi.txt | 175 +++++
 .../devicetree/bindings/mailbox/mailbox.txt        |  28 +
 drivers/firmware/Kconfig                           |  21 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   2 +
 drivers/firmware/arm_scmi/base.c                   | 293 +++++++
 drivers/firmware/arm_scmi/clock.c                  | 339 ++++++++
 drivers/firmware/arm_scmi/common.h                 | 126 +++
 drivers/firmware/arm_scmi/driver.c                 | 869 +++++++++++++++++++++
 drivers/firmware/arm_scmi/perf.c                   | 511 ++++++++++++
 drivers/firmware/arm_scmi/power.c                  | 242 ++++++
 drivers/firmware/arm_scmi/sensors.c                | 286 +++++++
 include/linux/scmi_protocol.h                      | 215 +++++
 13 files changed, 3108 insertions(+)
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
