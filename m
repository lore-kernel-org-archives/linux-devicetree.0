From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: Update DT website and git repository
Date: Fri, 26 Dec 2014 14:43:56 -0600
Message-ID: <1419626636-7130-2-git-send-email-robherring2@gmail.com>
References: <1419626636-7130-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419626636-7130-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

Per Grant, secretlab.ca is defunct and he has no plans to resurect it,
so update the DT website and git tree. devicetree.org needs work, but
is better than "Internal Server Error" that secretlab.ca returns.

Cc: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa9ae27..7c6c4df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6977,8 +6977,8 @@ OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Grant Likely <grant.likely@linaro.org>
 M:	Rob Herring <robh+dt@kernel.org>
 L:	devicetree@vger.kernel.org
-W:	http://fdt.secretlab.ca
-T:	git git://git.secretlab.ca/git/linux-2.6.git
+W:	http://www.devicetree.org/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
 S:	Maintained
 F:	drivers/of/
 F:	include/linux/of*.h
-- 
2.1.0
