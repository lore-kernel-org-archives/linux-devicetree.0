From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PULL REQUEST] ARM: kirkwood: fdt: convert kirkwood init funcs
 to fdt
Date: Fri, 2 Mar 2012 12:52:33 -0500
Message-ID: <20120302175233.GM11986@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1330709314.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1330709314.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following changes since commit 759a45185ac0e4dfaf8bbfcb390ec73aca4b7a34:

  ARM: kirkwood: convert uart0 to devicetree. (2012-02-27 16:21:44 +0000)

are available in the git repository at:
  git://git.infradead.org/users/jcooper/linux-kirkwood.git kirkwood_dt_test

Jason Cooper (5):
      ARM: kirkwood: covert orion-spi to fdt.
      ARM: kirkwood: move var setting to correct location.
      ARM: kirkwood: fdt: absorb kirkwood_init()
      ARM: kirkwood: convert rtc-mv to fdt.
      ARM: kirkwood: convert orion-wdt to fdt.

 arch/arm/boot/dts/kirkwood-dreamplug.dts |   34 +++++++++++++++
 arch/arm/boot/dts/kirkwood.dtsi          |   12 +++++
 arch/arm/mach-kirkwood/board-dt.c        |   67 +++++++++++------------------
 arch/arm/mach-kirkwood/common.c          |   21 +++++++--
 arch/arm/mach-kirkwood/common.h          |    6 +++
 drivers/rtc/rtc-mv.c                     |    7 +++
 drivers/spi/spi-orion.c                  |   37 +++++++++++++++--
 drivers/watchdog/orion_wdt.c             |   48 ++++++++++++++++-----
 8 files changed, 170 insertions(+), 62 deletions(-)
