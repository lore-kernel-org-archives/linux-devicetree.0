From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] gpio/MIPS/OCTEON: Add GPIO support for OCTEON.
Date: Thu, 12 Apr 2012 17:10:18 -0700
Message-ID: <1334275820-7791-1-git-send-email-ddaney.cavm@gmail.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

There are two patches needed to add OCTEON GPIO support:

1) Select ARCH_REQUIRE_GPIOLIB.  This allows standard I2C GPIO
expanders to function, as well as being a prerequisite for the driver
for the on-chip pins.

2) The on-chip pin driver.

I'm not sure the best way to merge these, they are part MIPS and part
GPIO.  Via either maintainer is fine by me.

Thanks,


David Daney (2):
  MIPS: OCTEON: Select ARCH_REQUIRE_GPIOLIB
  gpio/MIPS/OCTEON: Add a driver for OCTEON's on-chip GPIO pins.

 arch/mips/Kconfig                               |    1 +
 arch/mips/include/asm/mach-cavium-octeon/gpio.h |   21 +++
 drivers/gpio/Kconfig                            |    8 +
 drivers/gpio/Makefile                           |    1 +
 drivers/gpio/gpio-octeon.c                      |  166 +++++++++++++++++++++++
 5 files changed, 197 insertions(+), 0 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-cavium-octeon/gpio.h
 create mode 100644 drivers/gpio/gpio-octeon.c

-- 
1.7.2.3
