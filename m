From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 5/5] usb: mtu3: clear SOFTCONN when clear USB3_EN if work as
 HS mode
Date: Thu, 29 Nov 2018 10:34:36 +0800
Message-ID: <8b9d260a3aebc4ce4aaf1b87ef3c2e83a7c55355.1543458321.git.chunfeng.yun@mediatek.com>
References: <e178546b79c3d602736a0db2cbfd76f7588e4022.1543458319.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e178546b79c3d602736a0db2cbfd76f7588e4022.1543458319.git.chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

When the controller supports SS mode, but works as HS mode, the
SOFTCONN will not be cleared automatically when clear USB3_EN
by default, this cause an issue that can't disconnect from host,
so clear SOFTCONN when clear USB3_EN when the class driver want
to disable the D+ pullup.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c    | 2 ++
 drivers/usb/mtu3/mtu3_hw_regs.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index b6b20949d63a..4fee200795a5 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -586,6 +586,8 @@ static void mtu3_regs_init(struct mtu3 *mtu)
 		mtu3_clrbits(mbase, U3D_LTSSM_CTRL, SOFT_U3_EXIT_EN);
 		/* automatically build U2 link when U3 detect fail */
 		mtu3_setbits(mbase, U3D_USB2_TEST_MODE, U2U3_AUTO_SWITCH);
+		/* auto clear SOFT_CONN when clear USB3_EN if work as HS */
+		mtu3_setbits(mbase, U3D_U3U2_SWITCH_CTRL, SOFTCON_CLR_AUTO_EN);
 	}
 
 	mtu3_set_speed(mtu);
diff --git a/drivers/usb/mtu3/mtu3_hw_regs.h b/drivers/usb/mtu3/mtu3_hw_regs.h
index d11fcd64c19d..1d65b7476f23 100644
--- a/drivers/usb/mtu3/mtu3_hw_regs.h
+++ b/drivers/usb/mtu3/mtu3_hw_regs.h
@@ -268,6 +268,8 @@
 #define U3D_LTSSM_INTR_ENABLE	(SSUSB_USB3_MAC_CSR_BASE + 0x013C)
 #define U3D_LTSSM_INTR		(SSUSB_USB3_MAC_CSR_BASE + 0x0140)
 
+#define U3D_U3U2_SWITCH_CTRL	(SSUSB_USB3_MAC_CSR_BASE + 0x0170)
+
 /*---------------- SSUSB_USB3_MAC_CSR FIELD DEFINITION ----------------*/
 
 /* U3D_LTSSM_CTRL */
@@ -302,6 +304,9 @@
 #define SS_DISABLE_INTR		BIT(1)
 #define SS_INACTIVE_INTR	BIT(0)
 
+/* U3D_U3U2_SWITCH_CTRL */
+#define SOFTCON_CLR_AUTO_EN	BIT(0)
+
 /*---------------- SSUSB_USB3_SYS_CSR REGISTER DEFINITION ----------------*/
 
 #define U3D_LINK_UX_INACT_TIMER	(SSUSB_USB3_SYS_CSR_BASE + 0x020C)
-- 
2.19.1
