From: Leo Wen <leo.wen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/2] Rockchip: Add rk1608 driver and DT-bindings
Date: Tue, 12 Dec 2017 14:28:13 +0800
Message-ID: <1513060095-29588-1-git-send-email-leo.wen@rock-chips.com>
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
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Leo Wen <leo.wen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For RK1608 driver ,you can use the v4l2-ctl command to capture frames.
Add DT bindings documentation for Rockchip RK1608.
Add the information of the maintainer.

Leo Wen (2):
  [media] Add Rockchip RK1608 driver
  dt-bindings: Document the Rockchip RK1608 bindings

 Documentation/devicetree/bindings/media/rk1608.txt |  143 +++
 MAINTAINERS                                        |    7 +
 drivers/media/spi/Makefile                         |    1 +
 drivers/media/spi/rk1608.c                         | 1165 ++++++++++++++++++++
 drivers/media/spi/rk1608.h                         |  366 ++++++
 5 files changed, 1682 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rk1608.txt
 create mode 100644 drivers/media/spi/rk1608.c
 create mode 100644 drivers/media/spi/rk1608.h

-- 
2.7.4
