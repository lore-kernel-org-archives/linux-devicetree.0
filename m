From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RFC 2/4] iio: trigger: add OF support
Date: Fri, 17 Feb 2017 17:03:47 +0100
Message-ID: <1487347429-31761-3-git-send-email-fabrice.gasnier@st.com>
References: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linus.walleij@linaro.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Provide OF support. Device drivers can get IIO triggers from dt.
Introduce IIO trigger specifiers, so there are:
- IIO trigger providers, e.g. dt nodes designated with
  #io-trigger-cells=<num of cells>
- IIO trigger consumers, e.g. phandles listed in io-triggers = <...>.
  Those can be identified by names by using 'io-trigger-names'.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/industrialio-trigger.c | 100 +++++++++++++++++++++++++++++++++++++
 include/linux/iio/trigger.h        |   4 ++
 2 files changed, 104 insertions(+)

diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 978e1592..d3ac33c 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -768,3 +768,103 @@ int iio_triggered_buffer_predisable(struct iio_dev *indio_dev)
 					     indio_dev->pollfunc);
 }
 EXPORT_SYMBOL(iio_triggered_buffer_predisable);
+
+#ifdef CONFIG_OF
+static int iio_trig_node_match(struct device *dev, void *data)
+{
+	return dev->of_node == data && dev->type == &iio_trig_type;
+}
+
+static struct iio_trigger *__of_iio_trig_get(struct device_node *np, int index)
+{
+	struct of_phandle_args trigspec;
+	struct device *dev;
+	int err;
+
+	err = of_parse_phandle_with_args(np, "io-triggers",
+					 "#io-trigger-cells",
+					 index, &trigspec);
+	if (err)
+		return ERR_PTR(err);
+
+	dev = bus_find_device(&iio_bus_type, NULL, trigspec.np,
+			      iio_trig_node_match);
+	of_node_put(trigspec.np);
+	if (dev == NULL)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return to_iio_trigger(dev);
+}
+
+static struct iio_trigger *__of_iio_trig_get_by_name(struct device_node *np,
+						     const char *name)
+{
+	struct iio_trigger *trig;
+	int index = 0;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+	if (name)
+		index = of_property_match_string(np, "io-trigger-names", name);
+	if (index < 0)
+		return ERR_PTR(index);
+	trig = __of_iio_trig_get(np, index);
+	if (!IS_ERR(trig) || PTR_ERR(trig) == -EPROBE_DEFER)
+		return trig;
+
+	if (name && index >= 0)
+		pr_err("ERROR: could not get IIO trigger %s:%s(%i)\n",
+			np->full_name, name ? name : "", index);
+
+	return ERR_PTR(-ENOENT);
+}
+#else /* CONFIG_OF */
+static inline struct iio_trigger *
+__of_iio_trig_get_by_name(struct device_node *np, const char *name)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
+
+struct iio_trigger *iio_trigger_get_by_name(struct device *dev,
+					    const char *name)
+{
+	struct iio_trigger *trig;
+
+	if (!dev)
+		return ERR_PTR(-EINVAL);
+
+	trig = __of_iio_trig_get_by_name(dev->of_node, name);
+	if (!IS_ERR(trig))
+		return iio_trigger_get(trig);
+
+	return trig;
+}
+EXPORT_SYMBOL_GPL(iio_trigger_get_by_name);
+
+static void devm_iio_trigger_put(struct device *dev, void *res)
+{
+	iio_trigger_put(*(struct iio_trigger **)res);
+}
+
+struct iio_trigger *devm_iio_trigger_get_by_name(struct device *dev,
+						 const char *name)
+{
+	struct iio_trigger **ptr, *trig;
+
+	ptr = devres_alloc(devm_iio_trigger_put, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	trig = iio_trigger_get_by_name(dev, name);
+	if (IS_ERR(trig)) {
+		devres_free(ptr);
+		return trig;
+	}
+
+	*ptr = trig;
+	devres_add(dev, ptr);
+
+	return trig;
+}
+EXPORT_SYMBOL_GPL(devm_iio_trigger_get_by_name)
diff --git a/include/linux/iio/trigger.h b/include/linux/iio/trigger.h
index ea08302..1f1ec20 100644
--- a/include/linux/iio/trigger.h
+++ b/include/linux/iio/trigger.h
@@ -173,6 +173,10 @@ void devm_iio_trigger_unregister(struct device *dev,
 int iio_trigger_validate_own_device(struct iio_trigger *trig,
 				     struct iio_dev *indio_dev);
 
+struct iio_trigger *iio_trigger_get_by_name(struct device *dev,
+					    const char *name);
+struct iio_trigger *devm_iio_trigger_get_by_name(struct device *dev,
+						 const char *name);
 #else
 struct iio_trigger;
 struct iio_trigger_ops;
-- 
1.9.1
