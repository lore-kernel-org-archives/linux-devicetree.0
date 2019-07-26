From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 5.2 25/85] arm64: dts: rockchip: Fix USB3 Type-C on
 rk3399-sapphire
Date: Fri, 26 Jul 2019 09:38:35 -0400
Message-ID: <20190726133936.11177-25-sashal@kernel.org>
References: <20190726133936.11177-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190726133936.11177-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Vicente Bergas <vicencb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Vicente Bergas <vicencb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[ Upstream commit e1d9149e8389f1690cdd4e4056766dd26488a0fe ]

Before this patch, the Type-C port on the Sapphire board is dead.
If setting the 'regulator-always-on' property to 'vcc5v0_typec0'
then the port works for about 4 seconds at start-up. This is a
sample trace with a memory stick plugged in:
1.- The memory stick LED lights on and kernel reports:
[    4.782999] scsi 0:0:0:0: Direct-Access USB DISK PMAP PQ: 0 ANSI: 4
[    5.904580] sd 0:0:0:0: [sdb] 3913344 512-byte logical blocks: (2.00 GB/1.87 GiB)
[    5.906860] sd 0:0:0:0: [sdb] Write Protect is off
[    5.908973] sd 0:0:0:0: [sdb] Mode Sense: 23 00 00 00
[    5.909122] sd 0:0:0:0: [sdb] No Caching mode page found
[    5.911214] sd 0:0:0:0: [sdb] Assuming drive cache: write through
[    5.951585]  sdb: sdb1
[    5.954816] sd 0:0:0:0: [sdb] Attached SCSI removable disk
2.- 4 seconds later the memory stick LED lights off and kernel reports:
[    9.082822] phy phy-ff770000.syscon:usb2-phy@e450.2: charger = USB_DCP_CHARGER
3.- After a minute the kernel reports:
[   71.666761] usb 5-1: USB disconnect, device number 2
It has been checked that, although the LED is off, VBUS is present.

If, instead, the dr_mode is changed to host and the phy-supply changed
accordingly, then it works. It has only been tested in host mode.

Signed-off-by: Vicente Bergas <vicencb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
index 04623e52ac5d..1bc1579674e5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi
@@ -565,12 +565,11 @@
 	status = "okay";
 
 	u2phy0_otg: otg-port {
-		phy-supply = <&vcc5v0_typec0>;
 		status = "okay";
 	};
 
 	u2phy0_host: host-port {
-		phy-supply = <&vcc5v0_host>;
+		phy-supply = <&vcc5v0_typec0>;
 		status = "okay";
 	};
 };
@@ -620,7 +619,7 @@
 
 &usbdrd_dwc3_0 {
 	status = "okay";
-	dr_mode = "otg";
+	dr_mode = "host";
 };
 
 &usbdrd3_1 {
-- 
2.20.1
