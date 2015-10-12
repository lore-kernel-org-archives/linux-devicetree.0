From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] Expose DMA_MEMORY_EXCLUSIVE through shared-dma-pool
Date: Mon, 12 Oct 2015 09:33:02 +0200
Message-ID: <561B622E.5000608@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

The shared-dma-pool dt node only exposes exclusive memory, but in order to export
non-exclusive coherent memory, add the no-exclusive property and document it.

Neil Armstrong (2):
  base: dma-coherent: Add DT property for non exclusive shared-dma-pool
  devicetree: reserved-memory: document the optional no-exclusive parameter

 .../bindings/reserved-memory/reserved-memory.txt   |  3 +++
 drivers/base/dma-coherent.c                        | 26 +++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
1.9.1
