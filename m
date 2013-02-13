From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: dma: protect list write operation by spin_lock
Date: Wed, 13 Feb 2013 02:48:34 -0800
Message-ID: <20130213104834.GE17659@intel.com>
References: <1359386694-20548-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <51069EA0.4040004@gmail.com> <20130128160757.GA6396@intel.com>
 <5107EC8D.5070001@gmail.com> <20130212172027.GT3789@intel.com>
 <1360741709.14581.20.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360741709.14581.20.camel@smile>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Andy Shevchenko <andriy.shevchenko-b5Z7lJ3WibVrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2013 at 09:48:29AM +0200, Andy Shevchenko wrote:
> On Tue, 2013-02-12 at 09:20 -0800, Vinod Koul wrote: 
> > On Tue, Jan 29, 2013 at 09:36:45AM -0600, Rob Herring wrote:
> > > >> Vinod, it's probably better to move drivers/of/dma.c to drivers/dma.
> > > >> That's been the direction we've been taking with new OF binding code. I
> > > >> must have missed that in the review.
> > > > ok, do you have any patches on your tree for this if not then I can update my tree
> > > > for this change and then we can apply changes thru slave-dma tree.
> > > 
> > > No, I don't have one prepared.
> > Okay, I have committed and pushed drivers/of/dma.c to be moved to
> > drivers/dma/of-dma.c
> What about Kconfig(s) / Makefile(s)?

Here is the complete patch in my tree
----
From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Tue, 12 Feb 2013 09:15:02 -0800
Subject: [PATCH] dmaengine: move drivers/of/dma.c -> drivers/dma/of-dma.c

as requested by Rob

Suggested-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/Kconfig                |    4 ++++
 drivers/dma/Makefile               |    2 ++
 drivers/{of/dma.c => dma/of-dma.c} |    0
 drivers/of/Makefile                |    2 +-
 4 files changed, 7 insertions(+), 1 deletions(-)
 rename drivers/{of/dma.c => dma/of-dma.c} (100%)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 0b408bb..e92b5f0 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -325,6 +325,10 @@ config DMA_ENGINE
 config DMA_VIRTUAL_CHANNELS
 	tristate
 
+config DMA_OF
+	def_bool y
+	depends on OF
+
 comment "DMA Clients"
 	depends on DMA_ENGINE
 
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 7428fea..c1ed644 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -3,6 +3,8 @@ ccflags-$(CONFIG_DMADEVICES_VDEBUG) += -DVERBOSE_DEBUG
 
 obj-$(CONFIG_DMA_ENGINE) += dmaengine.o
 obj-$(CONFIG_DMA_VIRTUAL_CHANNELS) += virt-dma.o
+obj-$(CONFIG_DMA_OF) += of-dma.o
+
 obj-$(CONFIG_NET_DMA) += iovlock.o
 obj-$(CONFIG_INTEL_MID_DMAC) += intel_mid_dma.o
 obj-$(CONFIG_DMATEST) += dmatest.o
diff --git a/drivers/of/dma.c b/drivers/dma/of-dma.c
similarity index 100%
rename from drivers/of/dma.c
rename to drivers/dma/of-dma.c
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index eafa107..e027f44 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -1,4 +1,4 @@
-obj-y = base.o dma.o
+obj-y = base.o
 obj-$(CONFIG_OF_FLATTREE) += fdt.o
 obj-$(CONFIG_OF_PROMTREE) += pdt.o
 obj-$(CONFIG_OF_ADDRESS)  += address.o
-- 
1.7.0.4


> 
> And I think the of_dma.c looks better as a name of the file.
we have both a-b.c and a_b.c is the drivers/dma...

--
~Vinod
