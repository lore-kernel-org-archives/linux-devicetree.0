From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] ppc32: use the default of_platform_default_populate_init() for 83xx boards
Date: Tue, 23 Aug 2016 10:06:54 +0800
Message-ID: <1471918019-19472-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is a follow on patch series of [1]. This tries to drop the arch specific
codes of bus probe by using the common of_platform_default_populate_init()
function. I just took the 83xx boards as an example. If you guys think that
this is doable, I can change the remaining ppc boards to use this method for
the of probe.

[1] https://patchwork.ozlabs.org/patch/658531/

Kevin Hao (5):
  of/platform: introduce arch_want_default_of_probe()
  powerpc: introduce arch_enable_default_of_probe()
  of/platform: introduce a generic way to declare a platform bus
  powerpc/83xx: factor out the common codes of setup arch functions
  powerpc/83xx: enable the default of probe

 arch/powerpc/include/asm/setup.h          |  1 +
 arch/powerpc/kernel/of_platform.c         | 12 +++++++++++
 arch/powerpc/platforms/83xx/asp834x.c     |  6 +-----
 arch/powerpc/platforms/83xx/km83xx.c      |  7 +------
 arch/powerpc/platforms/83xx/misc.c        | 33 +++++++++++++++----------------
 arch/powerpc/platforms/83xx/mpc830x_rdb.c |  7 +------
 arch/powerpc/platforms/83xx/mpc831x_rdb.c |  7 +------
 arch/powerpc/platforms/83xx/mpc832x_mds.c |  7 +------
 arch/powerpc/platforms/83xx/mpc832x_rdb.c |  7 +------
 arch/powerpc/platforms/83xx/mpc834x_itx.c | 17 +---------------
 arch/powerpc/platforms/83xx/mpc834x_mds.c |  7 +------
 arch/powerpc/platforms/83xx/mpc836x_mds.c |  7 +------
 arch/powerpc/platforms/83xx/mpc836x_rdk.c |  7 +------
 arch/powerpc/platforms/83xx/mpc837x_mds.c |  7 +------
 arch/powerpc/platforms/83xx/mpc837x_rdb.c |  7 +------
 arch/powerpc/platforms/83xx/mpc83xx.h     |  2 +-
 arch/powerpc/platforms/83xx/sbc834x.c     |  7 +------
 drivers/of/platform.c                     | 21 ++++++++++++++++----
 include/asm-generic/vmlinux.lds.h         |  2 ++
 include/linux/of.h                        | 22 +++++++++++++++++++++
 include/linux/of_platform.h               |  6 ++++++
 21 files changed, 90 insertions(+), 109 deletions(-)

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
