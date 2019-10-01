From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: Add of_get_memory_prop()
Date: Tue, 01 Oct 2019 17:09:01 -0500
Message-ID: <5d93ce80.1c69fb81.4acf3.4716@mx.google.com>
References: <20190918184656.7633-1-rananta@codeaurora.org>
 <CAL_JsqJ2WeW0JHSHZuvo9bbc7JSFBr_qCuOp97i=b6Q+OPY7Cg@mail.gmail.com>
 <19d727bbfce08e59294920ba8097be7a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19d727bbfce08e59294920ba8097be7a@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rananta@codeaurora.org
Cc: Frank Rowand <frowand.list@gmail.com>, Trilok Soni <tsoni@codeaurora.org>, Android Kernel Team <kernel-team@android.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 03:32:14PM -0700, rananta@codeaurora.org wrote:
> On 2019-09-18 13:13, Rob Herring wrote:
> > On Wed, Sep 18, 2019 at 1:47 PM Raghavendra Rao Ananta
> > <rananta@codeaurora.org> wrote:
> > > 
> > > On some embedded systems, the '/memory' dt-property gets updated
> > > by the bootloader (for example, the DDR configuration) and then
> > > gets passed onto the kernel. The device drivers may have to read
> > > the properties at runtime to make decisions. Hence, add
> > > of_get_memory_prop() for the device drivers to query the requested
> > 
> > Function name doesn't match. Device drivers don't need to access the
> > FDT.
> > 
> > > properties.
> > > 
> > > Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
> > > ---
> > >  drivers/of/fdt.c       | 27 +++++++++++++++++++++++++++
> > >  include/linux/of_fdt.h |  1 +
> > >  2 files changed, 28 insertions(+)
> > 
> > We don't add kernel api's without users.
> > 
> > > 
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index 223d617ecfe1..925cf2852433 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -79,6 +79,33 @@ void __init of_fdt_limit_memory(int limit)
> > >         }
> > >  }
> > > 
> > > +/**
> > > + * of_fdt_get_memory_prop - Return the requested property from the
> > > /memory node
> > > + *
> > > + * On match, returns a non-zero positive value which represents the
> > > property
> > > + * value. Otherwise returns -ENOENT.
> > > + */
> > > +int of_fdt_get_memory_prop(const char *pname)
> > > +{
> > > +       int memory;
> > > +       int len;
> > > +       fdt32_t *prop = NULL;
> > > +
> > > +       if (!pname)
> > > +               return -EINVAL;
> > > +
> > > +       memory = fdt_path_offset(initial_boot_params, "/memory");
> > 
> > Memory nodes should have a unit-address, so this won't work frequently.
> Sorry, can you please elaborate more on this? What do you mean by
> unit-address and working frequently?

A memory node is typically going to be something like: /memory@80000000. 
So your function will not work for any of those cases. And just 
'/memory' generates a dtc warning.

Rob
