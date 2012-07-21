From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] of: i2c: add support for wakeup-source property
Date: Sat, 21 Jul 2012 11:47:25 -0700
Message-ID: <1342896445-5244-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for specifying a generic "wakeup-source" property on i2c
clients, which will set the I2C_CLIENT_WAKE flag, thus configuring the
device to wake the system from suspend (via IRQ).

This obviously doesn't make sense on devices lacking IRQ, but since we
still allow that in the i2c_board_info case, I don't see a reason to
restrict it here.

Note: Since the generic i2c bindings aren't documented in the kernel,
I didn't find a good place to add documentation for this binding
extension. I still think it makes sense to have a generic property
instead of having each device do its own binding for the same.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/of/of_i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
index 1e173f3..3550f3b 100644
--- a/drivers/of/of_i2c.c
+++ b/drivers/of/of_i2c.c
@@ -61,6 +61,9 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 		info.of_node = of_node_get(node);
 		info.archdata = &dev_ad;
 
+		if (of_get_property(node, "wakeup-source", NULL))
+			info.flags |= I2C_CLIENT_WAKE;
+
 		request_module("%s%s", I2C_MODULE_PREFIX, info.type);
 
 		result = i2c_new_device(adap, &info);
-- 
1.7.10.1.488.g05fbf7a
