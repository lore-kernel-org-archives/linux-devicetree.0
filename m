From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: socfpga: updates for SOCFPGA
Date: Thu, 14 Aug 2014 10:51:28 -0500
Message-ID: <1408031491-15609-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, vbridger-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Just a few DTS updates for the SOCFPGA platform.

patch 1/3 : cleanup
patch 2/3 : Add a SD/MMC card detect entry
patch 3/3 : Add a /memserve/ section for the platform

Dinh Nguyen (3):
  ARM: dts: socfpga: remove extra alias in the ArriaV devkit
  ARM: dts: socfpga: Add SD card detect
  ARM: dts: socfpga: memreserve first 4KB for SMP code

 arch/arm/boot/dts/socfpga_arria5.dtsi        | 1 +
 arch/arm/boot/dts/socfpga_arria5_socdk.dts   | 7 -------
 arch/arm/boot/dts/socfpga_cyclone5.dtsi      | 3 ++-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 4 ++++
 4 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.0.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
