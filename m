From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?=
        <benoit.thebaudeau.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: imx25-pinfunc: Always set SION for SD CMD
Date: Sat, 27 Jan 2018 01:07:52 +0100
Message-ID: <20180127000752.2879-1-benoit.thebaudeau.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The eSDHC does not work properly if the SION bit is not set for the
bidirectional CMD signal, whatever the eSDHC instance and the selected
pad. Therefore, setting SION is mandatory for all eSDHC CMD ports. Do
this for MX25_PAD_*__SD*_CMD in imx25-pinfunc.h in order to enforce this
behavior for all boards.

This had already been done for eSDHC1, but not for eSDHC2. Also, define
MX25_PAD_FEC_MDC__SDHC2_CMD so that all the possible cases are covered
from now on.

Signed-off-by: Benoît Thébaudeau <benoit.thebaudeau.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/imx25-pinfunc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx25-pinfunc.h b/arch/arm/boot/dts/imx25-pinfunc.h
index 6c63dca1b9b8..6cc71f7e1baa 100644
--- a/arch/arm/boot/dts/imx25-pinfunc.h
+++ b/arch/arm/boot/dts/imx25-pinfunc.h
@@ -236,7 +236,8 @@
 #define MX25_PAD_LD8__LD8			0x0e8 0x2e0 0x000 0x00 0x000
 #define MX25_PAD_LD8__UART4_RXD			0x0e8 0x2e0 0x570 0x02 0x000
 #define MX25_PAD_LD8__FEC_TX_ERR		0x0e8 0x2e0 0x000 0x05 0x000
-#define MX25_PAD_LD8__SDHC2_CMD			0x0e8 0x2e0 0x4e0 0x06 0x000
+/* The eSDHC cannot work if SION is not set for the bidirectional CMD signal. */
+#define MX25_PAD_LD8__SDHC2_CMD			0x0e8 0x2e0 0x4e0 0x16 0x000
 
 #define MX25_PAD_LD9__LD9			0x0ec 0x2e4 0x000 0x00 0x000
 #define MX25_PAD_LD9__UART4_TXD			0x0ec 0x2e4 0x000 0x02 0x000
@@ -316,7 +317,8 @@
 #define MX25_PAD_CSI_D5__CSPI3_RDY		0x12c 0x324 0x000 0x07 0x000
 
 #define MX25_PAD_CSI_D6__CSI_D6			0x130 0x328 0x000 0x00 0x000
-#define MX25_PAD_CSI_D6__SDHC2_CMD		0x130 0x328 0x4e0 0x02 0x001
+/* The eSDHC cannot work if SION is not set for the bidirectional CMD signal. */
+#define MX25_PAD_CSI_D6__SDHC2_CMD		0x130 0x328 0x4e0 0x12 0x001
 #define MX25_PAD_CSI_D6__SIM1_PD0		0x130 0x328 0x000 0x04 0x000
 #define MX25_PAD_CSI_D6__GPIO_1_31		0x130 0x328 0x000 0x05 0x000
 
@@ -496,6 +498,8 @@
 #define MX25_PAD_KPP_COL3__GPIO_3_4		0x1c4 0x3bc 0x000 0x05 0x000
 
 #define MX25_PAD_FEC_MDC__FEC_MDC		0x1c8 0x3c0 0x000 0x00 0x000
+/* The eSDHC cannot work if SION is not set for the bidirectional CMD signal. */
+#define MX25_PAD_FEC_MDC__SDHC2_CMD		0x1c8 0x3c0 0x4e0 0x11 0x002
 #define MX25_PAD_FEC_MDC__AUD4_TXD		0x1c8 0x3c0 0x464 0x02 0x001
 #define MX25_PAD_FEC_MDC__GPIO_3_5		0x1c8 0x3c0 0x000 0x05 0x000
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
