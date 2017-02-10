From: Velibor Markovski <velibor.markovski@broadcom.com>
Subject: [PATCH INTERNAL 2/2] bus: arm-ccn: Enable stats for CCN-502
 interconnect
Date: Fri, 10 Feb 2017 12:35:09 -0800
Message-ID: <1486758909-23662-3-git-send-email-velibor.markovski@broadcom.com>
References: <1486758909-23662-1-git-send-email-velibor.markovski@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486758909-23662-1-git-send-email-velibor.markovski@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Velibor Markovski <velibor.markovski@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add compatible string for the ARM CCN-502 interconnect

Signed-off-by: Velibor Markovski <velibor.markovski@broadcom.com>
---
 drivers/bus/arm-ccn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
index 4d6a2b7..98a6995 100644
--- a/drivers/bus/arm-ccn.c
+++ b/drivers/bus/arm-ccn.c
@@ -1544,6 +1544,7 @@ static int arm_ccn_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id arm_ccn_match[] = {
+	{ .compatible = "arm,ccn-502", },
 	{ .compatible = "arm,ccn-504", },
 	{},
 };
-- 
1.9.1
