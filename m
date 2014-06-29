From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/4] brcmfmac: Fix some wrong register defines
Date: Sun, 29 Jun 2014 16:17:00 +0200
Message-ID: <1404051421-24377-4-git-send-email-hdegoede@redhat.com>
References: <1404051421-24377-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORB2V7YCOQKGQENGXWEBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1404051421-24377-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/brcm80211/brcmfmac/sdio_host.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/sdio_host.h b/drivers/net/wireless/brcm80211/brcmfmac/sdio_host.h
index 3deab79..6e6a366 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/sdio_host.h
+++ b/drivers/net/wireless/brcm80211/brcmfmac/sdio_host.h
@@ -72,12 +72,12 @@
 #define SBSDIO_SPROM_DATA_HIGH		0x10003
 /* sprom indirect access addr byte 0 */
 #define SBSDIO_SPROM_ADDR_LOW		0x10004
-/* sprom indirect access addr byte 0 */
-#define SBSDIO_SPROM_ADDR_HIGH		0x10005
-/* xtal_pu (gpio) output */
-#define SBSDIO_CHIP_CTRL_DATA		0x10006
-/* xtal_pu (gpio) enable */
-#define SBSDIO_CHIP_CTRL_EN		0x10007
+/* gpio select */
+#define SBSDIO_GPIO_SELECT		0x10005
+/* gpio output */
+#define SBSDIO_GPIO_OUT			0x10006
+/* gpio enable */
+#define SBSDIO_GPIO_EN			0x10007
 /* rev < 7, watermark for sdio device */
 #define SBSDIO_WATERMARK		0x10008
 /* control busy signal generation */
-- 
2.0.0
