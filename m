From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 7/9] ARM: multi_v7_defconfig: Enable LAN and BT for RPi 3 B+
Date: Sat, 21 Apr 2018 13:28:40 +0200
Message-ID: <1524310122-9439-8-git-send-email-stefan.wahren@i2se.com>
References: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Raspberry Pi 3 B+ has a Microchip LAN7515 (connect via USB) and
a Cypress CYW43455 (connect via UART). This patch enables the necessary
drivers.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e6b3c96..88a07d6 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -187,6 +187,8 @@ CONFIG_B53_MMAP_DRIVER=m
 CONFIG_B53_SRAB_DRIVER=m
 CONFIG_CAN_SUN4I=y
 CONFIG_BT=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_BT_MRVL=m
 CONFIG_BT_MRVL_SDIO=m
 CONFIG_CFG80211=m
@@ -280,6 +282,7 @@ CONFIG_FIXED_PHY=y
 CONFIG_ROCKCHIP_PHY=y
 CONFIG_USB_PEGASUS=y
 CONFIG_USB_RTL8152=m
+CONFIG_USB_LAN78XX=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -360,6 +363,7 @@ CONFIG_SERIAL_ST_ASC=y
 CONFIG_SERIAL_ST_ASC_CONSOLE=y
 CONFIG_SERIAL_STM32=y
 CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HVC_DRIVER=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_I2C_CHARDEV=y
-- 
2.7.4
