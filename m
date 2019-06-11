From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v7 05/10] usb: roles: Introduce stubs for the exiting
 functions in role.h.
Date: Tue, 11 Jun 2019 16:44:35 +0800
Message-ID: <1560242680-23844-6-git-send-email-chunfeng.yun@mediatek.com>
References: <1560242680-23844-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560242680-23844-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Badhri Jagan Sridharan <badhri@google.com>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Yu Chen <chenyu56@huawei.com>, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Nagarjuna Kristam <nkristam@nvidia.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds stubs for the exiting functions while
CONFIG_USB_ROLE_SWITCH does not enabled.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v7:
  add Signed-off-by Chunfeng

v6:
  merge this patch [1] into this series to add new API

	[1] https://patchwork.kernel.org/patch/10909971/
---
 include/linux/usb/role.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index c05ffa6abda9..da2b9641b877 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -42,6 +42,8 @@ struct usb_role_switch_desc {
 	bool allow_userspace_control;
 };
 
+
+#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
@@ -51,5 +53,33 @@ struct usb_role_switch *
 usb_role_switch_register(struct device *parent,
 			 const struct usb_role_switch_desc *desc);
 void usb_role_switch_unregister(struct usb_role_switch *sw);
+#else
+static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
+		enum usb_role role)
+{
+	return 0;
+}
+
+static inline enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
+{
+	return USB_ROLE_NONE;
+}
+
+static inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
+
+static inline struct usb_role_switch *
+usb_role_switch_register(struct device *parent,
+			 const struct usb_role_switch_desc *desc)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline void usb_role_switch_unregister(struct usb_role_switch *sw) { }
+#endif
 
 #endif /* __LINUX_USB_ROLE_H */
-- 
2.21.0
