From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH v3] of: fix build failure
Date: Mon, 7 Dec 2015 22:00:06 +0530
Message-ID: <20151207163006.GA3819@sudip-laptop>
References: <1449490849-1833-1-git-send-email-sudipm.mukherjee@gmail.com>
 <CAMuHMdWFaHGnT5GNsN+HEYH2RhMwocwV0GNQbnXBiTYuocZ3QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWFaHGnT5GNsN+HEYH2RhMwocwV0GNQbnXBiTYuocZ3QA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 01:32:30PM +0100, Geert Uytterhoeven wrote:
> Hi Sudip,
> 
> On Mon, Dec 7, 2015 at 1:20 PM, Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> > We are having build failure with linux-next for sparc allmodconfig with
> > the error messages:
> >
> > undefined reference to 'of_io_request_and_map'
> >
> > CONFIG_OF is defined for sparc so it is expected that we have a
> > definition of of_io_request_and_map() but of/address.c is only compiled
> > if it is !SPARC. In other words, CONFIG_OF_ADDRESS is not defined for
> > sparc so we get the build failure.
> >
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > ---
> >
<snip>
> > diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> > index 507daad..02b1265 100644
> > --- a/include/linux/of_address.h
> > +++ b/include/linux/of_address.h
> > @@ -112,8 +112,6 @@ static inline bool of_dma_is_coherent(struct device_node *np)
> >  extern int of_address_to_resource(struct device_node *dev, int index,
> >                                   struct resource *r);
> >  void __iomem *of_iomap(struct device_node *node, int index);
> > -void __iomem *of_io_request_and_map(struct device_node *device,
> > -                                       int index, const char *name);
> 
> Upon closer look, both of_address_to_resource() and of_iomap() are
> provided by drivers/of/address.c, so they should also be protected by
> #ifdef CONFIG_OF_ADDRESS instead of CONFIG_OF.
> Then the whole #ifdef CONFIG_OF section becomes empty.
> 
> >  #else
<snip>
> >
> >  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
> >  extern const __be32 *of_get_pci_address(struct device_node *dev, int bar_no,
> 
> Hence can you please move all of them to the existing
> #ifdef CONFIG_OF_ADDRESS section, and move the #include <linux/io.h>
> to the top?

oops, no. I think you have missed seeing few more places.
of_address_to_resource() of_iomap() are both defined in
arch/sparc/kernel/of_device_common.c
So if it is moved under #ifdef CONFIG_OF_ADDRESS then we again
get a build failure for duplicate definition of them.

regards
sudip
