From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RFC 0/5] Rework OpenFirmware GPIO handling
Date: Tue, 17 Nov 2009 18:42:21 +0300
Message-ID: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@ozlabs.org
Cc: David Brownell <dbrownell@users.sourceforge.net>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

This is an RFC serie of patches containing rework of OpenFirmware GPIO binding.

It permits very simple binding of most i2c/spi/etc. GPIO expanders (e.g.
to use pcf8574x driver I had only to patch in support for working w/o platform
data, no OF-specific code at all).

Dmitry Eremin-Solenikov (5):
      Rework OpenFirmware GPIO handling
      mcu_mpc8349emitx: port to new of gpio interface
      mpc8xxx_gpio: port to new of gpio interface
      simple_gpio: port to new of gpio interface
      qe_gpio: port to new of gpio interface

 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |   11 +++---
 arch/powerpc/sysdev/mpc8xxx_gpio.c             |    2 +-
 arch/powerpc/sysdev/qe_lib/gpio.c              |    4 +-
 arch/powerpc/sysdev/simple_gpio.c              |    2 +-
 drivers/gpio/gpiolib.c                         |    6 +++
 drivers/of/gpio.c                              |   42 ++++++++++++++++++++---
 include/asm-generic/gpio.h                     |   19 +++++++++++
 include/linux/of_gpio.h                        |   29 +++++++++-------
 8 files changed, 86 insertions(+), 29 deletions(-)
