From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH 01/13] MAINTAINERS: Adding Maintainers for AMD Seattle Device Tree
Date: Wed, 27 Jan 2016 15:11:49 -0600
Message-ID: <1453929121-12171-2-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Adding maintainers for AMD Seattle device tree.

Signed-off-by: Brijesh Singh <brijeshkumar.singh@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2956eb..8179121 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -669,6 +669,14 @@ F:	drivers/gpu/drm/radeon/radeon_kfd.c
 F:	drivers/gpu/drm/radeon/radeon_kfd.h
 F:	include/uapi/linux/kfd_ioctl.h
 
+AMD SEATTLE DEVICE TREE SUPPORT
+M:	Brijesh Singh <brijeshkumar.singh@amd.com>
+M:	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
+S:	Supported
+M:	Tom Lendacky <thomas.lendacky@amd.com>
+S:	Supported
+F:	arch/arm64/boot/dts/amd/
+
 AMD XGBE DRIVER
 M:	Tom Lendacky <thomas.lendacky@amd.com>
 L:	netdev@vger.kernel.org
-- 
2.5.0
