From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH 2/2] of/platform: Disable generic device linking code for PowerPC
Date: Tue, 6 Aug 2019 15:04:01 -0700
Message-ID: <CAGETcx8+EETv6nSu+BEBStKvbmBs+tZZgo1u_Pw8SNu+7Urq1Q@mail.gmail.com>
References: <20190806192654.138605-1-saravanak@google.com> <20190806192654.138605-2-saravanak@google.com>
 <CAL_Jsq+BwHSj1XUNp_eY362XnNoOqVTNHqAkvnbgece8ZQE3Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+BwHSj1XUNp_eY362XnNoOqVTNHqAkvnbgece8ZQE3Qw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Android Kernel Team <kernel-team@android.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 2:27 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Aug 6, 2019 at 1:27 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > PowerPC platforms don't use the generic of/platform code to populate the
> > devices from DT.
>
> Yes, they do.

No they don't. My wording could be better, but they don't use
of_platform_default_populate_init()
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/platform.c#n511

>
> > Therefore the generic device linking code is never used
> > in PowerPC.  Compile it out to avoid warning about unused functions.
>
> I'd prefer this get disabled on PPC using 'if (IS_ENABLED(CONFIG_PPC))
> return' rather than #ifdefs.

I'm just moving the existing ifndef some lines above. I don't want to
go change existing #ifndef in this patch. Maybe that should be a
separate patch series that goes and fixes all such code in drivers/of/
or driver/

-Saravana

>
> >
> > If a specific PowerPC platform wants to use this code in the future,
> > bringing this back for PowerPC would be trivial. We'll just need to export
> > of_link_to_suppliers() and then let the machine specific files do the
> > linking as they populate the devices from DT.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/of/platform.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index f68de5c4aeff..a2a4e4b79d43 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -506,6 +506,7 @@ int of_platform_default_populate(struct device_node *root,
> >  }
> >  EXPORT_SYMBOL_GPL(of_platform_default_populate);
> >
> > +#ifndef CONFIG_PPC
> >  static bool of_link_is_valid(struct device_node *con, struct device_node *sup)
> >  {
> >         of_node_get(sup);
> > @@ -683,7 +684,6 @@ static int of_link_to_suppliers(struct device *dev)
> >         return __of_link_to_suppliers(dev, dev->of_node);
> >  }
> >
> > -#ifndef CONFIG_PPC
> >  static const struct of_device_id reserved_mem_matches[] = {
> >         { .compatible = "qcom,rmtfs-mem" },
> >         { .compatible = "qcom,cmd-db" },
> > --
> > 2.22.0.770.g0f2c4a37fd-goog
> >
