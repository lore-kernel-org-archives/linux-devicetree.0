From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH v3 0/2] Expose DMA_MEMORY_EXCLUSIVE through
 shared-dma-pool
Date: Tue, 10 Nov 2015 17:18:25 +0100
Message-ID: <564218D1.2030008@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The shared-dma-pool dt node only exposes exclusive memory, but in order to export
non-exclusive coherent memory, add the no-exclusive property and document it.

v3: use correct of_get_flat_dt_prop helper
v2: simplify patch by looking for DT attribute in callback

Neil Armstrong (2):
  base: dma-coherent: Add DT property for non exclusive shared-dma-pool
  devicetree: reserved-memory: document the optional no-exclusive parameter

 .../devicetree/bindings/reserved-memory/reserved-memory.txt         | 3 +++
 drivers/base/dma-coherent.c                                         | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
