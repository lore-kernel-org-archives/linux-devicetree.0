From: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Subject: [PATCH/RFT v2 14/17] ARM: davinci: register the usb20_phy clock on the DT file
Date: Mon, 24 Oct 2016 18:46:31 +0200
Message-ID: <20161024164634.4330-15-ahaslam@baylibre.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024164634.4330-1-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

The usb20_phy clock needs to be registered for the driver to be able
to get and enable a clock. Currently the usb phy clocks are registered
form board files, which will not be called during a device tree based
boot.

To be able to probe correctly usb form a device tree boot, register
the usb phy clocks form the DT specific init.

Unfourtunatly, davinci does not have proper clock support on device tree
yet, so by registering the clock form de DT specific file we are
forced to hardcode the parent clock, and cannot select refclkin as
parent for any of the phy clocks of the da850 family.

As none of the current da850 based boards currently in mainline use
refclkin as source. I guess we can live with this limitation until clocks
are correctly represented through CCF/device tree.

Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-davinci/da8xx-dt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
index c9f7e92..7947267 100644
--- a/arch/arm/mach-davinci/da8xx-dt.c
+++ b/arch/arm/mach-davinci/da8xx-dt.c
@@ -45,6 +45,8 @@
 
 static void __init da850_init_machine(void)
 {
+	da8xx_register_usb20_phy_clk(false);
+	da8xx_register_usb11_phy_clk(false);
 	of_platform_default_populate(NULL, da850_auxdata_lookup, NULL);
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
