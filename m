From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/5] gpio: gpiolib: Print error number if gpio hog failed
Date: Tue, 8 Mar 2016 17:32:05 +0530
Message-ID: <1457438528-29054-3-git-send-email-ldewangan@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Print the error number of GPIO hog failed during
its configurations. This helps in identifying the
failure without instrumenting the code.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpiolib.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bc788b9..7575ebb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2621,15 +2621,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
 	if (IS_ERR(local_desc)) {
-		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed\n",
-		       name, chip->label, hwnum);
+		status = PTR_ERR(local_desc);
+		pr_err("requesting hog GPIO %s, chip %s, offset %d failed %d\n",
+		       name, chip->label, hwnum, status);
 		return PTR_ERR(local_desc);
 	}
 
 	status = gpiod_configure_flags(desc, name, dflags);
 	if (status < 0) {
-		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed\n",
-		       name, chip->label, hwnum);
+		pr_err("setup of hog GPIO %s chip %s, offset %d failed %d\n",
+		       name, chip->label, hwnum, status);
 		gpiochip_free_own_desc(desc);
 		return status;
 	}
-- 
2.1.4

