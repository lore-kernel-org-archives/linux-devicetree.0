From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] mfd: add MT6351 regulator driver
Date: Wed, 9 Aug 2017 10:31:02 +0800
Message-ID: <1502245865-11403-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds MT6351 regulator driver which is included in MT6797.
Also might be used in other chips.


Jimmy-YJ.Huang (3):
  dt-bindings: mfd: Add bindings for the MediaTek MT6351 PMIC
  regulator: mt6351: Add support for MT6351 regulator
  mfd: mt6397: Add MT6351 support into MT6397 driver

 Documentation/devicetree/bindings/mfd/mt6397.txt   |   10 +-
 .../bindings/regulator/mt6351-regulator.txt        |  347 +++++++
 drivers/mfd/mt6397-core.c                          |   18 +
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mt6351-regulator.c               |  458 +++++++++
 include/linux/mfd/mt6351/core.h                    |   80 ++
 include/linux/mfd/mt6351/registers.h               | 1028 ++++++++++++++++++++
 include/linux/regulator/mt6351-regulator.h         |   66 ++
 9 files changed, 2013 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6351-regulator.txt
 create mode 100644 drivers/regulator/mt6351-regulator.c
 create mode 100644 include/linux/mfd/mt6351/core.h
 create mode 100644 include/linux/mfd/mt6351/registers.h
 create mode 100644 include/linux/regulator/mt6351-regulator.h

--
1.7.9.5
