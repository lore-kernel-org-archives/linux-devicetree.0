From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] of/fdt: Don't clear initial_boot_params if
 fdt_check_header() fails
Date: Wed, 29 Oct 2014 12:15:00 -0600
Message-ID: <20141029181500.16094.46561.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If the device tree pointer is NULL, early_init_dt_verify() fails, leaving
initial_boot_params unchanged.  If the device tree pointer is non-NULL but
invalid, early_init_dt_verify() again fails but this time it also clears
initial_boot_params.

Leave initial_boot_params unchanged if the device tree pointer is invalid.
This doesn't fix a bug, but it makes the behavior more consistent and
easier to analyze.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/of/fdt.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1ffca8b34ea..55a566a53f36 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -994,15 +994,12 @@ bool __init early_init_dt_verify(void *params)
 	if (!params)
 		return false;
 
-	/* Setup flat device-tree pointer */
-	initial_boot_params = params;
-
 	/* check device tree validity */
-	if (fdt_check_header(params)) {
-		initial_boot_params = NULL;
+	if (fdt_check_header(params))
 		return false;
-	}
 
+	/* Setup flat device-tree pointer */
+	initial_boot_params = params;
 	return true;
 }
 
