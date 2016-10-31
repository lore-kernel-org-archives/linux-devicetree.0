From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/7] base: soc: Early register bus when needed
Date: Mon, 31 Oct 2016 12:30:49 +0100
Message-ID: <1477913455-5314-2-git-send-email-geert+renesas@glider.be>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yangbo Lu <yangbo.lu@nxp.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

If soc_device_register() is called before soc_bus_register(), it crashes
with a NULL pointer dereference.

soc_bus_register() is already a core_initcall(), but drivers/base/ is
entered later than e.g. drivers/pinctrl/ and drivers/soc/. Hence there
are several subsystems that may need to know SoC revision information,
while it's not so easy to initialize the SoC bus even earlier using an
initcall.

To fix this, let soc_device_register() register the bus early if that
hasn't happened yet.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 drivers/base/soc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index b63f23e6ad61b647..028cef377fd49959 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -113,6 +113,12 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	struct soc_device *soc_dev;
 	int ret;
 
+	if (!soc_bus_type.p) {
+		ret = bus_register(&soc_bus_type);
+		if (ret)
+			goto out1;
+	}
+
 	soc_dev = kzalloc(sizeof(*soc_dev), GFP_KERNEL);
 	if (!soc_dev) {
 		ret = -ENOMEM;
@@ -156,6 +162,9 @@ void soc_device_unregister(struct soc_device *soc_dev)
 
 static int __init soc_bus_register(void)
 {
+	if (soc_bus_type.p)
+		return 0;
+
 	return bus_register(&soc_bus_type);
 }
 core_initcall(soc_bus_register);
-- 
1.9.1
