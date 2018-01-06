From: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/2] dt-bindings: usb-xhci: add usb3-resume-missing-cas
 property
Date: Sat, 6 Jan 2018 14:09:41 +0000
Message-ID: <VI1PR0402MB3917130B9C19EE653275E4AB891D0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1513051038-20311-1-git-send-email-jun.li@nxp.com>
 <20171215222600.qffkck67qjwwpref@rob-hp-laptop>
 <VI1PR0402MB3917A48717786AD69B393C3D890E0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <VI1PR0402MB3917A48717786AD69B393C3D890E0-9IDQY6o3qQgCJ0qg4/1i1Y3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob

> -----Original Message-----
> From: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-usb-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Jun Li
> Sent: Monday, December 18, 2017 4:36 PM
> To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: RE: [PATCH 1/2] dt-bindings: usb-xhci: add usb3-resume-missing-c=
as
> property
>=20
> > -----Original Message-----
> > From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > Sent: Saturday, December 16, 2017 6:26 AM
> > To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
> > Cc: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org;
> > mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH 1/2] dt-bindings: usb-xhci: add
> > usb3-resume-missing-cas property
> >
> > On Tue, Dec 12, 2017 at 11:57:17AM +0800, Li Jun wrote:
> > > Adding 'usb3-resume-missing-cas' property to enable XHCI_MISSING_CAS
> > > quirk flag in case there is CAS missing if device plugged in S3.
> > >
> > > Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > index e2ea59b..c413e188 100644
> > > --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > > @@ -32,6 +32,8 @@ Optional properties:
> > >    - usb3-lpm-capable: determines if platform is USB3 LPM capable
> > >    - quirk-broken-port-ped: set if the controller has broken port
> > > disable
> > mechanism
> > >    - imod-interval-ns: default interrupt moderation interval is
> > > 5000ns
> > > +  - usb3-resume-missing-cas: set if the CAS(Cold Attach Status) may
> > > + lose in
> > case
> > > +    usb3 device plugged in while system sleep.
> >
> > This should be implied by an SoC specific compatible string for the XHC=
I block.
>=20
> The quirk is already using on some PCI platforms(xhci-pci.c), so I think =
it will be
> possible used for other SoCs as well in future.

Do you still think I should add SoC specific compatible string for this?

Jun Li
>=20
> thanks
> Jun Li
>=20
> >
> > Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in t=
he body of
> a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fvger.=
ke
> rnel.org%2Fmajordomo-
> info.html&data=3D02%7C01%7Cjun.li%40nxp.com%7C4ab4c3f3e85e475b06f808d
> 545f2615a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636491829
> 682216310&sdata=3D8YEh55OxgmvsQAi5mtZS%2B5wdcWTRiXuKsfyoxmCjILQ%3D
> &reserved=3D0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
