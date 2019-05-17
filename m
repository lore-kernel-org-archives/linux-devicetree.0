From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: [RFC/PATCH 1/4] of: Export of_phandle_iterator_args() to modules
Date: Fri, 17 May 2019 11:47:34 -0700
Message-ID: <1558118857-16912-2-git-send-email-isaacm@codeaurora.org>
References: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, robh+dt@kernel.org, frowand.list@gmail.com, bhelgaas@google.com, joro@8bytes.org, robin.murphy@arm.com, will.deacon@arm.com, kernel-team@android.com, pratikp@codeaurora.org, lmark@codeaurora.org
List-Id: devicetree@vger.kernel.org

Kernel modules may want to use of_phandle_iterator_args(),
so export it.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20e0e7e..8b9c597 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1388,6 +1388,7 @@ int of_phandle_iterator_args(struct of_phandle_iterator *it,
 
 	return count;
 }
+EXPORT_SYMBOL_GPL(of_phandle_iterator_args);
 
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
