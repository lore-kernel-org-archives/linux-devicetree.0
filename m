From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v12 1/4] MAINTAINERS: add an entry for for arm64 imx
 devicetrees
Date: Tue, 14 May 2019 06:28:19 -0700
Message-ID: <20190514132822.27023-2-angus@akkea.ca>
References: <20190514132822.27023-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190514132822.27023-1-angus@akkea.ca>
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
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7707c28628b9..9fc30f82ab81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1624,6 +1624,7 @@ R:	NXP Linux Team <linux-imx@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+F:	arch/arm64/boot/dts/freescale/imx*
 N:	imx
 N:	mxs
 X:	drivers/media/i2c/
-- 
2.17.1
