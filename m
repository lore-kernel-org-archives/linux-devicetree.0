From: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 4/6] rtc: omap: depend on am33xx
Date: Wed, 25 Jul 2012 11:42:25 +0530
Message-ID: <3a154df108ee961c1017c1733092098f1fe8120e.1343191280.git.afzal@ti.com>
References: <cover.1343191280.git.afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <cover.1343191280.git.afzal-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, khilman-l0cyMroinI0@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

rtc-omap driver can be reused for AM33xx RTC.
Provide dependency in Kconfig.

Signed-off-by: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>
---

v2:
 Modify Kconfig help, resolve checkpatch warning

 drivers/rtc/Kconfig |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 08cbdb9..eada3db 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -729,11 +729,13 @@ config RTC_DRV_IMXDI
 
 config RTC_DRV_OMAP
 	tristate "TI OMAP1"
-	depends on ARCH_OMAP15XX || ARCH_OMAP16XX || ARCH_OMAP730 || ARCH_DAVINCI_DA8XX
+	depends on ARCH_OMAP15XX || ARCH_OMAP16XX || ARCH_OMAP730 || ARCH_DAVINCI_DA8XX || SOC_AM33XX
 	help
-	  Say "yes" here to support the real time clock on TI OMAP1 and
-	  DA8xx/OMAP-L13x chips.  This driver can also be built as a
-	  module called rtc-omap.
+	  Say "yes" here to support the on chip real time clock
+	  present on TI OMAP1, AM33xx and DA8xx/OMAP-L13x.
+
+	  This driver can also be built as a module, if so, module
+	  will be called rtc-omap.
 
 config HAVE_S3C_RTC
 	bool
-- 
1.7.1
