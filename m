From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/4] drm: arm: Add DT bindings documentation for HDLCD
 driver.
Date: Thu, 12 Nov 2015 11:09:37 +0000
Message-ID: <20151112110937.GA963@e106497-lin.cambridge.arm.com>
References: <1447258010-2234-1-git-send-email-Liviu.Dudau@arm.com>
 <1447258010-2234-2-git-send-email-Liviu.Dudau@arm.com>
 <20151111184849.GA9172@rob-hp-laptop>
 <20151112104210.GZ963@e106497-lin.cambridge.arm.com>
 <1447325545.2825.9.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447325545.2825.9.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 12, 2015 at 10:52:25AM +0000, Jon Medhurst (Tixy) wrote:
> On Thu, 2015-11-12 at 10:42 +0000, Liviu Dudau wrote:
> > > This is on-chip RAM or nornal system RAM? We already have binding=
s
> > for=20
> > > both.
> >
> > Juno has a set of TLX (ThinLinks) connectors on the board where an
> > FPGA can be attached. On r1
> > the code running on FPGA can even participate as an AXI master with
> > full coherency. The FPGA
> > has local memory that we want to share with the HDLCD to be used as=
 a
> > framebuffer.
>=20
> The HDLCD on the Juno chip or one implemented in the FPGA? I assume y=
ou
> mean the latter but just wanted to check.

You can have a GPU on the FPGA, and you want to read the framebuffer
off the FPGA's memory to render it on screen using the SoC's HDLCD. Hop=
e
this makes sense.

Best regards,
Liviu

>=20
> --=20
> Tixy
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
