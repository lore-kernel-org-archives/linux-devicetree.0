From: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/6] powerpc/corenet: Enable muxing MDIO buses via FPGA
Date: Fri, 18 Apr 2014 07:21:29 -0500
Message-ID: <1397823693-27977-2-git-send-email-Shruti@Freescale.com>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397823693-27977-1-git-send-email-Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andy Fleming <afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/configs/corenet32_smp_defconfig  | 1 +
 arch/powerpc/configs/corenet64_smp_defconfig  | 1 +
 arch/powerpc/platforms/85xx/corenet_generic.c | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/arch/powerpc/configs/corenet32_smp_defconfig b/arch/powerpc/configs/corenet32_smp_defconfig
index 548b21c..132d9f6 100644
--- a/arch/powerpc/configs/corenet32_smp_defconfig
+++ b/arch/powerpc/configs/corenet32_smp_defconfig
@@ -104,6 +104,7 @@ CONFIG_AT803X_PHY=y
 CONFIG_FIXED_PHY=y
 CONFIG_MDIO_BUS_MUX=y
 CONFIG_MDIO_BUS_MUX_GPIO=y
+CONFIG_MDIO_BUS_MUX_MMIOREG=y
 # CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
diff --git a/arch/powerpc/configs/corenet64_smp_defconfig b/arch/powerpc/configs/corenet64_smp_defconfig
index cbe7afb..b355552 100644
--- a/arch/powerpc/configs/corenet64_smp_defconfig
+++ b/arch/powerpc/configs/corenet64_smp_defconfig
@@ -99,6 +99,7 @@ CONFIG_E1000E=y
 CONFIG_MDIO_BUS_MUX=y
 CONFIG_MDIO_BUS_MUX_GPIO=y
 CONFIG_INPUT_FF_MEMLESS=m
+CONFIG_MDIO_BUS_MUX_MMIOREG=y
 # CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index dc9e24e..814faae 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -80,6 +80,9 @@ static const struct of_device_id of_device_ids[] = {
 		.compatible	= "mdio-mux-gpio"
 	},
 	{
+		.compatible	= "fsl,fpga-ngpixis"
+	},
+	{
 		.compatible	= "fsl,srio",
 	},
 	{
-- 
1.8.3.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
