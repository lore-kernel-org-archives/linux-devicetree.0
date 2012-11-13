From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH v2 0/3] GPIO driver to turn power off
Date: Tue, 13 Nov 2012 16:44:42 +0100
Message-ID: <1352821485-10032-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A few of the Kirkwood systems use a GPIO line to turn the power off on
shutdown. They request the GPIO line in the board setup code,
optionally setting it as an output and driving it inactive. They then
register a function for pm_power_off. At the end of the shutdown, this
function is called. The GPIO line is configured as an output, if not
already so, and then driven active. In order to cover the use case of
edges rather then levels, triggering power off, the GPIO line is then
toggled active and later inactive. This should allow the driver to be
used by PXA which also has boards using the same scheme.

The driver code was initially developed by Jamie Lentin and extended
to cover the PXA case by Andrew Lunn.

v1 -> v2: Moved to drivers/power/reset

Andrew Lunn (2):
  ARM: Kirkwood: Convert DNSKW to use gpio-poweroff.
  ARM: Kirkwood: Convert IB62x0 to use gpio-poweroff.

Jamie Lentin (1):
  power: Add simple poweroff-gpio driver

 .../devicetree/bindings/gpio/gpio-poweroff.txt     |   22 ++++
 arch/arm/boot/dts/kirkwood-dnskw.dtsi              |    5 +
 arch/arm/boot/dts/kirkwood-ib62x0.dts              |    6 +
 arch/arm/mach-kirkwood/Kconfig                     |    4 +
 arch/arm/mach-kirkwood/board-dnskw.c               |   12 --
 arch/arm/mach-kirkwood/board-ib62x0.c              |   13 --
 drivers/power/Kconfig                              |    3 +
 drivers/power/Makefile                             |    1 +
 drivers/power/reset/Kconfig                        |   15 +++
 drivers/power/reset/Makefile                       |    1 +
 drivers/power/reset/gpio-poweroff.c                |  129 ++++++++++++++++++++
 11 files changed, 186 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-poweroff.txt
 create mode 100644 drivers/power/reset/Kconfig
 create mode 100644 drivers/power/reset/Makefile
 create mode 100644 drivers/power/reset/gpio-poweroff.c

-- 
1.7.10.4
