From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 0/8] Append several fixes and improvements in STM32 DMA
Date: Tue, 13 Mar 2018 17:41:59 +0100
Message-ID: <1520959327-25760-1-git-send-email-pierre-yves.mordret@st.com>
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
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

This patchset appends several fixes and some improvements for STM32 DMAv2.
This includes:
        * Introduce DMA features bitfield
        * Threshold manages with bitfield feature
        * Improve memory burst management
        * Improve DMA IRQ status handling
        * Fix max items per transfer to match FIFO Size
        * Properly mask irq bits to avoid overlaping
        * Fix incomplete configuration in cyclic mode
        * Fix typo and reported checkpatch warnings

---
  Version history:
    v1:
        * Initial
---

Pierre-Yves MORDRET (8):
  dt-bindings: stm32-dma: introduce DMA features bitfield
  dmaengine: stm32-dma: threshold manages with bitfield feature
  dmaengine: stm32-dma: Improve memory burst management
  dmaengine: stm32-dma: fix DMA IRQ status handling
  dmaengine: stm32-dma: fix max items per transfer
  dmaengine: stm32-dma: properly mask irq bits
  dmaengine: stm32-dma: fix incomplete configuration in cyclic mode
  dmaengine: stm32-dma: fix typo and reported checkpatch warnings

 .../devicetree/bindings/dma/stm32-dma.txt          |   6 +-
 drivers/dma/stm32-dma.c                            | 287 +++++++++++++++++----
 2 files changed, 243 insertions(+), 50 deletions(-)

-- 
2.7.4
