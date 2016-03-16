From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 13/13] ARM: sunxi: Add Kconfig for sunxi clocks
Date: Thu, 17 Mar 2016 00:04:36 +0800
Message-ID: <1458144276-31108-14-git-send-email-vishnupatekar0510@gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBJEJU23QKGQE4UDLZCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1458144276-31108-1-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds Kconfig for sunxi clocks.
Currently, only sun8i-apb0 and sun9i-cpus clocks are added.
It'll help to use common clocks across different SOCs.
We can switch to kconfig for other clocks in future.

Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/Kconfig        | 1 +
 drivers/clk/sunxi/Kconfig  | 5 +++++
 drivers/clk/sunxi/Makefile | 4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/sunxi/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index eca8e01..f9f42e6 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -210,3 +210,4 @@ source "drivers/clk/mvebu/Kconfig"
 
 source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/tegra/Kconfig"
+source "drivers/clk/sunxi/Kconfig"
diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
new file mode 100644
index 0000000..3e8ede4
--- /dev/null
+++ b/drivers/clk/sunxi/Kconfig
@@ -0,0 +1,5 @@
+config CLK_SUN8I_APB0
+	def_bool MACH_SUN9I || MACH_SUN8I
+
+config CLK_SUN9I_CPUS
+	def_bool MACH_SUN9I || MACH_SUN8I
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index 3fd7901..38dfca8 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -17,8 +17,8 @@ obj-y += clk-sun9i-core.o
 obj-y += clk-sun9i-mmc.o
 obj-y += clk-usb.o
 
-obj-$(CONFIG_MACH_SUN9I) += clk-sun8i-apb0.o
-obj-$(CONFIG_MACH_SUN9I) += clk-sun9i-cpus.o
+obj-$(CONFIG_CLK_SUN8I_APB0) += clk-sun8i-apb0.o
+obj-$(CONFIG_CLK_SUN9I_CPUS) += clk-sun9i-cpus.o
 
 obj-$(CONFIG_MFD_SUN6I_PRCM) += \
 	clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
-- 
1.9.1
