From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 1/4] tools: gpio: Small updates for output format
Date: Tue, 23 Feb 2016 08:54:46 +0100
Message-ID: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Use %2d for the GPIO line number. This should align the results
horziontally for most gpio chips.

The GPIO label uses quotes for real values. For GPIO names this is
currently missing. The patch adds the missing quote.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 tools/gpio/lsgpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 5535ce81f8f7..6af118cc7efb 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -111,9 +111,9 @@ int list_device(const char *device_name)
 			perror("Failed to issue LINEINFO IOCTL\n");
 			goto exit_close_error;
 		}
-		fprintf(stdout, "\tline %d:", linfo.line_offset);
+		fprintf(stdout, "\tline %2d:", linfo.line_offset);
 		if (linfo.name[0])
-			fprintf(stdout, " %s", linfo.name);
+			fprintf(stdout, " \"%s\"", linfo.name);
 		else
 			fprintf(stdout, " unnamed");
 		if (linfo.label[0])
-- 
2.7.0

