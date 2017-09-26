From: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 02/12] usb: typec: add basic typec properties
Date: Tue, 26 Sep 2017 10:09:03 +0000
Message-ID: <DB4PR04MB076844531E3C50924E00AF33897B0@DB4PR04MB0768.eurprd04.prod.outlook.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-3-git-send-email-jun.li@nxp.com>
 <20170926082300.GC14296@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170926082300.GC14296-FZxXFokcWpatqXYlAKuG4QC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org" <o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, "A.s. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Heikki Krogerus [mailto:heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org]
> Sent: Tuesday, September 26, 2017 4:23 PM
> To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org; Peter
> Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>; A.s. Dong <aisheng.dong-3arQi8VN3Tc@public.gmane.org>; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH 02/12] usb: typec: add basic typec properties
>=20
> On Tue, Sep 26, 2017 at 08:45:17AM +0800, Li Jun wrote:
> > port-type is required for any typec port; default-role is only
> > required for drp; power source capable needs src-pdos; power sink
> > capable needs snk-pdos, max-snk-mv, max-snk-ma, op-snk-mw.
> >
> > Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/typec.txt | 46
> > +++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/typec.txt
> > b/Documentation/devicetree/bindings/usb/typec.txt
> > new file mode 100644
> > index 0000000..36d4467
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typec.txt
> > @@ -0,0 +1,46 @@
> > +Generic typec and power delivery properties
> > +-------------------------------------------
> > +
> > +Required properties:
> > +- port-type:    should be one of "source", "sink" or "dual".
> > +- default-role: preferred power role if drp, should be "sink" or "sour=
ce".
> > +- src-pdos:     An array of u32 with each entry providing supported po=
wer
> > +                source data object(PDO), the detailed bit definitions =
of
> > +                PDO can be found in "Universal Serial Bus Power Delive=
ry
> > +                Specification" chapter 6.4.1.2 Source_Capabilities Mes=
sage,
> > +                the order of each entry(PDO) should follow the PD spec=
 chapter
> > +                6.4.1. Required only for power source and power dual r=
ole with
> > +                power delivery support.
> > +- snk-pdos:     An array of u32 with each entry providing supported po=
wer
> > +                sink data object(PDO), the detailed bit definitions of=
 PDO
> > +                can be found in "Universal Serial Bus Power Delivery
> > +                Specification" chapter 6.4.1.3 Sink Capabilities Messa=
ge,
> > +                the order of each entry(PDO) should follow the PD spec=
 chapter
> > +                6.4.1. Required only for power sink and power dual rol=
e with
> > +                power delivery support.
>=20
> Wouldn't it be better to supply a property per detail and let the drivers=
 construct
> the pdos as needed?

This is my original idea, but different kind of PDOs have so many detail at=
tributes for
different config, we will have a very long properties list, for simple, may=
be it's easier
for user to check the standard PD spec and construct it by hand in this cas=
e.

>=20
> > +- max-snk-mv:   The max voltage the sink can support in millivoltage, =
required
> > +                only for power sink and power dual role with power del=
ivery
> > +                support.
> > +- max-snk-ma:   The max current the sink can support in milliampere, r=
equired
> > +                only for power sink and power dual role with power del=
ivery
> > +                support.
> > +- op-snk-mw:    Sink required operating power in milliwatts, if source=
 offered
> > +                power is less then it, Capability Mismatch is set, req=
uired
> > +                only for power sink and power dual role with power del=
ivery
> > +                support.
>=20
> I'm a little bit concerned about these. Has any OF/DT guys reviewed them?
>=20
> We should also keep in mind that the same properties should also be possi=
ble to
> use with ACPI. That may not be a problem as such, but we should consult t=
he
> ACPI guys as well.
>=20

Ok, let's wait DT guys comments.

Li Jun
>=20
> Thanks,
>=20
> --
> heikki
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
