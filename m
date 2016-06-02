From: Rob Herring <robh@kernel.org>
Subject: [PATCH] MAINTAINERS: DeviceTree maintainer updates
Date: Thu,  2 Jun 2016 17:26:04 -0500
Message-ID: <1464906364-8742-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Grant stepped down as kernel DT maintainer and his linaro.org email will
be bouncing soon, so remove him now. Pawel, Ian and Kumar either said
they don't want to remain maintainers or didn't reply, so removing them
as binding maintainers.

Update the DT git tree to mine. Grant's has not been active for a while
now.

I'm actively using patchwork for binding review tracking, so add its
URL.

Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7304d2e..e60872e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8404,10 +8404,9 @@ F:	drivers/i2c/busses/i2c-ocores.c
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Rob Herring <robh+dt@kernel.org>
 M:	Frank Rowand <frowand.list@gmail.com>
-M:	Grant Likely <grant.likely@linaro.org>
 L:	devicetree@vger.kernel.org
 W:	http://www.devicetree.org/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 S:	Maintained
 F:	drivers/of/
 F:	include/linux/of*.h
@@ -8415,12 +8414,10 @@ F:	scripts/dtc/
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh+dt@kernel.org>
-M:	Pawel Moll <pawel.moll@arm.com>
 M:	Mark Rutland <mark.rutland@arm.com>
-M:	Ian Campbell <ijc+devicetree@hellion.org.uk>
-M:	Kumar Gala <galak@codeaurora.org>
 L:	devicetree@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
+Q:	http://patchwork.ozlabs.org/project/devicetree-bindings/list/
 S:	Maintained
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
-- 
2.7.4
