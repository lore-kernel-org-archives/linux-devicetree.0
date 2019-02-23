From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 1/5] firmware: ti_sci: (Dis)Allow for device exclusive
 permissions
Date: Sat, 23 Feb 2019 15:02:28 +0530
Message-ID: <20190223093232.29003-2-lokeshvutla@ti.com>
References: <20190223093232.29003-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190223093232.29003-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Sysfw provides an option for requesting exclusive access for a
device using the flags MSG_FLAG_DEVICE_EXCLUSIVE. Once a device
is requested from a host with this flag set, any request to this
device from a different host will be nacked by sysfw. Current tisci
driver enables this flag for every device requests. But this may not
be true for all the devices. So provide a separate command in driver
for exclusive and non-exclusive device requests.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/firmware/ti_sci.c              | 45 ++++++++++++++++++++++++--
 include/linux/soc/ti/ti_sci_protocol.h |  3 ++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 69ed1464175c..8c6f21ceb6f2 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -634,6 +634,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 /**
  * ti_sci_cmd_get_device() - command to request for device managed by TISCI
+ *			     that can be shared with other hosts.
  * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
  * @id:		Device Identifier
  *
@@ -641,11 +642,29 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
  * usage count by balancing get_device with put_device. No refcounting is
  * managed by driver for that purpose.
  *
- * NOTE: The request is for exclusive access for the processor.
- *
  * Return: 0 if all went fine, else return appropriate error.
  */
 static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
+ *				       TISCI that is exclusively owned by the
+ *				       requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
+					   u32 id)
 {
 	return ti_sci_set_device_state(handle, id,
 				       MSG_FLAG_DEVICE_EXCLUSIVE,
@@ -664,6 +683,26 @@ static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
  * Return: 0 if all went fine, else return appropriate error.
  */
 static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
+ *					TISCI that is exclusively owned by
+ *					requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
+					    u32 id)
 {
 	return ti_sci_set_device_state(handle, id,
 				       MSG_FLAG_DEVICE_EXCLUSIVE,
@@ -1631,7 +1670,9 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	core_ops->reboot_device = ti_sci_cmd_core_reboot;
 
 	dops->get_device = ti_sci_cmd_get_device;
+	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
 	dops->idle_device = ti_sci_cmd_idle_device;
+	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
 	dops->put_device = ti_sci_cmd_put_device;
 
 	dops->is_valid = ti_sci_cmd_dev_is_valid;
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index 18435e5c6364..5d704bb33989 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -97,7 +97,10 @@ struct ti_sci_core_ops {
  */
 struct ti_sci_dev_ops {
 	int (*get_device)(const struct ti_sci_handle *handle, u32 id);
+	int (*get_device_exclusive)(const struct ti_sci_handle *handle, u32 id);
 	int (*idle_device)(const struct ti_sci_handle *handle, u32 id);
+	int (*idle_device_exclusive)(const struct ti_sci_handle *handle,
+				     u32 id);
 	int (*put_device)(const struct ti_sci_handle *handle, u32 id);
 	int (*is_valid)(const struct ti_sci_handle *handle, u32 id);
 	int (*get_context_loss_count)(const struct ti_sci_handle *handle,
-- 
2.19.2
