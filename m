From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 0/5] support rockchip dwc3 driver
Date: Thu, 30 Jun 2016 19:12:51 +0800
Message-ID: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add support for rockchip dwc3 driver,
and add additional optional properties for specific
platforms (e.g., rockchip rk3399 platform).

William Wu (5):
  usb: dwc3: of-simple: add compatible for rockchip rk3399
  usb: dwc3: add dis_u2_freeclk_exists_quirk
  usb: dwc3: add phyif_utmi_quirk
  usb: dwc3: add dis_del_phy_power_chg_quirk
  usb: dwc3: rockchip: add devicetree bindings documentation

 Documentation/devicetree/bindings/usb/dwc3.txt     |  9 +++++
 .../devicetree/bindings/usb/rockchip,dwc3.txt      | 40 ++++++++++++++++++++++
 drivers/usb/dwc3/core.c                            | 29 ++++++++++++++++
 drivers/usb/dwc3/core.h                            | 20 +++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c                  |  1 +
 5 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt

-- 
1.9.1
