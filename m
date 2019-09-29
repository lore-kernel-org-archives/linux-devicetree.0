From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/11] of: dma-ranges fixes and improvements
Date: Sun, 29 Sep 2019 13:16:20 +0200
Message-ID: <CAK8P3a0oct0EOMi5t4BmpgdkiBM+LjC+2pTST4hcvNCa3MGLmw@mail.gmail.com>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Frank Rowand <frowand.list@gmail.com>, linux-pci <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Simon Horman <horms+renesas@verge.net.au>, Robin Murphy <robin.murphy@arm.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Stefan Wahren <wahrenst@gmx.net>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 2:24 AM Rob Herring <robh@kernel.org> wrote:
>
> This series fixes several issues related to 'dma-ranges'. Primarily,
> 'dma-ranges' in a PCI bridge node does correctly set dma masks for PCI
> devices not described in the DT. A common case needing dma-ranges is a
> 32-bit PCIe bridge on a 64-bit system. This affects several platforms
> including Broadcom, NXP, Renesas, and Arm Juno. There's been several
> attempts to fix these issues, most recently earlier this week[1].
>
> In the process, I found several bugs in the address translation. It
> appears that things have happened to work as various DTs happen to use
> 1:1 addresses.
>
> First 3 patches are just some clean-up. The 4th patch adds a unittest
> exhibiting the issues. Patches 5-9 rework how of_dma_configure() works
> making it work on either a struct device child node or a struct
> device_node parent node so that it works on bus leaf nodes like PCI
> bridges. Patches 10 and 11 fix 2 issues with address translation for
> dma-ranges.
>
> My testing on this has been with QEMU virt machine hacked up to set PCI
> dma-ranges and the unittest. Nicolas reports this series resolves the
> issues on Rpi4 and NXP Layerscape platforms.

I've only looked briefly, but this all seems reasonable. Adding Christoph
to Cc here to draw his attention to it as he's done a lot of reworks on
the dma-mapping interfaces recently.

On a semi-related note, Thierry asked about one aspect of the dma-ranges
property recently, which is the behavior of dma_set_mask() and related
functions when a driver sets a mask that is larger than the memory
area in the bus-ranges but smaller than the available physical RAM.
As I understood Thierry's problem and the current code, the generic
dma_set_mask() will either reject the new mask entirely or override
the mask set by of_dma_configure, but it fails to set a correct mask
within the limitations of the parent bus in this case.

We had discussed and proposed patches for this in the past, but
it seems that never got anywhere. Maybe now that a number of
people have looked at this logic, we can figure it out for good.

        Arnd

> [1] https://lore.kernel.org/linux-arm-kernel/20190924181244.7159-1-nsaenzjulienne@suse.de/
>
> Rob Herring (5):
>   of: Remove unused of_find_matching_node_by_address()
>   of: Make of_dma_get_range() private
>   of/unittest: Add dma-ranges address translation tests
>   of/address: Translate 'dma-ranges' for parent nodes missing
>     'dma-ranges'
>   of/address: Fix of_pci_range_parser_one translation of DMA addresses
>
> Robin Murphy (6):
>   of: address: Report of_dma_get_range() errors meaningfully
>   of: Ratify of_dma_configure() interface
>   of/address: Introduce of_get_next_dma_parent() helper
>   of: address: Follow DMA parent for "dma-coherent"
>   of: Factor out #{addr,size}-cells parsing
>   of: Make of_dma_get_range() work on bus nodes
>
>  drivers/of/address.c                        | 83 +++++++++----------
>  drivers/of/base.c                           | 32 ++++---
>  drivers/of/device.c                         | 12 ++-
>  drivers/of/of_private.h                     | 14 ++++
>  drivers/of/unittest-data/testcases.dts      |  1 +
>  drivers/of/unittest-data/tests-address.dtsi | 48 +++++++++++
>  drivers/of/unittest.c                       | 92 +++++++++++++++++++++
>  include/linux/of_address.h                  | 21 +----
>  include/linux/of_device.h                   |  4 +-
>  9 files changed, 227 insertions(+), 80 deletions(-)
>  create mode 100644 drivers/of/unittest-data/tests-address.dtsi
>
> --
> 2.20.1
