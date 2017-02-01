From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH v2] EDAC: mpc85xx: Add T2080 l2-cache support
Date: Thu,  2 Feb 2017 12:16:24 +1300
Message-ID: <20170201231624.28843-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The l2-cache controller on the T2080 SoC has similar capabilities to the
others already supported by the mpc85xx_edac driver. Add it to the list
of compatible devices.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Acked-by: Johannes Thumshirn <jth-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
This is a resend of a patch that got an ack[1] but didn't seem to get
picked up.

[1] http://marc.info/?l=linux-edac&m=148042072225488&w=2

Changes since v1:
- Collect ack from Johannes.

 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi | 1 +
 drivers/edac/mpc85xx_edac.c                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
index c744569a20e1..a97296c64eb2 100644
--- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
@@ -678,5 +678,6 @@
 		compatible = "fsl,t2080-l2-cache-controller";
 		reg = <0xc20000 0x40000>;
 		next-level-cache = <&cpc>;
+		interrupts = <16 2 1 9>;
 	};
 };
diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 8f66cbed70b7..67f7bc3fe5b3 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -629,6 +629,7 @@ static const struct of_device_id mpc85xx_l2_err_of_match[] = {
 	{ .compatible = "fsl,p1020-l2-cache-controller", },
 	{ .compatible = "fsl,p1021-l2-cache-controller", },
 	{ .compatible = "fsl,p2020-l2-cache-controller", },
+	{ .compatible = "fsl,t2080-l2-cache-controller", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpc85xx_l2_err_of_match);
-- 
2.11.0.24.ge6920cf

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
