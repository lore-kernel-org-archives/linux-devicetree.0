From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 2/3] dmaengine: dw_dmac: Enhance device tree support
Date: Fri, 12 Oct 2012 11:14:41 +0530
Message-ID: <91e41b4cc972d298f714cbd6f400569a9710304c.1350020375.git.viresh.kumar@linaro.org>
References: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350020375.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <142ef9170a2c69657d8a05ac127a9970d7b04965.1350020375.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: linux-kernel@vger.kernel.org, spear-devel@list.st.com, andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

dw_dmac driver already supports device tree but it used to have its platfor=
m
data passed the non-DT way.

This patch does following changes:
- pass platform data via DT, non-DT way still takes precedence if both are =
used.
- create generic filter routine
- Earlier slave information was made available by slave specific filter rou=
tines
  in chan->private field. Now, this information would be passed from within=
 dmac
  DT node. Slave drivers would now be required to pass bus_id (a string) as
  parameter to this generic filter(), which would be compared against the s=
lave
  data passed from DT, by the generic filter routine.
- Update binding document

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/devicetree/bindings/dma/snps-dma.txt |  44 ++++++
 drivers/dma/dw_dmac.c                              | 147 +++++++++++++++++=
++++
 drivers/dma/dw_dmac_regs.h                         |   4 +
 include/linux/dw_dmac.h                            |  43 +++---
 4 files changed, 221 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documenta=
tion/devicetree/bindings/dma/snps-dma.txt
index c0d85db..5bb3dfb 100644
--- a/Documentation/devicetree/bindings/dma/snps-dma.txt
+++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
@@ -6,6 +6,26 @@ Required properties:
 - interrupt-parent: Should be the phandle for the interrupt controller
   that services interrupts for this device
 - interrupt: Should contain the DMAC interrupt number
+- nr_channels: Number of channels supported by hardware
+- is_private: The device channels should be marked as private and not for =
by the
+  general purpose DMA channel allocator. False if not passed.
+- chan_allocation_order: order of allocation of channel, 0 (default): asce=
nding,
+  1: descending
+- chan_priority: priority of channels. 0 (default): increase from chan 0->=
n, 1:
+  increase from chan n->0
+- block_size: Maximum block size supported by the controller
+- nr_masters: Number of AHB masters supported by the controller
+- data_width: Maximum data width supported by hardware per AHB master
+  (0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
+- slave_info:
+=09- bus_id: name of this device channel, not just a device name since
+=09  devices may have more than one channel e.g. "foo_tx". For using the
+=09  dw_generic_filter(), slave drivers must pass exactly this string as
+=09  param to filter function.
+=09- cfg_hi: Platform-specific initializer for the CFG_HI register
+=09- cfg_lo: Platform-specific initializer for the CFG_LO register
+=09- src_master: src master for transfers on allocated channel.
+=09- dst_master: dest master for transfers on allocated channel.
=20
 Example:
=20
@@ -14,4 +34,28 @@ Example:
 =09=09reg =3D <0xfc000000 0x1000>;
 =09=09interrupt-parent =3D <&vic1>;
 =09=09interrupts =3D <12>;
+
+=09=09nr_channels =3D <8>;
+=09=09chan_allocation_order =3D <1>;
+=09=09chan_priority =3D <1>;
+=09=09block_size =3D <0xfff>;
+=09=09nr_masters =3D <2>;
+=09=09data_width =3D <3 3 0 0>;
+
+=09=09slave_info {
+=09=09=09uart0-tx {
+=09=09=09=09bus_id =3D "uart0-tx";
+=09=09=09=09cfg_hi =3D <0x4000>;=09/* 0x8 << 11 */
+=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09src_master =3D <0>;
+=09=09=09=09dst_master =3D <1>;
+=09=09=09};
+=09=09=09spi0-tx {
+=09=09=09=09bus_id =3D "spi0-tx";
+=09=09=09=09cfg_hi =3D <0x2000>;=09/* 0x4 << 11 */
+=09=09=09=09cfg_lo =3D <0>;
+=09=09=09=09src_master =3D <0>;
+=09=09=09=09dst_master =3D <0>;
+=09=09=09};
+=09=09};
 =09};
diff --git a/drivers/dma/dw_dmac.c b/drivers/dma/dw_dmac.c
index c4b0eb3..9a7d084 100644
--- a/drivers/dma/dw_dmac.c
+++ b/drivers/dma/dw_dmac.c
@@ -1179,6 +1179,58 @@ static void dwc_free_chan_resources(struct dma_chan =
*chan)
 =09dev_vdbg(chan2dev(chan), "%s: done\n", __func__);
 }
=20
+bool dw_generic_filter(struct dma_chan *chan, void *param)
+{
+=09struct dw_dma *dw =3D to_dw_dma(chan->device);
+=09static struct dw_dma *last_dw;
+=09static char *last_bus_id;
+=09int found =3D 0, i =3D -1;
+
+=09/*
+=09 * dmaengine framework calls this routine for all channels of all dma
+=09 * controller, until true is returned. If 'param' bus_id is not
+=09 * registered with a dma controller (dw), then there is no need of
+=09 * running below function for all channels of dw.
+=09 *
+=09 * This block of code does this by saving the parameters of last
+=09 * failure. If dw and param are same, i.e. trying on same dw with
+=09 * different channel, return false.
+=09 */
+=09if (last_dw) {
+=09=09if ((last_bus_id =3D=3D param) && (last_dw =3D=3D dw))
+=09=09=09return false;
+=09}
+
+=09/*
+=09 * Return true:
+=09 * - If dw_dma's platform data is not filled with slave info, then all
+=09 *   dma controllers are fine for transfer.
+=09 * - Or if param is NULL
+=09 */
+=09if (!dw->sd || !param)
+=09=09return true;
+
+=09while (++i < dw->sd_count) {
+=09=09if (!strcmp(dw->sd[i].bus_id, param)) {
+=09=09=09found =3D 1;
+=09=09=09break;
+=09=09}
+=09}
+
+=09if (!found) {
+=09=09last_dw =3D dw;
+=09=09last_bus_id =3D param;
+=09=09return false;
+=09}
+
+=09chan->private =3D &dw->sd[i];
+=09last_dw =3D NULL;
+=09last_bus_id =3D NULL;
+
+=09return true;
+}
+EXPORT_SYMBOL(dw_generic_filter);
+
 /* --------------------- Cyclic DMA API extensions -------------------- */
=20
 /**
@@ -1462,6 +1514,96 @@ static void dw_dma_off(struct dw_dma *dw)
 =09=09dw->chan[i].initialized =3D false;
 }
=20
+#ifdef CONFIG_OF
+static struct dw_dma_platform_data *
+__devinit dw_dma_parse_dt(struct platform_device *pdev)
+{
+=09struct device_node *sn, *cn, *np =3D pdev->dev.of_node;
+=09struct dw_dma_platform_data *pdata;
+=09struct dw_dma_slave *sd;
+=09u32 count, val, arr[4];
+
+=09if (!np) {
+=09=09dev_err(&pdev->dev, "Missing DT data\n");
+=09=09return NULL;
+=09}
+
+=09pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+=09if (!pdata)
+=09=09return NULL;
+
+=09if (of_property_read_u32(np, "nr_channels", &pdata->nr_channels))
+=09=09return NULL;
+
+=09if (of_property_read_bool(np, "is_private"))
+=09=09pdata->is_private =3D true;
+
+=09if (!of_property_read_u32(np, "chan_allocation_order",
+=09=09=09=09&val))
+=09=09pdata->chan_allocation_order =3D (unsigned char)val;
+
+=09if (!of_property_read_u32(np, "chan_priority", &val))
+=09=09pdata->chan_priority =3D (unsigned char)val;
+
+=09if (!of_property_read_u32(np, "block_size", &val))
+=09=09pdata->block_size =3D (unsigned short)val;
+
+=09if (!of_property_read_u32(np, "nr_masters", &val)) {
+=09=09if (val > 4)
+=09=09=09return NULL;
+
+=09=09pdata->nr_masters =3D (unsigned char)val;
+=09}
+
+=09if (!of_property_read_u32_array(np, "data_width", arr,
+=09=09=09=09pdata->nr_masters))
+=09=09for (count =3D 0; count < pdata->nr_masters; count++)
+=09=09=09pdata->data_width[count] =3D arr[count];
+
+=09/* parse slave data */
+=09sn =3D of_find_node_by_name(np, "slave_info");
+=09if (!sn)
+=09=09return pdata;
+
+=09count =3D 0;
+=09/* calculate number of slaves */
+=09for_each_child_of_node(sn, cn)
+=09=09count++;
+
+=09if (!count)
+=09=09return NULL;
+
+=09sd =3D devm_kzalloc(&pdev->dev, sizeof(*sd) * count, GFP_KERNEL);
+=09if (!sd)
+=09=09return NULL;
+
+=09count =3D 0;
+=09for_each_child_of_node(sn, cn) {
+=09=09of_property_read_string(cn, "bus_id", &sd[count].bus_id);
+=09=09of_property_read_u32(cn, "cfg_hi", &sd[count].cfg_hi);
+=09=09of_property_read_u32(cn, "cfg_lo", &sd[count].cfg_lo);
+=09=09if (!of_property_read_u32(cn, "src_master", &val))
+=09=09=09sd[count].src_master =3D (u8)val;
+
+=09=09if (!of_property_read_u32(cn, "dst_master", &val))
+=09=09=09sd[count].dst_master =3D (u8)val;
+
+=09=09sd[count].dma_dev =3D &pdev->dev;
+=09=09count++;
+=09}
+
+=09pdata->sd =3D sd;
+=09pdata->sd_count =3D count;
+
+=09return pdata;
+}
+#else
+static inline int dw_dma_parse_dt(struct platform_device *pdev)
+{
+=09return -ENOSYS;
+}
+#endif
+
 static int __devinit dw_probe(struct platform_device *pdev)
 {
 =09struct dw_dma_platform_data *pdata;
@@ -1478,6 +1620,9 @@ static int __devinit dw_probe(struct platform_device =
*pdev)
 =09int=09=09=09i;
=20
 =09pdata =3D dev_get_platdata(&pdev->dev);
+=09if (!pdata)
+=09=09pdata =3D dw_dma_parse_dt(pdev);
+
 =09if (!pdata || pdata->nr_channels > DW_DMA_MAX_NR_CHANNELS)
 =09=09return -EINVAL;
=20
@@ -1512,6 +1657,8 @@ static int __devinit dw_probe(struct platform_device =
*pdev)
 =09clk_prepare_enable(dw->clk);
=20
 =09dw->regs =3D regs;
+=09dw->sd =3D pdata->sd;
+=09dw->sd_count =3D pdata->sd_count;
=20
 =09/* get hardware configuration parameters */
 =09if (autocfg) {
diff --git a/drivers/dma/dw_dmac_regs.h b/drivers/dma/dw_dmac_regs.h
index ff39fa6..5cc61ba 100644
--- a/drivers/dma/dw_dmac_regs.h
+++ b/drivers/dma/dw_dmac_regs.h
@@ -231,6 +231,10 @@ struct dw_dma {
 =09struct tasklet_struct=09tasklet;
 =09struct clk=09=09*clk;
=20
+=09/* slave information */
+=09struct dw_dma_slave=09*sd;
+=09unsigned int=09=09sd_count;
+
 =09u8=09=09=09all_chan_mask;
=20
 =09/* hardware configuration */
diff --git a/include/linux/dw_dmac.h b/include/linux/dw_dmac.h
index 62a6190..4d1c8c3 100644
--- a/include/linux/dw_dmac.h
+++ b/include/linux/dw_dmac.h
@@ -15,6 +15,26 @@
 #include <linux/dmaengine.h>
=20
 /**
+ * struct dw_dma_slave - Controller-specific information about a slave
+ *
+ * @dma_dev: required DMA master device. Depricated.
+ * @bus_id: name of this device channel, not just a device name since
+ *          devices may have more than one channel e.g. "foo_tx"
+ * @cfg_hi: Platform-specific initializer for the CFG_HI register
+ * @cfg_lo: Platform-specific initializer for the CFG_LO register
+ * @src_master: src master for transfers on allocated channel.
+ * @dst_master: dest master for transfers on allocated channel.
+ */
+struct dw_dma_slave {
+=09struct device=09=09*dma_dev;
+=09const char=09=09*bus_id;
+=09u32=09=09=09cfg_hi;
+=09u32=09=09=09cfg_lo;
+=09u8=09=09=09src_master;
+=09u8=09=09=09dst_master;
+};
+
+/**
  * struct dw_dma_platform_data - Controller configuration parameters
  * @nr_channels: Number of channels supported by hardware (max 8)
  * @is_private: The device channels should be marked as private and not fo=
r
@@ -25,6 +45,8 @@
  * @nr_masters: Number of AHB masters supported by the controller
  * @data_width: Maximum data width supported by hardware per AHB master
  *=09=09(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)
+ * @sd: slave specific data. Used for configuring channels
+ * @sd_count: count of slave data structures passed.
  */
 struct dw_dma_platform_data {
 =09unsigned int=09nr_channels;
@@ -38,6 +60,9 @@ struct dw_dma_platform_data {
 =09unsigned short=09block_size;
 =09unsigned char=09nr_masters;
 =09unsigned char=09data_width[4];
+
+=09struct dw_dma_slave *sd;
+=09unsigned int sd_count;
 };
=20
 /* bursts size */
@@ -52,23 +77,6 @@ enum dw_dma_msize {
 =09DW_DMA_MSIZE_256,
 };
=20
-/**
- * struct dw_dma_slave - Controller-specific information about a slave
- *
- * @dma_dev: required DMA master device
- * @cfg_hi: Platform-specific initializer for the CFG_HI register
- * @cfg_lo: Platform-specific initializer for the CFG_LO register
- * @src_master: src master for transfers on allocated channel.
- * @dst_master: dest master for transfers on allocated channel.
- */
-struct dw_dma_slave {
-=09struct device=09=09*dma_dev;
-=09u32=09=09=09cfg_hi;
-=09u32=09=09=09cfg_lo;
-=09u8=09=09=09src_master;
-=09u8=09=09=09dst_master;
-};
-
 /* Platform-configurable bits in CFG_HI */
 #define DWC_CFGH_FCMODE=09=09(1 << 0)
 #define DWC_CFGH_FIFO_MODE=09(1 << 1)
@@ -106,5 +114,6 @@ void dw_dma_cyclic_stop(struct dma_chan *chan);
 dma_addr_t dw_dma_get_src_addr(struct dma_chan *chan);
=20
 dma_addr_t dw_dma_get_dst_addr(struct dma_chan *chan);
+bool dw_generic_filter(struct dma_chan *chan, void *param);
=20
 #endif /* DW_DMAC_H */
--=20
1.7.12.rc2.18.g61b472e
