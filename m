From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC 0/3] Introduce of_probe_platform_driver()
Date: Thu, 16 Dec 2010 18:13:56 +0100
Message-ID: <1292519639-21859-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

First, I noted a section mismatch in the mpc52xx_psc_spi-driver which tried to
have its probe in __init. Then, I noted that the mpc512x_psc_spi-driver was in
the __devinit-section, not in __init. I finally saw that there is no
of-equivalent to platform_driver_probe() and tried to implement one.

This is the outcome which seems to work on a MPC5121-board. I have my
spi-device and the sysfs does not show bind/unbind-files.

I can't yet tell why, but the approach looks a bit clumsy. Probably there is
some condition I have missed so far. It should work as a first RFC, however.
Release early, right? :)

All the best,

   Wolfram

Wolfram Sang (3):
  of: platform: introduce of_probe_platform_driver()
  spi: mpc52xx_psc_spi: fix section mismatch warning
  spi: mpc512x_psc_spi: move init-routines to __init

 drivers/of/platform.c         |   30 +++++++++++++++++++++++++++---
 drivers/spi/mpc512x_psc_spi.c |   10 +++++-----
 drivers/spi/mpc52xx_psc_spi.c |    4 ++--
 include/linux/of_platform.h   |    2 ++
 4 files changed, 36 insertions(+), 10 deletions(-)

-- 
1.7.2.3
