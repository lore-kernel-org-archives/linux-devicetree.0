From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 0/2] arm64: dts: juno: add coresight support
Date: Wed,  6 Jul 2016 11:15:35 +0100
Message-ID: <1467800137-17533-1-git-send-email-sudeep.holla@arm.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465228765-14038-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for coresight debug subsystem based on similar
support on Vexpress TC2 platform by Mathieu Poirier. It also contains
a workaround required to prevent bus stall quite early in the boot.
It uses power domain provided by SCPI, so it depends on scpi patches[1].

Regards,
Sudeep

v1[0]->v2:
	- Dropped arm,primecell-periphid override addition
	- Sorted the nodes based on reg fields and replaced underscores
	  with dashes as suggested by Olof
	- Retained coresight acronyms aas Matheiu added definations to
	  the binding[1]

[0] http://www.spinics.net/lists/arm-kernel/msg508733.html
[1] https://patchwork.kernel.org/patch/9193133/

Sudeep Holla (2):
  arm64: dts: juno: add coresight support
  arm64: dts: juno: add SCPI power domains for device power management

 arch/arm64/boot/dts/arm/juno-base.dtsi | 315 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-r1.dts    |  24 +++
 arch/arm64/boot/dts/arm/juno-r2.dts    |  24 +++
 arch/arm64/boot/dts/arm/juno.dts       |  24 +++
 4 files changed, 387 insertions(+)

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
