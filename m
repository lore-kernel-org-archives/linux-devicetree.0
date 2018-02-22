Return-Path: <SRS0=Ex3R=FQ=pengutronix.de=p.zabel@kernel.org>
Message-ID: <1519292164.7447.1.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] vfio: platform: Add generic DT reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 22 Feb 2018 10:36:04 +0100
In-Reply-To: <CAMuHMdXSwsH82U8P3N6jXef72ZP0iiZgzkgEuKhUsqoYmpW93g@mail.gmail.com>
References: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
	 <1518539815-13774-3-git-send-email-geert+renesas@glider.be>
	 <1519231860.3405.11.camel@pengutronix.de>
	 <CAMuHMdXSwsH82U8P3N6jXef72ZP0iiZgzkgEuKhUsqoYmpW93g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, KVM list <kvm@vger.kernel.org>, OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On Thu, 2018-02-22 at 09:50 +0100, Geert Uytterhoeven wrote:
[...]
> > > @@ -127,8 +134,15 @@ static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
> > >               vdev->of_reset = vfio_platform_lookup_reset(vdev->compat,
> > >                                                       &vdev->reset_module);
> > >       }
> > > +     if (vdev->of_reset)
> > > +             return 0;
> > > +
> > > +     vdev->reset_control = __of_reset_control_get(vdev->device->of_node,
> > > +                                                  NULL, 0, false, false);
> > > +     if (!IS_ERR(vdev->reset_control))
> > > +             return 0;
> > 
> > if you assign to a local variable first here:
> > 
> >         struct reset_control *rstc;
> > 
> >          ...
> > 
> >         rstc = of_reset_control_get_exclusive(vdev->device->of_node, NULL);
> >         if (!IS_ERR(rstc)) {
> >                 vdev->reset_control = rstc;
> >                 return 0;
> >         }
> > 
> > Also, please don't use __of_reset_control_get directly.
> 
> OK, apparently I didn't read <linux/reset.h> beyond the first #else...

I don't blame you, this is missing some documentation.

> > > @@ -217,6 +233,9 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
> > >       } else if (vdev->of_reset) {
> > >               dev_info(vdev->device, "reset\n");
> > >               return vdev->of_reset(vdev);
> > > +     } else if (!IS_ERR_OR_NULL(vdev->reset_control)) {
> > > +             dev_info(vdev->device, "reset\n");
> > > +             return reset_control_reset(vdev->reset_control);
> > 
> >         } else {
> >                 if (vdev->reset_control)
> >                         dev_info(vdev->device, "reset\n");
> >                 return reset_control_reset(vdev->reset_control);
> > 
> > >       }
> 
> I'd like to keep the "else if", as that's the pattern used by the blocks above.

my bad, there's more code after this.

	} else if (vdev->reset_control) {
		dev_info(vdev->device, "reset\n");
		return reset_control_reset(vdev->reset_control);
	}

is better as it doesn't lose the warning if vdev->reset_control == NULL.
It seems I've focused too much on getting rid of the IS_ERR_OR_NULL
macro.

regards
Philipp
