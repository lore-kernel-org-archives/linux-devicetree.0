From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v6 17/20] hwmon: (core) Add hwmon_max to hwmon_sensor_types
 enumeration
Date: Fri, 23 Feb 2018 16:23:47 +0000
Message-ID: <1519403030-21189-18-git-send-email-sudeep.holla@arm.com>
References: <1519403030-21189-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519403030-21189-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Cc: linux-hwmon@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

It's useful to know the maximum types of sensor supported by hwmon
framework. It can be used to allocate some data structures when sorting
the monitors based on their type.

This will be used by scmi hwmon support.

Cc: linux-hwmon@vger.kernel.org
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 include/linux/hwmon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index ceb751987c40..e5fd2707b6df 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -29,6 +29,7 @@ enum hwmon_sensor_types {
 	hwmon_humidity,
 	hwmon_fan,
 	hwmon_pwm,
+	hwmon_max,
 };
 
 enum hwmon_chip_attributes {
-- 
2.7.4
