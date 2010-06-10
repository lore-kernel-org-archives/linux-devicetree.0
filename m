From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v2 0/5] Generalize OF gpio support code
Date: Wed, 09 Jun 2010 23:40:41 -0600
Message-ID: <20100610053439.16716.53944.stgit@angua>
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
To: dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Cc: bgat-uPd5UNENI//N9NzbbXoYwQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series makes all gpio drivers usable from the OF support apis by
automatically registering a default OF translator when the of_node
pointer is assigned.  These patches are heavily based on the work that
Anton did earlier, but I didn't add the notifiers infrastructure and
the OF data now lives directly inside the core gpio_chip structure so
that fewer gymnastics are needed to get at it.

These patches are currently sitting in the following branch:

git://git.secretlab.ca/git/linux-2.6 next-devicetree

---

Anton Vorontsov (3):
      gpiolib: cosmetic improvements for error handling in gpiochip_add()
      of/gpio: Kill of_gpio_chip and add members directly to gpio_chip
      of/gpio: add default of_xlate function if device has a node pointer

Grant Likely (2):
      of/gpio: stop using device_node data pointer to find gpio_chip
      of/device: Add OF style matching helper function


 arch/microblaze/kernel/reset.c                 |   12 ++-
 arch/powerpc/platforms/52xx/mpc52xx_gpio.c     |   30 ++++----
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |   29 ++++----
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |   34 ++-------
 arch/powerpc/platforms/86xx/gef_gpio.c         |   24 +++----
 arch/powerpc/sysdev/cpm1.c                     |   10 +--
 arch/powerpc/sysdev/cpm_common.c               |    5 -
 arch/powerpc/sysdev/mpc8xxx_gpio.c             |    5 -
 arch/powerpc/sysdev/ppc4xx_gpio.c              |    5 -
 arch/powerpc/sysdev/qe_lib/gpio.c              |   31 ++++-----
 arch/powerpc/sysdev/simple_gpio.c              |    5 -
 drivers/gpio/gpiolib.c                         |   55 ++++++++++++++-
 drivers/gpio/xilinx_gpio.c                     |   15 ++--
 drivers/of/device.c                            |    2 -
 drivers/of/gpio.c                              |   86 +++++++++++++++---------
 include/asm-generic/gpio.h                     |   15 ++++
 include/linux/of_device.h                      |   19 +++++
 include/linux/of_gpio.h                        |   35 +++-------
 18 files changed, 226 insertions(+), 191 deletions(-)
