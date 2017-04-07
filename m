From: "Wei.Xu" <xuwei5@hisilicon.com>
Subject: [PATCH 5/5] arm64: dts: hisi: enalbe the NIC and SAS for the
 hip07-d05 board
Date: Fri, 7 Apr 2017 10:07:56 +0800
Message-ID: <1491530876-109791-6-git-send-email-xuwei5@hisilicon.com>
References: <1491530876-109791-1-git-send-email-xuwei5@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1491530876-109791-1-git-send-email-xuwei5@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: wangkefeng.wang@huawei.com, gabriele.paoloni@huawei.com, charles.chenxin@huawei.com, linuxarm@huawei.com, guohanjun@huawei.com, yankejian@huawei.com, yimin@huawei.com, xuwei5@hisilicon.com, huangdaode@hisilicon.com, liudongdong3@huawei.com, yisen.zhuang@huawei.com, devicetree@vger.kernel.org, john.garry@huawei.com, tanxiaofei@huawei.com, lipeng321@huawei.com, linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, majun258@huawei.com
List-Id: devicetree@vger.kernel.org

From: Wei Xu <xuwei5@hisilicon.com>

Enalbe the NIC and SAS nodes for the hip07-d05 board
to support related functions.

Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
---
 arch/arm64/boot/dts/hisilicon/hip07-d05.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
index e058442..5bdca80 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
@@ -64,3 +64,27 @@
 &usb_ehci {
 	status = "ok";
 };
+
+&eth0 {
+	status = "ok";
+};
+
+&eth1 {
+	status = "ok";
+};
+
+&eth2 {
+	status = "ok";
+};
+
+&eth3 {
+	status = "ok";
+};
+
+&p0_pcie2_a {
+	status = "ok";
+};
+
+&sas1 {
+	status = "ok";
+};
-- 
1.9.1
