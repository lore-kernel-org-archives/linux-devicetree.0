Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr720047.outbound.protection.outlook.com ([40.107.72.47]:64747
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S964953AbeF0MYH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Jun 2018 08:24:07 -0400
From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/4] tty: serial: uartlite: Add clock adaptation
Date: Wed, 27 Jun 2018 17:53:43 +0530
Message-ID: <1530102225-6459-2-git-send-email-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, shubhrajyoti.datta@gmail.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Tanvi Desai <tanvi.desai@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

 - Add support of Common Clock Framework for Uartlite driver
 - Add support for suspend and resume operations

Signed-off-by: Tanvi Desai <tanvi.desai@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/tty/serial/uartlite.c | 83 +++++++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 060ac12..eb8afd9 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -21,6 +21,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/clk.h>

 #define ULITE_NAME             "ttyUL"
 #define ULITE_MAJOR            204
@@ -56,6 +57,7 @@

 struct uartlite_data {
        const struct uartlite_reg_ops *reg_ops;
+       struct clk *clk;
 };

 struct uartlite_reg_ops {
@@ -261,8 +263,15 @@ static void ulite_break_ctl(struct uart_port *port, in=
t ctl)

 static int ulite_startup(struct uart_port *port)
 {
+       struct uartlite_data *pdata =3D port->private_data;
        int ret;

+       ret =3D clk_enable(pdata->clk);
+       if (ret) {
+               dev_err(port->dev, "Failed to enable clock\n");
+               return ret;
+       }
+
        ret =3D request_irq(port->irq, ulite_isr, IRQF_SHARED | IRQF_TRIGGE=
R_RISING,
                          "uartlite", port);
        if (ret)
@@ -277,9 +286,12 @@ static int ulite_startup(struct uart_port *port)

 static void ulite_shutdown(struct uart_port *port)
 {
+       struct uartlite_data *pdata =3D port->private_data;
+
        uart_out32(0, ULITE_CONTROL, port);
        uart_in32(ULITE_CONTROL, port); /* dummy */
        free_irq(port->irq, port);
+       clk_disable(pdata->clk);
 }

 static void ulite_set_termios(struct uart_port *port, struct ktermios *ter=
mios,
@@ -370,6 +382,17 @@ static int ulite_verify_port(struct uart_port *port, s=
truct serial_struct *ser)
        return -EINVAL;
 }

+static void ulite_pm(struct uart_port *port, unsigned int state,
+             unsigned int oldstate)
+{
+       struct uartlite_data *pdata =3D port->private_data;
+
+       if (!state)
+               clk_enable(pdata->clk);
+       else
+               clk_disable(pdata->clk);
+}
+
 #ifdef CONFIG_CONSOLE_POLL
 static int ulite_get_poll_char(struct uart_port *port)
 {
@@ -405,6 +428,7 @@ static const struct uart_ops ulite_ops =3D {
        .request_port   =3D ulite_request_port,
        .config_port    =3D ulite_config_port,
        .verify_port    =3D ulite_verify_port,
+       .pm             =3D ulite_pm,
 #ifdef CONFIG_CONSOLE_POLL
        .poll_get_char  =3D ulite_get_poll_char,
        .poll_put_char  =3D ulite_put_poll_char,
@@ -666,10 +690,44 @@ static int ulite_release(struct device *dev)
        return rc;
 }

+/**
+ * ulite_suspend - Stop the device.
+ *
+ * @dev: handle to the device structure.
+ * Return: 0 always.
+ */
+static int __maybe_unused ulite_suspend(struct device *dev)
+{
+       struct uart_port *port =3D dev_get_drvdata(dev);
+
+       if (port)
+               uart_suspend_port(&ulite_uart_driver, port);
+
+       return 0;
+}
+
+/**
+ * ulite_resume - Resume the device.
+ *
+ * @dev: handle to the device structure.
+ * Return: 0 on success, errno otherwise.
+ */
+static int __maybe_unused ulite_resume(struct device *dev)
+{
+       struct uart_port *port =3D dev_get_drvdata(dev);
+
+       if (port)
+               uart_resume_port(&ulite_uart_driver, port);
+
+       return 0;
+}
+
 /* ---------------------------------------------------------------------
  * Platform bus binding
  */

+static SIMPLE_DEV_PM_OPS(ulite_pm_ops, ulite_suspend, ulite_resume);
+
 #if defined(CONFIG_OF)
 /* Match table for of_platform binding */
 static const struct of_device_id ulite_of_match[] =3D {
@@ -684,7 +742,7 @@ static int ulite_probe(struct platform_device *pdev)
 {
        struct resource *res;
        struct uartlite_data *pdata;
-       int irq;
+       int irq, ret;
        int id =3D pdev->id;
 #ifdef CONFIG_OF
        const __be32 *prop;
@@ -706,11 +764,33 @@ static int ulite_probe(struct platform_device *pdev)
        if (irq <=3D 0)
                return -ENXIO;

+       pdata->clk =3D devm_clk_get(&pdev->dev, "s_axi_aclk");
+       if (IS_ERR(pdata->clk)) {
+               if (PTR_ERR(pdata->clk) !=3D -ENOENT)
+                       return PTR_ERR(pdata->clk);
+
+               /*
+                * Clock framework support is optional, continue on
+                * anyways if we don't find a matching clock.
+                */
+               pdata->clk =3D NULL;
+       }
+
+       ret =3D clk_prepare(pdata->clk);
+       if (ret) {
+               dev_err(&pdev->dev, "Failed to prepare clock\n");
+               return ret;
+       }
+
        return ulite_assign(&pdev->dev, id, res->start, irq, pdata);
 }

 static int ulite_remove(struct platform_device *pdev)
 {
+       struct uart_port *port =3D dev_get_drvdata(&pdev->dev);
+       struct uartlite_data *pdata =3D port->private_data;
+
+       clk_disable_unprepare(pdata->clk);
        return ulite_release(&pdev->dev);
 }

@@ -723,6 +803,7 @@ static struct platform_driver ulite_platform_driver =3D=
 {
        .driver =3D {
                .name  =3D "uartlite",
                .of_match_table =3D of_match_ptr(ulite_of_match),
+               .pm =3D &ulite_pm_ops,
        },
 };

--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
