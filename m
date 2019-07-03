From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 4/7] net: phy: realtek: Enable accessing RTL8211E extension pages
Date: Wed,  3 Jul 2019 12:37:21 -0700
Message-ID: <20190703193724.246854-4-mka@chromium.org>
References: <20190703193724.246854-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190703193724.246854-1-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The RTL8211E has extension pages, which can be accessed after
selecting a page through a custom method. Add a function to
modify bits in a register of an extension page and a helper for
selecting an ext page.

rtl8211e_modify_ext_paged() is inspired by its counterpart
phy_modify_paged().

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- assign .read/write_page handlers for RTL8211E
- use phy_select_page() and phy_restore_page(), get rid of
  rtl8211e_restore_page()
- s/rtl821e_select_ext_page/rtl8211e_select_ext_page/
- updated commit message
---
 drivers/net/phy/realtek.c | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index eb815cbe1e72..9cd6241e2a6d 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -27,6 +27,9 @@
 #define RTL821x_EXT_PAGE_SELECT			0x1e
 #define RTL821x_PAGE_SELECT			0x1f
 
+#define RTL8211E_EXT_PAGE			7
+#define RTL8211E_EPAGSR				0x1e
+
 /* RTL8211E page 5 */
 #define RTL8211E_EEE_LED_MODE1			0x05
 #define RTL8211E_EEE_LED_MODE2			0x06
@@ -58,6 +61,44 @@ static int rtl821x_write_page(struct phy_device *phydev, int page)
 	return __phy_write(phydev, RTL821x_PAGE_SELECT, page);
 }
 
+static int rtl8211e_select_ext_page(struct phy_device *phydev, int page)
+{
+	int ret, oldpage;
+
+	oldpage = phy_select_page(phydev, RTL8211E_EXT_PAGE);
+	if (oldpage < 0)
+		return oldpage;
+
+	ret = __phy_write(phydev, RTL8211E_EPAGSR, page);
+	if (ret)
+		return phy_restore_page(phydev, page, ret);
+
+	return 0;
+}
+
+static int __maybe_unused rtl8211e_modify_ext_paged(struct phy_device *phydev,
+				    int page, u32 regnum, u16 mask, u16 set)
+{
+	int ret = 0;
+	int oldpage;
+	int new;
+
+	oldpage = rtl8211e_select_ext_page(phydev, page);
+	if (oldpage < 0)
+		goto out;
+
+	ret = __phy_read(phydev, regnum);
+	if (ret < 0)
+		goto out;
+
+	new = (ret & ~mask) | set;
+	if (new != ret)
+		ret = __phy_write(phydev, regnum, new);
+
+out:
+	return phy_restore_page(phydev, oldpage, ret);
+}
+
 static int rtl8211e_disable_eee_led_mode(struct phy_device *phydev)
 {
 	int ret = 0;
@@ -87,6 +128,7 @@ static int rtl8211e_config_init(struct phy_device *phydev)
 
 	return 0;
 }
+
 static int rtl8201_ack_interrupt(struct phy_device *phydev)
 {
 	int err;
-- 
2.22.0.410.gd8fdbe21b5-goog
