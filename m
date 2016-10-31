From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/7] base: soc: Provide a dummy implementation of soc_device_match()
Date: Mon, 31 Oct 2016 12:30:52 +0100
Message-ID: <1477913455-5314-5-git-send-email-geert+renesas@glider.be>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yangbo Lu <yangbo.lu@nxp.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Provide a dummy implementation of soc_device_match(), to allow compiling
drivers that may be used on SoCs both with and without CONFIG_SOC_BUS,
and for compile testing.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 include/linux/sys_soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index 9f5eb06f9fd87565..bed223b70217fd2d 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -35,6 +35,12 @@ struct soc_device *soc_device_register(
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+#ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);
+#else
+static inline const struct soc_device_attribute *soc_device_match(
+	const struct soc_device_attribute *matches) { return NULL; }
+#endif
+
 #endif /* __SOC_BUS_H */
-- 
1.9.1
