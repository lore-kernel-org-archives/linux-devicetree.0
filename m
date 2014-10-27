From: gyungoh@gmail.com
Subject: [RESUBMIT PATCH v5 5/8] devicetree: Add vendor prefix for Skyworks Solutions, Inc.
Date: Mon, 27 Oct 2014 16:02:46 +0900
Message-ID: <1414393369-31583-6-git-send-email-jack.yoo@skyworksinc.com>
References: <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
In-Reply-To: <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

From: Gyungoh Yoo <jack.yoo@skyworksinc.com>

Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
---
Changes v5:
Nothing

Changes v4:
Nothing

Changes v3:
Nothing

Changes v2:
Added vendor prefix for Skyworks Solutions, Inc.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 723999d..03e7730 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -137,6 +137,7 @@ sii	Seiko Instruments, Inc.
 silergy	Silergy Corp.
 sirf	SiRF Technology, Inc.
 sitronix	Sitronix Technology Corporation
+skyworks	Skyworks Solutions, Inc.
 smsc	Standard Microsystems Corporation
 snps 	Synopsys, Inc.
 solidrun	SolidRun
-- 
1.9.1
