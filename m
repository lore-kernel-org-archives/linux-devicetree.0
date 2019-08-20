From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
Date: Tue, 20 Aug 2019 21:36:07 +0900
Message-ID: <156630456771.17444.15687151782258703992.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update the CMT driver to mark "renesas,cmt-48" as deprecated.

Instead of documenting a theoretical hardware device based on current software
support level, define DT bindings top-down based on available data sheet
information and make use of part numbers in the DT compat string.

In case of the only in-tree users r8a7740 and sh73a0 the compat strings
"renesas,r8a7740-cmt1" and "renesas,sh73a0-cmt1" may be used instead.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 drivers/clocksource/sh_cmt.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- 0011/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-07-18 19:31:01.917491800 +0900
@@ -921,7 +921,11 @@ static const struct platform_device_id s
 MODULE_DEVICE_TABLE(platform, sh_cmt_id_table);
 
 static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
-	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
+	{
+		/* deprecated, preserved for backward compatibility */
+		.compatible = "renesas,cmt-48",
+		.data = &sh_cmt_info[SH_CMT_48BIT]
+	},
 	{
 		/* deprecated, preserved for backward compatibility */
 		.compatible = "renesas,cmt-48-gen2",
