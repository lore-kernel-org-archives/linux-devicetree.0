From: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 4/4] misc: sram: add support for configurable
 allocation order
Date: Fri, 16 Nov 2012 09:09:12 -0500
Message-ID: <20121116140912.GB20006@beef>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de>
 <1350570453-24546-5-git-send-email-p.zabel@pengutronix.de>
 <20121114191551.5E8673E0B7C@localhost>
 <1352985095.2399.184.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1352985095.2399.184.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2012 at 02:11:35PM +0100, Philipp Zabel wrote:
> Am Mittwoch, den 14.11.2012, 19:15 +0000 schrieb Grant Likely:
> > On Thu, 18 Oct 2012 16:27:33 +0200, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > From: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>
> > > 
> > > Adds support for setting the genalloc pool's minimum allocation
> > > order via DT or platform data. The allocation order is optional
> > > for both the DT property and platform data case. If it is not
> > > present then the order defaults to PAGE_SHIFT to preserve the
> > > current behavior.
> > > 
> > > Signed-off-by: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>
> > > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/misc/sram.txt |   12 ++++++++++-
> > >  drivers/misc/sram.c                             |   14 ++++++++++++-
> > >  include/linux/platform_data/sram.h              |   25 +++++++++++++++++++++++
> > >  3 files changed, 49 insertions(+), 2 deletions(-)
> > >  create mode 100644 include/linux/platform_data/sram.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/misc/sram.txt
> > > index b64136c..b1705ec 100644
> > > --- a/Documentation/devicetree/bindings/misc/sram.txt
> > > +++ b/Documentation/devicetree/bindings/misc/sram.txt
> > > @@ -8,10 +8,20 @@ Required properties:
> > >  
> > >  - reg : SRAM iomem address range
> > >  
> > > -Example:
> > > +Optional properties:
> > > +
> > > +- alloc-order : Minimum allocation order for the SRAM pool
> > 
> > Looks okay, but I think the property name is confusing. I for one had
> > no idea what 'order' would be and why it was important. I had to read
> > the code to figure it out.
> > 
> > It does raise the question though of what is this binding actually
> > for? Does it reflect a limitation of the SRAM? or of the hardware using
> > the SRAM? Or is it an optimization? How do you expect to use it?
> 
> If I am not mistaken, it is about the expected use case. A driver
> allocating many small buffers would quickly fill small SRAMs if the
> allocations were of PAGE_SIZE granularity.
> 
> I wonder if a common allocation size (say, 512 bytes instead of
> PAGE_SIZE) can be found that every prospective user could be reasonably
> happy with?

Unfortunately, no, 512 bytes doesn't work either. Although it'll meet
the needs of converting davinci to this driver, I have a driver under
development (the 6502 remoteproc) which needs finer grained allocation
of SRAM yet. I suspect people will object if the default is 32 bytes as
that bloats the genalloc bitmap for all users...however that's a size
that would work for me. Another possibility is to not do the
gen_pool_create() at probe time but rather provide an interface for client
drivers where the pool is created with the appropriate client-specific
parameters. This may be a bit messy though when the point of the pool is
to share it amongst several client drivers.

> > Assuming it is appropriate to put into the device tree, I'd suggest a
> > different name. Instead of 'order', how about 'sram-alloc-align' (in
> > address bits) or 'sram-alloc-min-size' (in bytes).
> 
> A size in bytes would be the most obvious to me, although that allows to
> enter values that are not a power of two.

I think the implication is that this isn't even a h/w characteristic of
SRAM and, as such, does not belong in a DT binding (for that reason I
don't mind seeing that it's been dropped in v6). It's unfortunate since
it's otherwise a very clean solution. I sure wish I had a "Software
Tree" I could pass in too. ;)

-Matt
