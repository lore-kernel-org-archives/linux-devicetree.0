From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv5 0/4] Synopsys DesignWare APB GPIO
Date: Thu,  5 Jan 2012 01:23:35 +0000
Message-ID: <1325726619-31796-1-git-send-email-jamie@jamieiles.com>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

No major changes since v4 apart from a bug in patch 2 that didn't handle
sparsely allocated banks very well (resulting in a potential buffer
overrun) and the higher banks are the ones that are a pig to get to.

Jamie Iles (4):
  of: document common interrupt controller details
  gpio: add a driver for the Synopsys DesignWare APB GPIO block
  gpio: dwapb: add support for GPIO interrupts
  ARM: picoxcell: use new Synopsys Designware GPIO binding

 Documentation/devicetree/bindings/arm/gic.txt      |    8 +-
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   57 ++++
 Documentation/devicetree/bindings/interrupts.txt   |   17 +
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi             |   19 +-
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi             |   28 +-
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-dwapb.c                          |  351 ++++++++++++++++++++
 8 files changed, 456 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/interrupts.txt
 create mode 100644 drivers/gpio/gpio-dwapb.c

-- 
1.7.5.4
