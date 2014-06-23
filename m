From: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] ARM: socfpga: Update socfpga_defconfig and socfpga.dtsi
Date: Sun, 22 Jun 2014 19:31:00 -0500
Message-ID: <1403483462-21082-1-git-send-email-vbridgers2013@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series updates the the socfpga_defconfig with a number of options,
and updates the socfpga device tree with a field required for the reset
controller driver. 

Vince Bridgers (2):
  ARM: socfpga: Update socfpga_defconfig
  ARM: socfpga: Add missing #reset-cells to socfpga device tree

 arch/arm/boot/dts/socfpga.dtsi     |    1 +
 arch/arm/configs/socfpga_defconfig |   35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
