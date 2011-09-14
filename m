From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH] MAINTAINERS: update devicetree maintainers
Date: Wed, 14 Sep 2011 07:47:50 -0500
Message-ID: <1316004470-22643-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

As requested by Grant, adding myself as an additional devicetree maintainer.

Also, add Documentation/devicetree to the file list for devicetree.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
---
 MAINTAINERS |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a8cc60..09754a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4719,10 +4719,12 @@ F:	drivers/i2c/busses/i2c-ocores.c
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Grant Likely <grant.likely@secretlab.ca>
+M:	Rob Herring <rob.herring@calxeda.com>
 L:	devicetree-discuss@lists.ozlabs.org (moderated for non-subscribers)
 W:	http://fdt.secretlab.ca
 T:	git git://git.secretlab.ca/git/linux-2.6.git
 S:	Maintained
+F:	Documentation/devicetree
 F:	drivers/of
 F:	include/linux/of*.h
 K:	of_get_property
-- 
1.7.5.4
