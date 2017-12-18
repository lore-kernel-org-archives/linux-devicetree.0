From: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/2] dt-bindings: usb-xhci: add usb3-resume-missing-cas
 property
Date: Mon, 18 Dec 2017 08:35:55 +0000
Message-ID: <VI1PR0402MB3917A48717786AD69B393C3D890E0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1513051038-20311-1-git-send-email-jun.li@nxp.com>
 <20171215222600.qffkck67qjwwpref@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215222600.qffkck67qjwwpref@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Saturday, December 16, 2017 6:26 AM
> To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
> Cc: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH 1/2] dt-bindings: usb-xhci: add usb3-resume-missing-c=
as
> property
>=20
> On Tue, Dec 12, 2017 at 11:57:17AM +0800, Li Jun wrote:
> > Adding 'usb3-resume-missing-cas' property to enable XHCI_MISSING_CAS
> > quirk flag in case there is CAS missing if device plugged in S3.
> >
> > Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > index e2ea59b..c413e188 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > @@ -32,6 +32,8 @@ Optional properties:
> >    - usb3-lpm-capable: determines if platform is USB3 LPM capable
> >    - quirk-broken-port-ped: set if the controller has broken port disab=
le
> mechanism
> >    - imod-interval-ns: default interrupt moderation interval is 5000ns
> > +  - usb3-resume-missing-cas: set if the CAS(Cold Attach Status) may lo=
se in
> case
> > +    usb3 device plugged in while system sleep.
>=20
> This should be implied by an SoC specific compatible string for the XHCI =
block.

The quirk is already using on some PCI platforms(xhci-pci.c), so I think it=
 will
be possible used for other SoCs as well in future.

thanks
Jun Li

>=20
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
