From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v10 1/4] MAINTAINERS: add an entry for for arm64 imx
 devicetrees
Date: Mon, 13 May 2019 10:40:54 -0700
Message-ID: <20190513174057.4410-2-angus@akkea.ca>
References: <20190513174057.4410-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190513174057.4410-1-angus@akkea.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: angus.ainslie@puri.sm
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Angus Ainslie (Purism)" <angus@akkea.ca>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add an explicit reference to imx* devicetrees

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7707c28628b9..0871a21a5bbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1648,6 +1648,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
 F:	arch/arm/boot/dts/ls1021a*
 F:	arch/arm64/boot/dts/freescale/fsl-*
 F:	arch/arm64/boot/dts/freescale/qoriq-*
+F:	arch/arm64/boot/dts/freescale/imx*
 
 ARM/GLOMATION GESBC9312SX MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
-- 
2.17.1
