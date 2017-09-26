From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 00/10] update MT7623 and MT2701 dts
Date: Tue, 26 Sep 2017 10:02:51 +0800
Message-ID: <cover.1506390597.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

This patch series adds/corrects some device nodes for both MT7623 and MT2701.

changes since v2:
- move non-common part and non-display related nodes to different patches.
- remove unused wdma node.
- add display related nodes for MT2701.

changes since v1:
- rebase to v4.14.
- sort nodes in alphabetical order.

Ryder Lee (7):
  arm: dts: mediatek: update audio node for mt2701 and mt7623
  arm: dts: mt7623: update pio, usb and crypto nodes
  arm: dts: mt7623: add subsystem clock controller nodes
  arm: dts: mt7623: add iommmu and jpecdec nodes
  arm: dts: mt7623: add display subsystem related nodes
  arm: dts: mt7623: enable bananapi-r2 display function
  arm: dts: mt7623: add PCIe related nodes

Weiqing Kong (2):
  arm: dts: mt2701: add pwm backlight device node
  arm: dts: mt2701: enable display pwm backlight

YT Shen (1):
  arm: dts: mt2701: add display subsystem related nodes

 arch/arm/boot/dts/mt2701-evb.dts              |  23 ++
 arch/arm/boot/dts/mt2701.dtsi                 |  88 ++++++-
 arch/arm/boot/dts/mt7623.dtsi                 | 364 ++++++++++++++++++++++++--
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  71 ++++-
 include/dt-bindings/pinctrl/mt7623-pinfunc.h  |  12 +
 5 files changed, 529 insertions(+), 29 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
