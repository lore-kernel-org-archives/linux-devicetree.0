From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 01/13] i2c: add dummy inline functions for when
 CONFIG_OF_I2C(_MODULE) isn't defined
Date: Mon, 10 Dec 2012 20:41:27 +0100
Message-ID: <1355168499-5847-2-git-send-email-s.nawrocki@samsung.com>
References: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1355168499-5847-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>

If CONFIG_OF_I2C and CONFIG_OF_I2C_MODULE are undefined no declaration of
of_find_i2c_device_by_node and of_find_i2c_adapter_by_node will be
available. Add dummy inline functions to avoid compilation breakage.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
---
 include/linux/of_i2c.h |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/of_i2c.h b/include/linux/of_i2c.h
index 1cb775f..cfb545c 100644
--- a/include/linux/of_i2c.h
+++ b/include/linux/of_i2c.h
@@ -29,6 +29,18 @@ static inline void of_i2c_register_devices(struct i2c_adapter *adap)
 {
 	return;
 }
+
+static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
+{
+	return NULL;
+}
+
+/* must call put_device() when done with returned i2c_adapter device */
+static inline struct i2c_adapter *of_find_i2c_adapter_by_node(
+						struct device_node *node)
+{
+	return NULL;
+}
 #endif /* CONFIG_OF_I2C */
 
 #endif /* __LINUX_OF_I2C_H */
-- 
1.7.9.5
