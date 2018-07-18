Return-Path: <SRS0=w+aW=KC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-dm3nam03on0047.outbound.protection.outlook.com ([104.47.41.47]:61026
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726240AbeGRGRh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 18 Jul 2018 02:17:37 -0400
From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv4 3/4] tty: serial: uartlite: Add support for suspend and resume
Date: Wed, 18 Jul 2018 11:11:01 +0530
Message-ID: <1531892462-11085-3-git-send-email-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <1531892462-11085-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1531892462-11085-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Cc: shubhrajyoti.datta@gmail.com, robh+dt@kernel.org, gregkh@linuxfoundation.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Add suspend and resume handlers for uartlite

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
patch added

 drivers/tty/serial/uartlite.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index b3a12be..98d3ead 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -690,9 +690,44 @@ static int ulite_release(struct device *dev)
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
+
+static SIMPLE_DEV_PM_OPS(ulite_pm_ops, ulite_suspend, ulite_resume);
+
 #if defined(CONFIG_OF)
 /* Match table for of_platform binding */
 static const struct of_device_id ulite_of_match[] =3D {
@@ -768,6 +803,7 @@ static struct platform_driver ulite_platform_driver =3D=
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
