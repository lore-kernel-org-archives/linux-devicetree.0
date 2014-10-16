From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: socfpga: fix booting with SD/MMC
Date: Thu, 16 Oct 2014 16:03:31 -0500
Message-ID: <1413493413-8041-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The SOCFPGA dev kit was hanging during bootup on the SD/MMC driver loading.
The first patch fixes the booting and the 2nd patch adds a regulator node
for the SD/MMC driver to use.

Dinh Nguyen (2):
  ARM: dts: socfpga: Fix SD card detect
  ARM: dts: socfpga: Add a 3.3V fixed regulator node

 arch/arm/boot/dts/socfpga_arria5.dtsi         | 11 ++++++++++-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts    |  5 +++++
 arch/arm/boot/dts/socfpga_cyclone5.dtsi       |  9 +++++++++
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts  |  4 +++-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |  5 +++++
 5 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.0.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
