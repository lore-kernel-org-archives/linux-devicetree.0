From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [GIT PULL]Hisilicon ARMv7 based SoCs DT updates for V4.4
Date: Mon, 12 Oct 2015 15:51:23 +0100
Message-ID: <561BC8EB.4090505@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yanhaifeng <yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Shameerali Kolothum Thodi <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sanil Kumar <sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "Liguozhu (Kenneth)" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Linuxarm <linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd, Hi Olof, Hi Kevin,

Please help to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://github.com/hisilicon/linux-hisi.git tags/hisi-soc-dt-for-4.4

for you to fetch changes up to 14317946d1da07424dec5d6be3459c393bdf578d:

  ARM: hisilicon: DT: Drop console= and earlyprintk bootargs parameter (2015-10-09 17:05:57 +0100)

----------------------------------------------------------------
ARM: DT: Hisilicon SoC DT updates for 4.4

- Drop console= and earlyprintk bootargs parameter in hisilicon armv7 dts

----------------------------------------------------------------
Wei Xu (1):
      ARM: hisilicon: DT: Drop console= and earlyprintk bootargs parameter

 arch/arm/boot/dts/hi3620-hi4511.dts  | 3 ++-
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
