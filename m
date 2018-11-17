Return-Path: <SRS0=0T4O=N4=gmail.com=chunkeey@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: dmaengine: dw-dmac: add protection control property
Date: Sat, 17 Nov 2018 17:14:08 +0100
Message-ID: <1562690.ThRoKvICtG@debian64>
In-Reply-To: <20181117153247.GA21745@bogus>
References: <a8cd42ce348ed6a21580815f25ab1590aaa6acf3.1541866004.git.chunkeey@gmail.com> <20181117153247.GA21745@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <vireshk@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Saturday, November 17, 2018 4:32:47 PM CET Rob Herring wrote:
> On Sat, 10 Nov 2018 17:28:30 +0100, Christian Lamparter wrote:
> > This patch for the DesignWare AHB Central
> > Direct Memory Access Controller adds the dma
> > protection control property:
> > 	"snps,dma-protection-control"
> > 
> > as well as the properties specific values defines into
> > a new include file: include/dt-bindings/dma/dw-dmac.h
> > 
> > Note: The protection control signals are one-to-one
> > mapped to the AHB HPROT[1:3] signals for this controller.
> > The HPROT0 (Data Access) is always hardwired to 1.
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > ---
> > I've included the "Reviewed-by" from the v1 in this patch for now.
> > But if a new issue comes up regarding the updates, please let me know.
> > ---
> >  Documentation/devicetree/bindings/dma/snps-dma.txt |  4 ++++
> >  MAINTAINERS                                        |  4 +++-
> >  include/dt-bindings/dma/dw-dmac.h                  | 14 ++++++++++++++
> >  3 files changed, 21 insertions(+), 1 deletion(-)
> >  create mode 100644 include/dt-bindings/dma/dw-dmac.h
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
Ok, thanks.

I guess I did make the mistake of sending out v3 too soo it seems :).
Anyway, I'll add this tag real quick and sent out v4... As well as
update the v3 series status on patchwork. 

Best Regards,
Christian
