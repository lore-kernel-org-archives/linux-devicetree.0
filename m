From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH 02/11] multi_v7_defconfig: Make rockchip mac phy built-in
Date: Fri, 23 Jun 2017 12:42:00 +0800
Message-ID: <1498192929-7519-3-git-send-email-david.wu@rock-chips.com>
References: <1498192929-7519-1-git-send-email-david.wu@rock-chips.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1498192929-7519-1-git-send-email-david.wu@rock-chips.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, olof@lixom.net, linux@armlinux.org.uk, arnd@arndb.de
Cc: andrew@lunn.ch, f.fainelli@gmail.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, huangtao@rock-chips.com, hwg@rock-chips.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Enable the rockchip mac phy for multi_v7_defconfig builds

Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2685e03..fc1986c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -267,6 +267,7 @@ CONFIG_ICPLUS_PHY=y
 CONFIG_REALTEK_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_FIXED_PHY=y
+CONFIG_ROCKCHIP_MAC_PHY=y
 CONFIG_USB_PEGASUS=y
 CONFIG_USB_RTL8152=m
 CONFIG_USB_USBNET=y
-- 
1.9.1
