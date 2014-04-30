From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Subject: Re: [PATCH v4 02/03] ARM: sunxi: Add driver for sunxi
 IR controller
Date: Wed, 30 Apr 2014 03:58:18 -0700 (PDT)
Message-ID: <3881d16f-578a-417b-8a55-ea9bad5af206@googlegroups.com>
References: <d641a69a-01b4-443d-b121-48d13f46ee03@googlegroups.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_138_1381814.1398855498683"
Return-path: <linux-sunxi+bncBCLIFP6QZ4HRBS5OQONQKGQEYVPB7PY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <d641a69a-01b4-443d-b121-48d13f46ee03-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_138_1381814.1398855498683
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[PATCH v4 02/03] ARM: sunxi: Add driver for sunxi IR controller

This patch adds driver for sunxi IR controller.
It is based on Alexsey Shestacov's work based on the original driver=20
supplied by Allwinner.

Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index 8fbd377..9427fad 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -343,4 +343,14 @@ config RC_ST
=20
  If you're not sure, select N here.
=20
+config IR_SUNXI
+    tristate "SUNXI IR remote control"
+    depends on RC_CORE
+    depends on ARCH_SUNXI
+    ---help---
+      Say Y if you want to use sunXi internal IR Controller
+
+      To compile this driver as a module, choose M here: the module will
+      be called sunxi-ir.
+
 endif #RC_DEVICES
diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index f8b54ff..93cdbe9 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -32,4 +32,5 @@ obj-$(CONFIG_IR_GPIO_CIR) +=3D gpio-ir-recv.o
 obj-$(CONFIG_IR_IGUANA) +=3D iguanair.o
 obj-$(CONFIG_IR_TTUSBIR) +=3D ttusbir.o
 obj-$(CONFIG_RC_ST) +=3D st_rc.o
+obj-$(CONFIG_IR_SUNXI) +=3D sunxi-ir.o
 obj-$(CONFIG_IR_IMG) +=3D img-ir/
diff --git a/drivers/media/rc/sunxi-ir.c b/drivers/media/rc/sunxi-ir.c
new file mode 100644
index 0000000..f051d94
--- /dev/null
+++ b/drivers/media/rc/sunxi-ir.c
@@ -0,0 +1,303 @@
+/*
+ * Driver for Allwinner sunXi IR controller
+ *
+ * Copyright (C) 2014 Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
+ * Copyright (C) 2014 Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
+ *
+ * Based on sun5i-ir.c:
+ * Copyright (C) 2007-2012 Daniel Wang
+ * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <media/rc-core.h>
+
+#define SUNXI_IR_DEV "sunxi-ir"
+
+/* Registers */
+/* IR Control */
+#define SUNXI_IR_CTL_REG      0x00
+/* Rx Config */
+#define SUNXI_IR_RXCTL_REG    0x10
+/* Rx Data */
+#define SUNXI_IR_RXFIFO_REG   0x20
+/* Rx Interrupt Enable */
+#define SUNXI_IR_RXINT_REG    0x2C
+/* Rx Interrupt Status */
+#define SUNXI_IR_RXSTA_REG    0x30
+/* IR Sample Config */
+#define SUNXI_IR_CIR_REG      0x34
+
+/* Bit Definition of IR_RXINTS_REG Register */
+#define SUNXI_IR_RXINTS_RXOF  BIT(0) /* Rx FIFO Overflow */
+#define SUNXI_IR_RXINTS_RXPE  BIT(1) /* Rx Packet End */
+#define SUNXI_IR_RXINTS_RXDA  BIT(4) /* Rx FIFO Data Available */
+/* Hardware supported fifo size */
+#define SUNXI_IR_FIFO_SIZE    16
+/* How much messages in fifo triggers IRQ */
+#define SUNXI_IR_FIFO_TRIG    8
+/* Required frequency for IR0 or IR1 clock in CIR mode */
+#define SUNXI_IR_BASE_CLK     8000000
+/* Frequency after IR internal divider  */
+#define SUNXI_IR_CLK          (SUNXI_IR_BASE_CLK / 64)
+/* Sample period in ns */
+#define SUNXI_IR_SAMPLE       (1000000000ul / SUNXI_IR_CLK)
+/* Filter threshold in samples  */
+#define SUNXI_IR_RXFILT       1
+/* Idle Threshold in samples */
+#define SUNXI_IR_RXIDLE       20
+/* Time after which device stops sending data in ms */
+#define SUNXI_IR_TIMEOUT      120
+
+struct sunxi_ir {
+ spinlock_t      ir_lock;
+ struct rc_dev   *rc;
+ void __iomem    *base;
+ int             irq;
+ struct clk      *clk;
+ struct clk      *apb_clk;
+ const char      *map_name;
+};
+
+static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
+{
+ unsigned long status;
+ unsigned char dt;
+ unsigned int cnt, rc;
+ struct sunxi_ir *ir =3D dev_id;
+ DEFINE_IR_RAW_EVENT(rawir);
+
+ spin_lock_irq(&ir->ir_lock);
+
+ status =3D readl(ir->base + SUNXI_IR_RXSTA_REG);
+
+ /* clean all pending statuses */
+ writel(status | 0xff, ir->base + SUNXI_IR_RXSTA_REG);
+
+ if (status & SUNXI_IR_RXINTS_RXDA) {
+ /* How much messages in fifo */
+ rc  =3D (status >> 8) & 0x3f;
+ /* Sanity check */
+ rc =3D rc > SUNXI_IR_FIFO_SIZE ? SUNXI_IR_FIFO_SIZE : rc;
+ /* if we have data */
+ for (cnt =3D 0; cnt < rc; cnt++) {
+ /* for each bit in fifo */
+ dt =3D readb(ir->base + SUNXI_IR_RXFIFO_REG);
+ rawir.pulse =3D (dt & 0x80) !=3D 0;
+ rawir.duration =3D (dt & 0x7f) * SUNXI_IR_SAMPLE;
+ ir_raw_event_store_with_filter(ir->rc, &rawir);
+ }
+ }
+
+ if (status & SUNXI_IR_RXINTS_RXOF)
+ ir_raw_event_reset(ir->rc);
+ else if (status & SUNXI_IR_RXINTS_RXPE) {
+ ir_raw_event_set_idle(ir->rc, true);
+ ir_raw_event_handle(ir->rc);
+ }
+
+ spin_unlock_irq(&ir->ir_lock);
+
+ return IRQ_HANDLED;
+}
+
+
+static int sunxi_ir_probe(struct platform_device *pdev)
+{
+ int ret =3D 0;
+ unsigned long tmp =3D 0;
+
+ struct device *dev =3D &pdev->dev;
+ struct device_node *dn =3D dev->of_node;
+ struct resource *res;
+ struct sunxi_ir *ir;
+
+ ir =3D devm_kzalloc(dev, sizeof(struct sunxi_ir), GFP_KERNEL);
+ if (!ir)
+ return -ENOMEM;
+
+ /* Clock */
+ ir->apb_clk =3D devm_clk_get(dev, "apb");
+ if (IS_ERR(ir->apb_clk)) {
+ dev_err(dev, "failed to get a apb clock.\n");
+ return -EINVAL;
+ }
+ ir->clk =3D devm_clk_get(dev, "ir");
+ if (IS_ERR(ir->clk)) {
+ dev_err(dev, "failed to get a ir clock.\n");
+ return -EINVAL;
+ }
+
+ ret =3D clk_set_rate(ir->clk, SUNXI_IR_BASE_CLK);
+ if (ret) {
+ dev_err(dev, "set ir base clock failed!\n");
+ return -EINVAL;
+ }
+
+ if (clk_prepare_enable(ir->apb_clk)) {
+ dev_err(dev, "try to enable apb_ir_clk failed\n");
+ return -EINVAL;
+ }
+
+ if (clk_prepare_enable(ir->clk)) {
+ dev_err(dev, "try to enable ir_clk failed\n");
+ ret =3D -EINVAL;
+ goto exit_clkdisable_apb_clk;
+ }
+
+ /* IO */
+ res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+ ir->base =3D devm_ioremap_resource(dev, res);
+ if (IS_ERR(ir->base)) {
+ dev_err(dev, "failed to map registers\n");
+ ret =3D -ENOMEM;
+ goto exit_clkdisable_clk;
+ }
+
+ /* IRQ */
+ ir->irq =3D platform_get_irq(pdev, 0);
+ if (ir->irq < 0) {
+ dev_err(dev, "no irq resource\n");
+ ret =3D -EINVAL;
+ goto exit_clkdisable_clk;
+ }
+
+ ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, ir)=
;
+ if (ret) {
+ dev_err(dev, "failed request irq\n");
+ ret =3D -EINVAL;
+ goto exit_clkdisable_clk;
+ }
+
+ ir->rc =3D rc_allocate_device();
+
+ if (!ir->rc) {
+ dev_err(dev, "failed to allocate device\n");
+ ret =3D -ENOMEM;
+ goto exit_clkdisable_clk;
+ }
+
+ ir->rc->priv =3D ir;
+ ir->rc->input_name =3D SUNXI_IR_DEV;
+ ir->rc->input_phys =3D "sunxi-ir/input0";
+ ir->rc->input_id.bustype =3D BUS_HOST;
+ ir->rc->input_id.vendor =3D 0x0001;
+ ir->rc->input_id.product =3D 0x0001;
+ ir->rc->input_id.version =3D 0x0100;
+ ir->map_name =3D of_get_property(dn, "linux,rc-map-name", NULL);
+ ir->rc->map_name =3D ir->map_name ?: RC_MAP_EMPTY;
+ ir->rc->dev.parent =3D dev;
+ ir->rc->driver_type =3D RC_DRIVER_IR_RAW;
+ rc_set_allowed_protocols(ir->rc, RC_BIT_ALL);
+ ir->rc->rx_resolution =3D SUNXI_IR_SAMPLE;
+ ir->rc->timeout =3D MS_TO_NS(SUNXI_IR_TIMEOUT);
+ ir->rc->driver_name =3D SUNXI_IR_DEV;
+
+ ret =3D rc_register_device(ir->rc);
+ if (ret) {
+ dev_err(dev, "failed to register rc device\n");
+ ret =3D -EINVAL;
+ goto exit_free_dev;
+ }
+
+ platform_set_drvdata(pdev, ir);
+
+ /* Enable CIR Mode */
+ writel(0x3 << 4, ir->base+SUNXI_IR_CTL_REG);
+
+ /* Config IR Sample Register */
+ /* Fsample =3D clk */
+ tmp =3D 0;
+ /* Set Filter Threshold */
+ tmp |=3D (SUNXI_IR_RXFILT & 0x3f) << 2;
+ /* Set Idle Threshold */
+ tmp |=3D (SUNXI_IR_RXIDLE & 0xff) << 8;
+ writel(tmp, ir->base + SUNXI_IR_CIR_REG);
+
+ /* Invert Input Signal */
+ writel(0x1 << 2, ir->base + SUNXI_IR_RXCTL_REG);
+
+ /* Clear All Rx Interrupt Status */
+ writel(0xff, ir->base + SUNXI_IR_RXSTA_REG);
+
+ /* Enable IRQ on data, overflow, packed end */
+ tmp =3D (0x1 << 4) | 0x3;
+
+ /* Rx FIFO Threshold */
+ tmp |=3D (SUNXI_IR_FIFO_TRIG - 1) << 8;
+
+ writel(tmp, ir->base + SUNXI_IR_RXINT_REG);
+
+ /* Enable IR Module */
+ tmp =3D readl(ir->base + SUNXI_IR_CTL_REG);
+
+ writel(tmp | 0x3, ir->base + SUNXI_IR_CTL_REG);
+
+ dev_info(dev, "initialized sunXi IR driver\n");
+ return 0;
+
+exit_free_dev:
+ rc_free_device(ir->rc);
+exit_clkdisable_clk:
+ clk_disable_unprepare(ir->clk);
+exit_clkdisable_apb_clk:
+ clk_disable_unprepare(ir->apb_clk);
+
+ return ret;
+}
+
+static int sunxi_ir_remove(struct platform_device *pdev)
+{
+ unsigned long flags;
+ struct sunxi_ir *ir =3D platform_get_drvdata(pdev);
+
+ clk_disable_unprepare(ir->clk);
+ clk_disable_unprepare(ir->apb_clk);
+
+ spin_lock_irqsave(&ir->ir_lock, flags);
+ /* disable IR IRQ */
+ writel(0, ir->base + SUNXI_IR_RXINT_REG);
+ /* clear All Rx Interrupt Status */
+ writel(0xff, ir->base + SUNXI_IR_RXSTA_REG);
+ /* disable IR */
+ writel(0, ir->base + SUNXI_IR_CTL_REG);
+ spin_unlock_irqrestore(&ir->ir_lock, flags);
+
+ rc_unregister_device(ir->rc);
+ return 0;
+}
+
+static const struct of_device_id sunxi_ir_match[] =3D {
+ { .compatible =3D "allwinner,sun7i-a20-ir", },
+ {},
+};
+
+static struct platform_driver sunxi_ir_driver =3D {
+ .probe          =3D sunxi_ir_probe,
+ .remove         =3D sunxi_ir_remove,
+ .driver =3D {
+ .name =3D SUNXI_IR_DEV,
+ .owner =3D THIS_MODULE,
+ .of_match_table =3D sunxi_ir_match,
+ },
+};
+
+module_platform_driver(sunxi_ir_driver);
+
+MODULE_DESCRIPTION("Allwinner sunXi IR controller driver");
+MODULE_AUTHOR("Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>");
+MODULE_LICENSE("GPL");


=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 30 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 201=
4 =D0=B3., 16:51:12 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=
=D1=82=D0=B5=D0=BB=D1=8C =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=
=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=B5=D0=B2=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>
> This patch introduces Consumer IR(CIR) support for sunxi boards.
>
> This is based on Alexsey Shestacov's work based on the original driver=20
> supplied by Allwinner.
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_138_1381814.1398855498683
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>[PATCH v4 02/03] ARM: sunxi: Add driver for sunxi IR =
controller</div><div><br></div><div>This patch adds driver for sunxi IR con=
troller.</div><div>It is based on Alexsey Shestacov's work based on the ori=
ginal driver&nbsp;</div><div>supplied by Allwinner.</div><div><br></div><di=
v>Signed-off-by: Alexander Bersenev &lt;bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org&gt;</div><div>Sign=
ed-off-by: Alexsey Shestacov &lt;wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org&gt;</div><div><br=
></div><div>diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfi=
g</div><div>index 8fbd377..9427fad 100644</div><div>--- a/drivers/media/rc/=
Kconfig</div><div>+++ b/drivers/media/rc/Kconfig</div><div>@@ -343,4 +343,1=
4 @@ config RC_ST</div><div>&nbsp;</div><div>&nbsp;<span class=3D"Apple-tab=
-span" style=3D"white-space:pre">	</span> If you're not sure, select N here=
.</div><div>&nbsp;</div><div>+config IR_SUNXI</div><div>+ &nbsp; &nbsp;tris=
tate "SUNXI IR remote control"</div><div>+ &nbsp; &nbsp;depends on RC_CORE<=
/div><div>+ &nbsp; &nbsp;depends on ARCH_SUNXI</div><div>+ &nbsp; &nbsp;---=
help---</div><div>+ &nbsp; &nbsp; &nbsp;Say Y if you want to use sunXi inte=
rnal IR Controller</div><div>+</div><div>+ &nbsp; &nbsp; &nbsp;To compile t=
his driver as a module, choose M here: the module will</div><div>+ &nbsp; &=
nbsp; &nbsp;be called sunxi-ir.</div><div>+</div><div>&nbsp;endif #RC_DEVIC=
ES</div><div>diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Make=
file</div><div>index f8b54ff..93cdbe9 100644</div><div>--- a/drivers/media/=
rc/Makefile</div><div>+++ b/drivers/media/rc/Makefile</div><div>@@ -32,4 +3=
2,5 @@ obj-$(CONFIG_IR_GPIO_CIR) +=3D gpio-ir-recv.o</div><div>&nbsp;obj-$(=
CONFIG_IR_IGUANA) +=3D iguanair.o</div><div>&nbsp;obj-$(CONFIG_IR_TTUSBIR) =
+=3D ttusbir.o</div><div>&nbsp;obj-$(CONFIG_RC_ST) +=3D st_rc.o</div><div>+=
obj-$(CONFIG_IR_SUNXI) +=3D sunxi-ir.o</div><div>&nbsp;obj-$(CONFIG_IR_IMG)=
 +=3D img-ir/</div><div>diff --git a/drivers/media/rc/sunxi-ir.c b/drivers/=
media/rc/sunxi-ir.c</div><div>new file mode 100644</div><div>index 0000000.=
.f051d94</div><div>--- /dev/null</div><div>+++ b/drivers/media/rc/sunxi-ir.=
c</div><div>@@ -0,0 +1,303 @@</div><div>+/*</div><div>+ * Driver for Allwin=
ner sunXi IR controller</div><div>+ *</div><div>+ * Copyright (C) 2014 Alex=
sey Shestacov &lt;wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org&gt;</div><div>+ * Copyright (C) =
2014 Alexander Bersenev &lt;bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org&gt;</div><div>+ *</div><div>+ =
* Based on sun5i-ir.c:</div><div>+ * Copyright (C) 2007-2012 Daniel Wang</d=
iv><div>+ * Allwinner Technology Co., Ltd. &lt;www.allwinnertech.com&gt;</d=
iv><div>+ *</div><div>+ * This program is free software; you can redistribu=
te it and/or</div><div>+ * modify it under the terms of the GNU General Pub=
lic License as</div><div>+ * published by the Free Software Foundation; eit=
her version 2 of</div><div>+ * the License, or (at your option) any later v=
ersion.</div><div>+ *</div><div>+ * This program is distributed in the hope=
 that it will be useful,</div><div>+ * but WITHOUT ANY WARRANTY; without ev=
en the implied warranty of</div><div>+ * MERCHANTABILITY or FITNESS FOR A P=
ARTICULAR PURPOSE. See the</div><div>+ * GNU General Public License for mor=
e details.</div><div>+ */</div><div>+</div><div>+#include &lt;linux/clk.h&g=
t;</div><div>+#include &lt;linux/interrupt.h&gt;</div><div>+#include &lt;li=
nux/module.h&gt;</div><div>+#include &lt;linux/of_platform.h&gt;</div><div>=
+#include &lt;media/rc-core.h&gt;</div><div>+</div><div>+#define SUNXI_IR_D=
EV "sunxi-ir"</div><div>+</div><div>+/* Registers */</div><div>+/* IR Contr=
ol */</div><div>+#define SUNXI_IR_CTL_REG &nbsp; &nbsp; &nbsp;0x00</div><di=
v>+/* Rx Config */</div><div>+#define SUNXI_IR_RXCTL_REG &nbsp; &nbsp;0x10<=
/div><div>+/* Rx Data */</div><div>+#define SUNXI_IR_RXFIFO_REG &nbsp; 0x20=
</div><div>+/* Rx Interrupt Enable */</div><div>+#define SUNXI_IR_RXINT_REG=
 &nbsp; &nbsp;0x2C</div><div>+/* Rx Interrupt Status */</div><div>+#define =
SUNXI_IR_RXSTA_REG &nbsp; &nbsp;0x30</div><div>+/* IR Sample Config */</div=
><div>+#define SUNXI_IR_CIR_REG &nbsp; &nbsp; &nbsp;0x34</div><div>+</div><=
div>+/* Bit Definition of IR_RXINTS_REG Register */</div><div>+#define SUNX=
I_IR_RXINTS_RXOF &nbsp;BIT(0) /* Rx FIFO Overflow */</div><div>+#define SUN=
XI_IR_RXINTS_RXPE &nbsp;BIT(1) /* Rx Packet End */</div><div>+#define SUNXI=
_IR_RXINTS_RXDA &nbsp;BIT(4) /* Rx FIFO Data Available */</div><div>+/* Har=
dware supported fifo size */</div><div>+#define SUNXI_IR_FIFO_SIZE &nbsp; &=
nbsp;16</div><div>+/* How much messages in fifo triggers IRQ */</div><div>+=
#define SUNXI_IR_FIFO_TRIG &nbsp; &nbsp;8</div><div>+/* Required frequency =
for IR0 or IR1 clock in CIR mode */</div><div>+#define SUNXI_IR_BASE_CLK &n=
bsp; &nbsp; 8000000</div><div>+/* Frequency after IR internal divider &nbsp=
;*/</div><div>+#define SUNXI_IR_CLK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(SUNX=
I_IR_BASE_CLK / 64)</div><div>+/* Sample period in ns */</div><div>+#define=
 SUNXI_IR_SAMPLE &nbsp; &nbsp; &nbsp; (1000000000ul / SUNXI_IR_CLK)</div><d=
iv>+/* Filter threshold in samples &nbsp;*/</div><div>+#define SUNXI_IR_RXF=
ILT &nbsp; &nbsp; &nbsp; 1</div><div>+/* Idle Threshold in samples */</div>=
<div>+#define SUNXI_IR_RXIDLE &nbsp; &nbsp; &nbsp; 20</div><div>+/* Time af=
ter which device stops sending data in ms */</div><div>+#define SUNXI_IR_TI=
MEOUT &nbsp; &nbsp; &nbsp;120</div><div>+</div><div>+struct sunxi_ir {</div=
><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>spi=
nlock_t &nbsp; &nbsp; &nbsp;ir_lock;</div><div>+<span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>struct rc_dev &nbsp; *rc;</div><div>+=
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>void __iom=
em &nbsp; &nbsp;*base;</div><div>+<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span>int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; irq;<=
/div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span=
>struct clk &nbsp; &nbsp; &nbsp;*clk;</div><div>+<span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre">	</span>struct clk &nbsp; &nbsp; &nbsp;*apb_=
clk;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	<=
/span>const char &nbsp; &nbsp; &nbsp;*map_name;</div><div>+};</div><div>+</=
div><div>+static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)</div><di=
v>+{</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	<=
/span>unsigned long status;</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>unsigned char dt;</div><div>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>unsigned int cnt, rc;</div>=
<div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>stru=
ct sunxi_ir *ir =3D dev_id;</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>DEFINE_IR_RAW_EVENT(rawir);</div><div>+</div><=
div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>spin_=
lock_irq(&amp;ir-&gt;ir_lock);</div><div>+</div><div>+<span class=3D"Apple-=
tab-span" style=3D"white-space:pre">	</span>status =3D readl(ir-&gt;base + =
SUNXI_IR_RXSTA_REG);</div><div>+</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* clean all pending statuses */</div><di=
v>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>writel(=
status | 0xff, ir-&gt;base + SUNXI_IR_RXSTA_REG);</div><div>+</div><div>+<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (status &=
amp; SUNXI_IR_RXINTS_RXDA) {</div><div>+<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">		</span>/* How much messages in fifo */</div><div>+<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>rc &nbsp;=
=3D (status &gt;&gt; 8) &amp; 0x3f;</div><div>+<span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre">		</span>/* Sanity check */</div><div>+<span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">		</span>rc =3D rc &gt; S=
UNXI_IR_FIFO_SIZE ? SUNXI_IR_FIFO_SIZE : rc;</div><div>+<span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">		</span>/* if we have data */</div><=
div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>for =
(cnt =3D 0; cnt &lt; rc; cnt++) {</div><div>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">			</span>/* for each bit in fifo */</div><div>+=
<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>dt =3D r=
eadb(ir-&gt;base + SUNXI_IR_RXFIFO_REG);</div><div>+<span class=3D"Apple-ta=
b-span" style=3D"white-space:pre">			</span>rawir.pulse =3D (dt &amp; 0x80)=
 !=3D 0;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre=
">			</span>rawir.duration =3D (dt &amp; 0x7f) * SUNXI_IR_SAMPLE;</div><div=
>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>ir_raw=
_event_store_with_filter(ir-&gt;rc, &amp;rawir);</div><div>+<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">		</span>}</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}</div><div>+</div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (st=
atus &amp; SUNXI_IR_RXINTS_RXOF)</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>ir_raw_event_reset(ir-&gt;rc);</div><div=
>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>else if =
(status &amp; SUNXI_IR_RXINTS_RXPE) {</div><div>+<span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre">		</span>ir_raw_event_set_idle(ir-&gt;rc, tr=
ue);</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>ir_raw_event_handle(ir-&gt;rc);</div><div>+<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span>}</div><div>+</div><div>+<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">	</span>spin_unlock_irq(&amp=
;ir-&gt;ir_lock);</div><div>+</div><div>+<span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre">	</span>return IRQ_HANDLED;</div><div>+}</div><div>+=
</div><div>+</div><div>+static int sunxi_ir_probe(struct platform_device *p=
dev)</div><div>+{</div><div>+<span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>int ret =3D 0;</div><div>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>unsigned long tmp =3D 0;</div><div>+</di=
v><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>st=
ruct device *dev =3D &amp;pdev-&gt;dev;</div><div>+<span class=3D"Apple-tab=
-span" style=3D"white-space:pre">	</span>struct device_node *dn =3D dev-&gt=
;of_node;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>struct resource *res;</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>struct sunxi_ir *ir;</div><div>+</div><di=
v>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir =3D =
devm_kzalloc(dev, sizeof(struct sunxi_ir), GFP_KERNEL);</div><div>+<span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (!ir)</div><div=
>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>return =
-ENOMEM;</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span>/* Clock */</div><div>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>ir-&gt;apb_clk =3D devm_clk_get(dev, "ap=
b");</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	<=
/span>if (IS_ERR(ir-&gt;apb_clk)) {</div><div>+<span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre">		</span>dev_err(dev, "failed to get a apb clo=
ck.\n");</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre=
">		</span>return -EINVAL;</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>}</div><div>+<span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">	</span>ir-&gt;clk =3D devm_clk_get(dev, "ir");</di=
v><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if=
 (IS_ERR(ir-&gt;clk)) {</div><div>+<span class=3D"Apple-tab-span" style=3D"=
white-space:pre">		</span>dev_err(dev, "failed to get a ir clock.\n");</div=
><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>re=
turn -EINVAL;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">	</span>}</div><div>+</div><div>+<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>ret =3D clk_set_rate(ir-&gt;clk, SUNXI_IR_BAS=
E_CLK);</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span>if (ret) {</div><div>+<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">		</span>dev_err(dev, "set ir base clock failed!\n");</div><di=
v>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>return=
 -EINVAL;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>}</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D=
"white-space:pre">	</span>if (clk_prepare_enable(ir-&gt;apb_clk)) {</div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>dev_e=
rr(dev, "try to enable apb_ir_clk failed\n");</div><div>+<span class=3D"App=
le-tab-span" style=3D"white-space:pre">		</span>return -EINVAL;</div><div>+=
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}</div><di=
v>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span>if (clk_prepare_enable(ir-&gt;clk)) {</div><div>+<span class=3D"Apple-=
tab-span" style=3D"white-space:pre">		</span>dev_err(dev, "try to enable ir=
_clk failed\n");</div><div>+<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">		</span>ret =3D -EINVAL;</div><div>+<span class=3D"Apple-tab-spa=
n" style=3D"white-space:pre">		</span>goto exit_clkdisable_apb_clk;</div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}</div=
><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span>/* IO */</div><div>+<span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);<=
/div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:=
pre">	</span>ir-&gt;base =3D devm_ioremap_resource(dev, res);</div><div>+<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (IS_ERR(i=
r-&gt;base)) {</div><div>+<span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre">		</span>dev_err(dev, "failed to map registers\n");</div><div>+<spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>ret =3D -ENOM=
EM;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		<=
/span>goto exit_clkdisable_clk;</div><div>+<span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre">	</span>}</div><div>+</div><div>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>/* IRQ */</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir-&gt;irq =3D p=
latform_get_irq(pdev, 0);</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>if (ir-&gt;irq &lt; 0) {</div><div>+<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">		</span>dev_err(dev, "no ir=
q resource\n");</div><div>+<span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre">		</span>ret =3D -EINVAL;</div><div>+<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">		</span>goto exit_clkdisable_clk;</div><div>+<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}</div><div=
>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>ret =3D devm_request_irq(dev, ir-&gt;irq, sunxi_ir_irq, 0, SUNXI_IR_DEV=
, ir);</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>if (ret) {</div><div>+<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">		</span>dev_err(dev, "failed request irq\n");</div><div>+<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>ret =3D -EINVA=
L;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</=
span>goto exit_clkdisable_clk;</div><div>+<span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">	</span>}</div><div>+</div><div>+<span class=3D"App=
le-tab-span" style=3D"white-space:pre">	</span>ir-&gt;rc =3D rc_allocate_de=
vice();</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span>if (!ir-&gt;rc) {</div><div>+<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">		</span>dev_err(dev, "failed to allocate d=
evice\n");</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:p=
re">		</span>ret =3D -ENOMEM;</div><div>+<span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre">		</span>goto exit_clkdisable_clk;</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}</div><div>+</d=
iv><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i=
r-&gt;rc-&gt;priv =3D ir;</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>ir-&gt;rc-&gt;input_name =3D SUNXI_IR_DEV;</di=
v><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir=
-&gt;rc-&gt;input_phys =3D "sunxi-ir/input0";</div><div>+<span class=3D"App=
le-tab-span" style=3D"white-space:pre">	</span>ir-&gt;rc-&gt;input_id.busty=
pe =3D BUS_HOST;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">	</span>ir-&gt;rc-&gt;input_id.vendor =3D 0x0001;</div><div>+<spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir-&gt;rc-&gt;=
input_id.product =3D 0x0001;</div><div>+<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>ir-&gt;rc-&gt;input_id.version =3D 0x0100;</d=
iv><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i=
r-&gt;map_name =3D of_get_property(dn, "linux,rc-map-name", NULL);</div><di=
v>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir-&gt;=
rc-&gt;map_name =3D ir-&gt;map_name ?: RC_MAP_EMPTY;</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir-&gt;rc-&gt;dev.par=
ent =3D dev;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space=
:pre">	</span>ir-&gt;rc-&gt;driver_type =3D RC_DRIVER_IR_RAW;</div><div>+<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rc_set_allow=
ed_protocols(ir-&gt;rc, RC_BIT_ALL);</div><div>+<span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>ir-&gt;rc-&gt;rx_resolution =3D SUNXI=
_IR_SAMPLE;</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:=
pre">	</span>ir-&gt;rc-&gt;timeout =3D MS_TO_NS(SUNXI_IR_TIMEOUT);</div><di=
v>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>ir-&gt;=
rc-&gt;driver_name =3D SUNXI_IR_DEV;</div><div>+</div><div>+<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">	</span>ret =3D rc_register_devic=
e(ir-&gt;rc);</div><div>+<span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">	</span>if (ret) {</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">		</span>dev_err(dev, "failed to register rc device\n"=
);</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</=
span>ret =3D -EINVAL;</div><div>+<span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">		</span>goto exit_free_dev;</div><div>+<span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>}</div><div>+</div><div>+<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>platform_set_dr=
vdata(pdev, ir);</div><div>+</div><div>+<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>/* Enable CIR Mode */</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>writel(0x3 &lt;&lt; 4=
, ir-&gt;base+SUNXI_IR_CTL_REG);</div><div>+</div><div>+<span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span>/* Config IR Sample Register =
*/</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>/* Fsample =3D clk */</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>tmp =3D 0;</div><div>+<span class=3D"Apple-tab=
-span" style=3D"white-space:pre">	</span>/* Set Filter Threshold */</div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>tmp |=
=3D (SUNXI_IR_RXFILT &amp; 0x3f) &lt;&lt; 2;</div><div>+<span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span>/* Set Idle Threshold */</div=
><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>tmp=
 |=3D (SUNXI_IR_RXIDLE &amp; 0xff) &lt;&lt; 8;</div><div>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>writel(tmp, ir-&gt;base + S=
UNXI_IR_CIR_REG);</div><div>+</div><div>+<span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre">	</span>/* Invert Input Signal */</div><div>+<span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>writel(0x1 &lt;&l=
t; 2, ir-&gt;base + SUNXI_IR_RXCTL_REG);</div><div>+</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* Clear All Rx Inter=
rupt Status */</div><div>+<span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre">	</span>writel(0xff, ir-&gt;base + SUNXI_IR_RXSTA_REG);</div><div>+=
</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n>/* Enable IRQ on data, overflow, packed end */</div><div>+<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">	</span>tmp =3D (0x1 &lt;&lt; 4) =
| 0x3;</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>/* Rx FIFO Threshold */</div><div>+<span class=3D"Apple=
-tab-span" style=3D"white-space:pre">	</span>tmp |=3D (SUNXI_IR_FIFO_TRIG -=
 1) &lt;&lt; 8;</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>writel(tmp, ir-&gt;base + SUNXI_IR_RXINT_REG);=
</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space=
:pre">	</span>/* Enable IR Module */</div><div>+<span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>tmp =3D readl(ir-&gt;base + SUNXI_IR_=
CTL_REG);</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">	</span>writel(tmp | 0x3, ir-&gt;base + SUNXI_IR_CTL_REG);</=
div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:p=
re">	</span>dev_info(dev, "initialized sunXi IR driver\n");</div><div>+<spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return 0;</div=
><div>+</div><div>+exit_free_dev:</div><div>+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>rc_free_device(ir-&gt;rc);</div><div>+ex=
it_clkdisable_clk:</div><div>+<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>clk_disable_unprepare(ir-&gt;clk);</div><div>+exit_clkd=
isable_apb_clk:</div><div>+<span class=3D"Apple-tab-span" style=3D"white-sp=
ace:pre">	</span>clk_disable_unprepare(ir-&gt;apb_clk);</div><div>+</div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return=
 ret;</div><div>+}</div><div>+</div><div>+static int sunxi_ir_remove(struct=
 platform_device *pdev)</div><div>+{</div><div>+<span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>unsigned long flags;</div><div>+<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>struct sunxi_ir=
 *ir =3D platform_get_drvdata(pdev);</div><div>+</div><div>+<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">	</span>clk_disable_unprepare(ir-=
&gt;clk);</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pr=
e">	</span>clk_disable_unprepare(ir-&gt;apb_clk);</div><div>+</div><div>+<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>spin_lock_ir=
qsave(&amp;ir-&gt;ir_lock, flags);</div><div>+<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">	</span>/* disable IR IRQ */</div><div>+<span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>writel(0, ir-&gt;=
base + SUNXI_IR_RXINT_REG);</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>/* clear All Rx Interrupt Status */</div><div>=
+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>writel(0x=
ff, ir-&gt;base + SUNXI_IR_RXSTA_REG);</div><div>+<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span>/* disable IR */</div><div>+<span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>writel(0, ir-&gt;=
base + SUNXI_IR_CTL_REG);</div><div>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>spin_unlock_irqrestore(&amp;ir-&gt;ir_lock, fl=
ags);</div><div>+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>rc_unregister_device(ir-&gt;rc);</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return 0;</div><div>+=
}</div><div>+</div><div>+static const struct of_device_id sunxi_ir_match[] =
=3D {</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>{ .compatible =3D "allwinner,sun7i-a20-ir", },</div><div>+<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">	</span>{},</div><div>+};</d=
iv><div>+</div><div>+static struct platform_driver sunxi_ir_driver =3D {</d=
iv><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>.=
probe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D sunxi_ir_probe,</div><div>+<spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>.remove &nbsp;=
 &nbsp; &nbsp; &nbsp; =3D sunxi_ir_remove,</div><div>+<span class=3D"Apple-=
tab-span" style=3D"white-space:pre">	</span>.driver =3D {</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>.name =3D SUNXI=
_IR_DEV,</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre=
">		</span>.owner =3D THIS_MODULE,</div><div>+<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">		</span>.of_match_table =3D sunxi_ir_match,</d=
iv><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}=
,</div><div>+};</div><div>+</div><div>+module_platform_driver(sunxi_ir_driv=
er);</div><div>+</div><div>+MODULE_DESCRIPTION("Allwinner sunXi IR controll=
er driver");</div><div>+MODULE_AUTHOR("Alexsey Shestacov &lt;wingrime@linux=
-sunxi.org&gt;");</div><div>+MODULE_LICENSE("GPL");</div><div><br></div><br=
>=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 30 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 20=
14&nbsp;=D0=B3., 16:51:12 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=
=D0=B0=D1=82=D0=B5=D0=BB=D1=8C =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=
=D0=B4=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=B5=D0=B2 =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:<blockquote class=3D"gmail_quote" style=3D"m=
argin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"=
><div dir=3D"ltr"><div>This patch introduces Consumer IR(CIR) support for s=
unxi boards.</div><div><br></div><div>This is based on Alexsey Shestacov's =
work based on the original driver&nbsp;</div><div>supplied by Allwinner.</d=
iv></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_138_1381814.1398855498683--
