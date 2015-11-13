From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC PATCH v3 0/2] Expose DMA_MEMORY_EXCLUSIVE through
 shared-dma-pool
Date: Fri, 13 Nov 2015 14:45:28 +0100
Message-ID: <5645E978.9030603@samsung.com>
References: <564218D1.2030008@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <564218D1.2030008@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 2015-11-10 17:18, Neil Armstrong wrote:
> The shared-dma-pool dt node only exposes exclusive memory, but in order to export
> non-exclusive coherent memory, add the no-exclusive property and document it.
>
> v3: use correct of_get_flat_dt_prop helper
> v2: simplify patch by looking for DT attribute in callback
>
> Neil Armstrong (2):
>    base: dma-coherent: Add DT property for non exclusive shared-dma-pool
>    devicetree: reserved-memory: document the optional no-exclusive parameter
>
>   .../devicetree/bindings/reserved-memory/reserved-memory.txt         | 3 +++
>   drivers/base/dma-coherent.c                                         | 6 +++++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
