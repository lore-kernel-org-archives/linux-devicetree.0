From: <ludovic.desroches@atmel.com>
Subject: [PATCH 0/3] at_hdmac: dt dma bindings update
Date: Thu, 30 May 2013 18:08:20 +0200
Message-ID: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: vinod.koul@intel.com, plagnioj@jcrosoft.com, Ludovic Desroches <ludovic.desroches@atmel.com>, nicolas.ferre@atmel.com
List-Id: devicetree@vger.kernel.org

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Hi,

This set of patches update the dt dma binding for at_hdmac since we need one
more parameter. In order to keep backward compatibility, an existing cell will
be used to add this parameter. Since the content of that cell will become a
magic value due to the concatenation of the two parameters, it is time to
use macros.

Regards

Ludovic Desroches (3):
  ARM: at91: dt: add header to define at_hdmac configuration
  ARM: at91: dt: switch DMA DT bindings to pre-processor
  at_hdmac: add FIFO configuration parameter to DMA DT binding

 .../devicetree/bindings/dma/atmel-dma.txt          |  7 ++++--
 arch/arm/boot/dts/at91sam9g45.dtsi                 |  5 ++--
 arch/arm/boot/dts/at91sam9n12.dtsi                 | 11 +++++----
 arch/arm/boot/dts/at91sam9x5.dtsi                  | 17 +++++++-------
 arch/arm/boot/dts/sama5d3.dtsi                     | 19 +++++++--------
 drivers/dma/at_hdmac.c                             | 25 ++++++++++++++++----
 include/dt-bindings/dma/at91.h                     | 27 ++++++++++++++++++++++
 7 files changed, 81 insertions(+), 30 deletions(-)
 create mode 100644 include/dt-bindings/dma/at91.h

-- 
1.7.11.3
