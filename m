From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 09/11] platform: provide early_platform_driver()
Date: Tue, 24 Apr 2018 19:30:49 +0200
Message-ID: <20180424173051.15099-10-brgl@bgdev.pl>
References: <20180424173051.15099-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424173051.15099-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arend van Spriel <aspriel@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Michal Suchanek <msuchanek@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>, And
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Implement a macro similar to module_platform_driver() which allows to
register early platform drivers with the default early class.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/platform_device.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 514ada776004..b565a1237fa6 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -297,6 +297,8 @@ struct early_platform_driver {
 #define EARLY_PLATFORM_ID_UNSET -2
 #define EARLY_PLATFORM_ID_ERROR -3
 
+#define EARLY_PLATFORM_DEFAULT_CLASS	"earlydev"
+
 #ifdef CONFIG_EARLY_PLATFORM_DEVICES
 
 extern int early_platform_driver_register(struct early_platform_driver *epdrv,
@@ -352,6 +354,9 @@ static inline char *early_platform_driver_setup_func(void)		\
 }
 #endif /* MODULE */
 
+#define early_platform_driver(__platdrv)				\
+	early_platform_init(EARLY_PLATFORM_DEFAULT_CLASS, &(__platdrv))
+
 #else /* CONFIG_EARLY_PLATFORM_DEVICES */
 static inline int
 early_platform_driver_register(struct early_platform_driver *epdrv, char *buf)
@@ -380,6 +385,7 @@ static inline int early_platform_driver_register_probe_all(char *class_str,
 static inline void early_platform_cleanup(void) {}
 #define early_platform_init(class_string, platdrv)
 #define early_platform_init_buffer(class_string, platdrv, buf, bufsiz)
+#define early_platform_driver(__platdrv)
 #endif /* CONFIG_EARLY_PLATFORM_DEVICES */
 
 #ifdef CONFIG_SUSPEND
-- 
2.17.0
