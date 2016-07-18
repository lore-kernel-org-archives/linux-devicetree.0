From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 2/8] uio: code style cleanup
Date: Mon, 18 Jul 2016 14:44:14 +0530
Message-ID: <1468833260-5305-3-git-send-email-anup.patel@broadcom.com>
References: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Ankit Jindal <thatsjindal@gmail.com>, Jan Viktorin <viktorin@rehivetech.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Ankit Jindal <thatsjindal@gmail.com>

This patch fixes the indentation of switch-case block in uio driver.

Signed-off-by: Ankit Jindal <thatsjindal@gmail.com>
Signed-off-by: Anup Patel <anup.patel@broadcom.com>
---
 drivers/uio/uio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index fba021f..f2729b7 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -703,13 +703,13 @@ static int uio_mmap(struct file *filep, struct vm_area_struct *vma)
 	}
 
 	switch (idev->info->mem[mi].memtype) {
-		case UIO_MEM_PHYS:
-			return uio_mmap_physical(vma);
-		case UIO_MEM_LOGICAL:
-		case UIO_MEM_VIRTUAL:
-			return uio_mmap_logical(vma);
-		default:
-			return -EINVAL;
+	case UIO_MEM_PHYS:
+		return uio_mmap_physical(vma);
+	case UIO_MEM_LOGICAL:
+	case UIO_MEM_VIRTUAL:
+		return uio_mmap_logical(vma);
+	default:
+		return -EINVAL;
 	}
 }
 
-- 
1.9.1
