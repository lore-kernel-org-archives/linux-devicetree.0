From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/4] dmaengine: Device Tree support for Atmel DMA
Date: Wed, 12 Oct 2011 18:57:10 +0200
Message-ID: <1318438634-11826-1-git-send-email-nicolas.ferre@atmel.com>
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
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add the device tree support to Atmel DMA controller driver:
at_hdmac.
The removal of platform data ease the conversion to device tree. It also have
the additional benefit of being simpler and cleaner.

Nicolas Ferre (4):
      dmaengine: at_hdmac: platform data move to use .id_table
      dmaengine: at_hdmac: add device tree support
      ARM: at91/dma: remove platform data from DMA controller
      ARM: at91/dma: DMA controller registering with DT support

 .../devicetree/bindings/dma/atmel-dma.txt          |   14 ++++
 arch/arm/mach-at91/at91sam9g45_devices.c           |   17 ++---
 arch/arm/mach-at91/at91sam9rl_devices.c            |    8 +--
 arch/arm/mach-at91/include/mach/at_hdmac.h         |   10 ---
 drivers/dma/at_hdmac.c                             |   76 +++++++++++++++++---
 drivers/dma/at_hdmac_regs.h                        |    8 ++
 6 files changed, 97 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/atmel-dma.txt

Best regards,
-- 
Nicolas Ferre
