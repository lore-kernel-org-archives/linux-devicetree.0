From: <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Subject: [PATCH v2 14/15] [media] cxd2880: Add all Kconfig files for the driver
Date: Fri, 14 Apr 2017 11:47:03 +0900
Message-ID: <20170414024703.18388-1-Yasunari.Takiguchi@sony.com>
References: <20170414015043.16731-1-Yasunari.Takiguchi@sony.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170414015043.16731-1-Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>, Masayuki Yamamoto <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>, Hideki Nozawa <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>, Kota Yonezawa <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>, Toshihiko Matsumoto <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>, Satoshi Watanabe <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>

This is the Kconfig files of driver for
the Sony CXD2880 DVB-T2/T tuner + demodulator driver.

Signed-off-by: Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Masayuki Yamamoto <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Hideki Nozawa <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Kota Yonezawa <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Toshihiko Matsumoto <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>
Signed-off-by: Satoshi Watanabe <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>
---
 drivers/media/dvb-frontends/Kconfig         |  2 ++
 drivers/media/dvb-frontends/cxd2880/Kconfig |  6 ++++++
 drivers/media/spi/Kconfig                   | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 drivers/media/dvb-frontends/cxd2880/Kconfig

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index e8c6554a47aa..3a3a7129a150 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -518,6 +518,8 @@ config DVB_GP8PSK_FE
 	depends on DVB_CORE
 	default DVB_USB_GP8PSK
 
+source "drivers/media/dvb-frontends/cxd2880/Kconfig"
+
 comment "DVB-C (cable) frontends"
 	depends on DVB_CORE
 
diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media/dvb-frontends/cxd2880/Kconfig
new file mode 100644
index 000000000000..36b8b6f7c4f7
--- /dev/null
+++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
@@ -0,0 +1,6 @@
+config DVB_CXD2880
+	tristate "Sony CXD2880 DVB-T2/T tuner + demodulator"
+	depends on DVB_CORE && SPI
+	default m if !MEDIA_SUBDRV_AUTOSELECT
+	help
+	  Say Y when you want to support this frontend.
\ No newline at end of file
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index a21f5a39a440..b07ac86fc53c 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -12,3 +12,17 @@ config VIDEO_GS1662
 endmenu
 
 endif
+
+if SPI
+menu "Media SPI Adapters"
+
+config CXD2880_SPI_DRV
+	tristate "Sony CXD2880 SPI support"
+	depends on DVB_CORE && SPI
+	default m if !MEDIA_SUBDRV_AUTOSELECT
+	help
+	  Choose if you would like to have SPI interface support for Sony CXD2880.
+
+endmenu
+
+endif
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
