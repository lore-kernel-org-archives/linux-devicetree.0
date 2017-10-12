From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/2] implement workaround for Socionext Synquacer pre-ITS
Date: Thu, 12 Oct 2017 19:32:45 +0100
Message-ID: <20171012183247.23679-1-ard.biesheuvel@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, daniel.thompson-vY8bQiOPoHsdnm+yROfE0A@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From patch 2/2:

  The Socionext Synquacer SoC's implementation of GICv3 has a so-called
  'pre-ITS', which maps 32-bit writes targeted at a separate window of
  size '4 << device_id_bits' onto writes to GITS_TRANSLATER with device
  ID taken from bits [device_id_bits + 1:2] of the window offset.
  Writes that target GITS_TRANSLATER directly are reported as originating
  from device ID #0.

  So add a workaround for this. Given that this breaks isolation, clear
  the IRQ_DOMAIN_FLAG_MSI_REMAP flag as well.

v3: - add patch to pull device ID space discovery forward, so we can quirk
      it as well (as we already do for Cavium)
    - use existing quirks framework as much as possible
    - get rid of ITS_WORKAROUND_xxx flag: it is no longer needed after the
      refactoring

v2: - use a 32-bit host address/size rather than a PCI address, to factor
      out the involvement of an SMMU (which the platform does have, but it
      is unclear atm if it can be exposed to the OS)
    - add msi_domain_flags member to move the quirk flag checks out of the
      common code path

Ard Biesheuvel (2):
  drivers/irqchip: gicv3: probe device ID space before quirks handling
  drivers/irqchip: gicv3: add workaround for Synquacer pre-ITS

 Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt |  4 +
 arch/arm64/Kconfig                                                    |  8 ++
 drivers/irqchip/irq-gic-v3-its.c                                      | 81 ++++++++++++++++----
 3 files changed, 78 insertions(+), 15 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
