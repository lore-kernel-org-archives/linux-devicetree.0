From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] MAINTAINERS: Add Frank Rowand as DT maintainer
Date: Sun, 23 Aug 2015 13:34:08 -0700
Message-ID: <1440362048-13647-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Frank has agreed to step up and help with DT core code maintainership.
At the same time, Grant is taking a step back from active maintainership
responsibilities. Add Frank to the device tree core code entry and
shuffle Grant to the end of the list. In a few releases time Grant will
be removed entirely.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 993d4cfd5aa0..c032364bf5d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7482,8 +7482,9 @@ F:	Documentation/i2c/busses/i2c-ocores
 F:	drivers/i2c/busses/i2c-ocores.c
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
-M:	Grant Likely <grant.likely@linaro.org>
 M:	Rob Herring <robh+dt@kernel.org>
+M:	Frank Rowand <frowand.list@gmail.com>
+M:	Grant Likely <grant.likely@linaro.org>
 L:	devicetree@vger.kernel.org
 W:	http://www.devicetree.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
-- 
2.1.4
