From: Akshay Bhat <akshay.bhat@timesys.com>
Subject: [PATCH 1/6] of: Add vendor prefix for Advantech Corporation
Date: Thu, 29 Oct 2015 19:16:42 -0400
Message-ID: <1446160607-16053-2-git-send-email-akshay.bhat@timesys.com>
References: <1446160607-16053-1-git-send-email-akshay.bhat@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1446160607-16053-1-git-send-email-akshay.bhat@timesys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, justin.waters@timesys.com, linux@arm.linux.org.uk, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, peter.stretz@advantech.com, kernel@pengutronix.de, galak@codeaurora.org, Akshay Bhat <akshay.bhat@timesys.com>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, martin.donnelly@ge.com
List-Id: devicetree@vger.kernel.org

This patch adds vendor prefix for Advantech Corporation.

Website: http://www.advantech.com/
Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8fb0590..816383b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -10,6 +10,7 @@ ad	Avionic Design GmbH
 adapteva	Adapteva, Inc.
 adh	AD Holdings Plc.
 adi	Analog Devices, Inc.
+adv	Advantech Corporation
 aeroflexgaisler	Aeroflex Gaisler AB
 al	Annapurna Labs
 allwinner	Allwinner Technology Co., Ltd.
-- 
2.6.2
