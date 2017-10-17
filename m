From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3 0/5] arm64: Realtek RTD1195/RTD1295 IRQ mux
Date: Tue, 17 Oct 2017 14:47:02 +0200
Message-ID: <20171017124708.6242-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bizon <bizongod-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds two IRQ muxes for the Realtek RTD1295 and RTD1195 SoCs.

The implementation is based on register offsets seen in the vendor DT,
split up into two separate nodes, as well as code from QNAP's rtk119x and
Synology's RTD1293/96 GPL code dumps.

v3 does various cleanups, renames variables, reworks unmask vs. enable/disable
and adds an isr/scpu_int_en map as well as full RTD1195 support.

More experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

v2 -> v3:
* Rebased, adding nodes to rtd129x.dtsi instead of rtd1295.dtsi
* Adopted {readl,writel}_relaxed() (Marc)
* Adopted spin_lock_irqsave() (Marc)
* Implemented RTD1195
* Implemented mapping for non-linear bits such as i2c3

v1 -> v2:
* Rebased, avoiding dependency on reset series for DT nodes
* Don't forward set_affinity to GIC (Marc)
* Added more spinlocks (Marc)
* Code cleanups
* Investigated quirk
* Fixed spinlock initialization (Andrew)

Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
Cc: 蒋丽琴 <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Andreas Färber (5):
  dt-bindings: interrupt-controller: Add Realtek RTD1295
  irqchip: Add Realtek RTD1295 mux driver
  arm64: dts: realtek: Add irq mux to RTD129x
  dt-bindings: interrupt-controller: Document RTD1195
  irqchip: rtd119x: Add RTD1195 definitions

 .../interrupt-controller/realtek,rtd119x-mux.txt   |  25 ++
 arch/arm64/boot/dts/realtek/rtd129x.dtsi           |  22 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-rtd119x-mux.c                  | 388 +++++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt
 create mode 100644 drivers/irqchip/irq-rtd119x-mux.c

-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
