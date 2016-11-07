From: John Garry <john.garry@huawei.com>
Subject: [PATCH 2/3] arm64: dts: hisi: disable sas0 and sas2 for d03
Date: Tue, 8 Nov 2016 00:44:24 +0800
Message-ID: <1478537065-169286-3-git-send-email-john.garry@huawei.com>
References: <1478537065-169286-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537065-169286-1-git-send-email-john.garry@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, John Garry <john.garry@huawei.com>
List-Id: devicetree@vger.kernel.org

The SAS nodes sas0 and sas2 are not available on d03, so
disable them.

Signed-off-by: John Garry <john.garry@huawei.com>
Acked-by: Xu Wei <xuwei5@hisilicon.com>
---
 arch/arm64/boot/dts/hisilicon/hip06-d03.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
index f54b283..7c4114a 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
@@ -41,18 +41,10 @@
 	status = "ok";
 };
 
-&sas0 {
-	status = "ok";
-};
-
 &sas1 {
 	status = "ok";
 };
 
-&sas2 {
-	status = "ok";
-};
-
 &usb_ohci {
 	status = "ok";
 };
-- 
1.9.1
