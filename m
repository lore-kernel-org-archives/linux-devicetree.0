From: santosh.shilimkar@oracle.com
Subject: Re: [PATCH v3 00/14] dmaengine/soc: Add Texas Instruments UDMA support
Date: Fri, 4 Oct 2019 09:35:29 -0700
Message-ID: <c567c1a2-2e74-3809-8e0f-4c2049ba4747@oracle.com>
References: <20191001061704.2399-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191001061704.2399-1-peter.ujfalusi@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: devicetree@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org, t-kristo@ti.com, tony@atomide.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 9/30/19 11:16 PM, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v2
> )https://patchwork.kernel.org/project/linux-dmaengine/list/?series=152609&state=*)
> - Based on 5.4-rc1
> - Support for Flow only data transfer for the glue layer
> 

> 
> Grygorii Strashko (3):
>    bindings: soc: ti: add documentation for k3 ringacc
>    soc: ti: k3: add navss ringacc driver
>    dmaengine: ti: k3-udma: Add glue layer for non DMAengine users
> 
> Peter Ujfalusi (11):
>    dmaengine: doc: Add sections for per descriptor metadata support
>    dmaengine: Add metadata_ops for dma_async_tx_descriptor
>    dmaengine: Add support for reporting DMA cached data amount
>    dmaengine: ti: Add cppi5 header for UDMA
>    dt-bindings: dma: ti: Add document for K3 UDMA
>    dmaengine: ti: New driver for K3 UDMA - split#1: defines, structs, io
>      func
>    dmaengine: ti: New driver for K3 UDMA - split#2: probe/remove, xlate
>      and filter_fn
>    dmaengine: ti: New driver for K3 UDMA - split#3: alloc/free
>      chan_resources
>    dmaengine: ti: New driver for K3 UDMA - split#4: dma_device callbacks
>      1
>    dmaengine: ti: New driver for K3 UDMA - split#5: dma_device callbacks
>      2
>    dmaengine: ti: New driver for K3 UDMA - split#6: Kconfig and Makefile
> 
>   .../devicetree/bindings/dma/ti/k3-udma.txt    |  185 +
>   .../devicetree/bindings/soc/ti/k3-ringacc.txt |   59 +
>   Documentation/driver-api/dmaengine/client.rst |   75 +
>   .../driver-api/dmaengine/provider.rst         |   46 +
>   drivers/dma/dmaengine.c                       |   73 +
>   drivers/dma/dmaengine.h                       |    8 +
>   drivers/dma/ti/Kconfig                        |   22 +
>   drivers/dma/ti/Makefile                       |    2 +
>   drivers/dma/ti/k3-udma-glue.c                 | 1225 ++++++
>   drivers/dma/ti/k3-udma-private.c              |  141 +
>   drivers/dma/ti/k3-udma.c                      | 3525 +++++++++++++++++
>   drivers/dma/ti/k3-udma.h                      |  161 +
>   drivers/soc/ti/Kconfig                        |   12 +
>   drivers/soc/ti/Makefile                       |    1 +
>   drivers/soc/ti/k3-ringacc.c                   | 1165 ++++++
>   include/dt-bindings/dma/k3-udma.h             |   10 +
>   include/linux/dma/k3-udma-glue.h              |  134 +
>   include/linux/dma/ti-cppi5.h                  | 1049 +++++
>   include/linux/dmaengine.h                     |  110 +
>   include/linux/soc/ti/k3-ringacc.h             |  245 ++
>   20 files changed, 8248 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-udma.txt
>   create mode 100644 Documentation/devicetree/bindings/soc/ti/k3-ringacc.txt
>   create mode 100644 drivers/dma/ti/k3-udma-glue.c
>   create mode 100644 drivers/dma/ti/k3-udma-private.c
>   create mode 100644 drivers/dma/ti/k3-udma.c
>   create mode 100644 drivers/dma/ti/k3-udma.h
>   create mode 100644 drivers/soc/ti/k3-ringacc.c
>   create mode 100644 include/dt-bindings/dma/k3-udma.h
>   create mode 100644 include/linux/dma/k3-udma-glue.h
>   create mode 100644 include/linux/dma/ti-cppi5.h
>   create mode 100644 include/linux/soc/ti/k3-ringacc.h
> 
Can you please split this series and post drivers/soc/* bits
separately ?  If its ready, I can apply k3-ringacc.c changes.

Regards,
Santosh
