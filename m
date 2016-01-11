From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: Add DT support for Juno r2 board
Date: Mon, 11 Jan 2016 11:09:09 +0000
Message-ID: <20160111110909.GD13633@e106497-lin.cambridge.arm.com>
References: <1450872611-15326-1-git-send-email-sudeep.holla@arm.com>
 <20151229183521.GL12450@rob-hp-laptop>
 <5683BE7A.9020404@arm.com>
 <CAL_Jsq+RZk3LnOhGtiXRFmxmA6bTOEdymtF1yN=6q=iRmUr_9Q@mail.gmail.com>
 <5683F971.9000300@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5683F971.9000300-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-hC8oa7XEHlfYtjvyW6yDsg@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 30, 2015 at 03:34:09PM +0000, Sudeep Holla wrote:
>=20
>=20
> On 30/12/15 15:09, Rob Herring wrote:
> >On Wed, Dec 30, 2015 at 5:22 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>=
 wrote:
> >>Hi Rob,
> >>
> >>Thanks for the review.
> >>
> >>On 29/12/15 18:35, Rob Herring wrote:
> >>>
> >>>On Wed, Dec 23, 2015 at 12:10:11PM +0000, Sudeep Holla wrote:
> >>>>
> >>>>Juno r2 is identical to Juno r1 with Cortex A57 cores replaced by
> >>>>Cortex A72 cores.
> >>>
> >>>
> >>>That's a bigger change than I'd expect...
> >>>
> >>
> >>I am not sure if I understood what you meant by that. Do you want m=
e to
> >>elaborate with more details ?
> >
> >No, just my commentary that I'd expect r1 -> r2 to be a board or Si
> >spin rather than a whole new core.
> >
>=20
> Ah OK, yes it's new Si and has other minor updates like latest revisi=
ons
> of Cortex-A53 and other IPs. I just mentioned only the DT visible
> changes in the commit log.
>=20
> >>>>Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> >>>>Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >>>>---
> >>>>   Documentation/devicetree/bindings/arm/arm-boards |   1 +
> >>>>   Documentation/devicetree/bindings/arm/cpus.txt   |   1 +
> >>>
> >>>
> >>>This should probably be a separate patch, but I already have a pat=
ch in
> >>>my tree for 4.5 adding arm,cortex-a72. So just drop this hunk.
> >>>
> >>
> >>OK, will post DT binding separately.
> >
> >No need, it is already in my tree.
> >
>=20
> Sorry for not being clear earlier. I was referring the "arm,juno-r2"
> compatible addition. I assume you have no objection if it's part of t=
he
> same patch.
>=20
> >>>>+       pcie-controller@40000000 {
> >>>>+               compatible =3D "arm,juno-r1-pcie", "plda,xpressri=
ch3-axi",
> >>>>"pci-host-ecam-generic";
> >>>
> >>>
> >>>Is this common with r1?
> >>>
> >>
> >>AFAIK it is. Liviu can you confirm ?
> >
> >Then perhaps you should move this to a common spot.
> >
>=20
> True, will wait for Liviu's response.

AFAIK Juno r2 should have identical PCIe controller to r1. I have not b=
een able to
test it myself but at the same time I have no information on any change=
s applied to
the IP.

Sudeep, probably worth moving the pcie-controller@40000000 node in juno=
-base.dtsi
and disable it by default, then re-enable in juno-r1.dts and juno-r2.dt=
s.

Best regards,
Liviu

>=20
> --=20
> Regards,
> Sudeep
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
