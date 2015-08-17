From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/4] drm: Add support for ARM's HDLCD controller.
Date: Mon, 17 Aug 2015 16:15:47 +0100
Message-ID: <20150817151547.GA1020@e106497-lin.cambridge.arm.com>
References: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
 <1438784892-27888-3-git-send-email-Liviu.Dudau@arm.com>
 <CACvgo537C6SRfhMTNoE4cSLJukcXuKLvt1TRykynX--ybEhmaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo537C6SRfhMTNoE4cSLJukcXuKLvt1TRykynX--ybEhmaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 16, 2015 at 09:56:33AM +0100, Emil Velikov wrote:
> Hi Liviu,

Hi Emil,

>=20
> On 5 August 2015 at 15:28, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> > The HDLCD controller is a display controller that supports resoluti=
ons
> > up to 4096x4096 pixels. It is present on various development boards
> > produced by ARM Ltd and emulated by the latest Fast Models from the
> > company.
> >
> I believe there is a unofficial requirement(?) for new drm drivers to
> use atomic modesetting. Not 100% sure on this one though. The
> following drivers: tegra, msm, rcar-du, i915, and Daniel's blog [1]
> [2] cat provide some information on the topic.

I am also interested to know if this is a requirement or not.
Thanks for the pointers, I will review them again to see if I did miss
anything. I remember reading them at the beginning of the year but prob=
ably
the Christmas haze did not clear enough when I did.

>=20
> The driver seems to has has a bit of dead code guarded by
> HDLCD_*_UNDERRUN. Perhaps these macros should become build or runtime
> switch(es) ?

There is a comment in hdlcd_drv.h explaining what HDLCD_SHOW_UNDERRUN c=
an
be used for. As for HDLCD_COUNT_BUFFERUNDERRUNS, you are right, it's de=
ad
code from the earlier debugging code that got removed before submission=
=2E
I will correct that.

>=20
> Most DRM drivers do not threat dma, bus_error, vsync and/or underrun
> interrupts as debug functionality. They are of limited use in this
> driver, presently, yet the CONFIG_DEBUG_FS guard seems a bit strange
> imho.

The HDLCD device has only 1 interrupt that can fire and there is no oth=
er
way to show the reason for the interrupt in the driver. It was useful w=
hen
debugging underruns and/or vsync issues so I thought it might be useful
to keep around. Putting it the other way: if you are going to use this =
device
and the image is not completely rendered I would not be able to give yo=
u
support to figure out what went wrong without this debugging informatio=
n.
With this in place I can tell the difference between a busy system vs o=
ne
where the interrupt latency is large.

Best regards,
Liviu

>=20
> Cheers,
> Emil
>=20
> [1] http://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-drive=
rs.html
> [2] http://blog.ffwll.ch/2015/01/update-for-atomic-display-updates.ht=
ml
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
