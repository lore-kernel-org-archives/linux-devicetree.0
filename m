From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: dma: protect list write operation by spin_lock
Date: Tue, 12 Feb 2013 09:20:27 -0800
Message-ID: <20130212172027.GT3789@intel.com>
References: <1359386694-20548-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <51069EA0.4040004@gmail.com> <20130128160757.GA6396@intel.com>
 <5107EC8D.5070001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5107EC8D.5070001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Andy Shevchenko <andriy.shevchenko-b5Z7lJ3WibVrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2013 at 09:36:45AM -0600, Rob Herring wrote:
> >> Vinod, it's probably better to move drivers/of/dma.c to drivers/dma.
> >> That's been the direction we've been taking with new OF binding code. I
> >> must have missed that in the review.
> > ok, do you have any patches on your tree for this if not then I can update my tree
> > for this change and then we can apply changes thru slave-dma tree.
> 
> No, I don't have one prepared.
Okay, I have committed and pushed drivers/of/dma.c to be moved to
drivers/dma/of-dma.c

From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Tue, 12 Feb 2013 09:15:02 -0800
Subject: [PATCH] dmaengine: move drivers/of/dma.c -> drivers/dma/of-dma.c

as requested by Rob

Suggested-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/{of/dma.c => dma/of-dma.c} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename drivers/{of/dma.c => dma/of-dma.c} (100%)

diff --git a/drivers/of/dma.c b/drivers/dma/of-dma.c
similarity index 100%
rename from drivers/of/dma.c
rename to drivers/dma/of-dma.c
--
1.7.0.4

Anyone cares to Ack?

--
~Vinod
