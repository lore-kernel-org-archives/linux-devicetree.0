From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 4.14 03/37] ARM: dts: rockchip: Make
 rk3288-veyron-mickey's emmc work again
Date: Fri, 26 Jul 2019 09:42:58 -0400
Message-ID: <20190726134332.12626-3-sashal@kernel.org>
References: <20190726134332.12626-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190726134332.12626-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

[ Upstream commit 99fa066710f75f18f4d9a5bc5f6a711968a581d5 ]

When I try to boot rk3288-veyron-mickey I totally fail to make the
eMMC work.  Specifically my logs (on Chrome OS 4.19):

  mmc_host mmc1: card is non-removable.
  mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
  mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ div = 0)
  mmc1: switch to bus width 8 failed
  mmc1: switch to bus width 4 failed
  mmc1: new high speed MMC card at address 0001
  mmcblk1: mmc1:0001 HAG2e 14.7 GiB
  mmcblk1boot0: mmc1:0001 HAG2e partition 1 4.00 MiB
  mmcblk1boot1: mmc1:0001 HAG2e partition 2 4.00 MiB
  mmcblk1rpmb: mmc1:0001 HAG2e partition 3 4.00 MiB, chardev (243:0)
  mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
  mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ div = 0)
  mmc1: switch to bus width 8 failed
  mmc1: switch to bus width 4 failed
  mmc1: tried to HW reset card, got error -110
  mmcblk1: error -110 requesting status
  mmcblk1: recovery failed!
  print_req_error: I/O error, dev mmcblk1, sector 0
  ...

When I remove the '/delete-property/mmc-hs200-1_8v' then everything is
hunky dory.

That line comes from the original submission of the mickey dts
upstream, so presumably at the time the HS200 was failing and just
enumerating things as a high speed device was fine.  ...or maybe it's
just that some mickey devices work when enumerating at "high speed",
just not mine?

In any case, hs200 seems good now.  Let's turn it on.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-veyron-mickey.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index f0994f0e5774..d6ca67866bc0 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -161,10 +161,6 @@
 	};
 };
 
-&emmc {
-	/delete-property/mmc-hs200-1_8v;
-};
-
 &i2c2 {
 	status = "disabled";
 };
-- 
2.20.1
