From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv2 0/4] Add Altera A10SR Status & Control Monitor
Date: Thu, 27 Oct 2016 15:00:22 -0500
Message-ID: <1477598426-28125-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

This patch series adds the Altera Arria10 DevKit System Resource
chip's Status and Control Monitor to the A10SR Multi-Function
Device. An earlier patch added this to the hwmon class which
wasn't the proper place so this functionality is added to the
misc directory.
Version 2 changes the DT names from -mon to -monitor for better
readability and clarity and changed the previous version from
modular to built-in.

Thor Thayer (4):
  dt-bindings: mfd: Add Altera Arria10 SR Monitor
  misc: Add Altera Arria10 System Resource Control
  mfd: altr-a10sr: Add Arria10 SR Monitor
  ARM: socfpga: dts: Add Monitor to A10-SR MFD

 .../devicetree/bindings/mfd/altera-a10sr.txt       |   9 ++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |   4 +
 drivers/mfd/altera-a10sr.c                         |   4 +
 drivers/misc/Kconfig                               |   7 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/altera-a10sr-monitor.c                | 176 +++++++++++++++++++++
 7 files changed, 202 insertions(+)
 create mode 100644 drivers/misc/altera-a10sr-monitor.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
