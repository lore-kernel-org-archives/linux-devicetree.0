From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Adding support to show SoC revision in /proc/cpuinfo
Date: Wed, 17 Feb 2016 18:28:32 +0100
Message-ID: <1455730114-2547-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This serie adds support to retrieve the SoC serial and revision of the current
Meson8 platform. Basically, in the first patch I register a soc_device and retrieve
information from a syscon register, then I populate system_rev and system_serial.
In the second patch I add the device_node to the devicetree.

Romain Perier (2):
  ARM: meson: Adding support to retrieve serial and SoC revision
  ARM: dts: meson: Adding hwrev syscon node

 arch/arm/boot/dts/meson8b.dtsi |  5 ++++
 arch/arm/mach-meson/meson.c    | 55 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
