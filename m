From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related
 properties
Date: Fri, 12 Jun 2015 11:42:13 +0300
Message-ID: <20150612114213.486c9408@rockdesk>
References: <CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg@mail.gmail.com>
	<20150609182931.1eda4111@rockdesk>
	<20150610120623.GA7678@shlinux2>
	<20150611103035.08967a37@rockdesk>
	<20150611083851.GB16101@shlinux2>
	<20150611155102.15b881fd@rockdesk>
	<20150611142208.GD16101@shlinux2>
	<20150611175557.724a14e5@rockdesk>
	<20150612014203.GE16101@shlinux2>
	<20150612110213.59286f9f@rockdesk>
	<20150612082358.GG16101@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150612082358.GG16101@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Fri, 12 Jun 2015 16:23:59 +0800
Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Fri, Jun 12, 2015 at 11:02:13AM +0300, Roger Quadros wrote:
> >=20
> > On Fri, 12 Jun 2015 09:42:04 +0800
> > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >=20
> > > On Thu, Jun 11, 2015 at 05:55:57PM +0300, Roger Quadros wrote:
> > > > > > drivers/usb/core/hub.c
> > > > > >=20
> > > > > > static int usb_enumerate_device_otg(struct usb_device *udev=
)
> > > > > > {
> > > > > > 	int err =3D 0;
> > > > > >=20
> > > > > > #ifdef	CONFIG_USB_OTG
> > > > > > 	/*
> > > > > > 	 * OTG-aware devices on OTG-capable root hubs may be able =
to use SRP,
> > > > > > 	 * to wake us after we've powered off VBUS; and HNP, switc=
hing roles
> > > > > > 	 * "host" to "peripheral".  The OTG descriptor helps figur=
e this out.
> > > > > > 	 */
> > > > > > 	if (!udev->bus->is_b_host
> > > > > > 			&& udev->config
> > > > > > 			&& udev->parent =3D=3D udev->bus->root_hub) {
> > > > > > 		struct usb_otg_descriptor	*desc =3D NULL;
> > > > > > 		struct usb_bus			*bus =3D udev->bus;
> > > > > >=20
> > > > > > 		/* descriptor may appear anywhere in config */
> > > > > > 		if (__usb_get_extra_descriptor (udev->rawdescriptors[0],
> > > > > > 					le16_to_cpu(udev->config[0].desc.wTotalLength),
> > > > > > 					USB_DT_OTG, (void **) &desc) =3D=3D 0) {
> > > > > > 			if (desc->bmAttributes & USB_OTG_HNP) {
> > > > > > 				unsigned		port1 =3D udev->portnum;
> > > > > >=20
> > > > > > 				dev_info(&udev->dev,
> > > > > > 					"Dual-Role OTG device on %sHNP port\n",
> > > > > > 					(port1 =3D=3D bus->otg_port)
> > > > > > 						? "" : "non-");
> > > > > >=20
> > > > > > 				/* enable HNP before suspend, it's simpler */
> > > > > > 				if (port1 =3D=3D bus->otg_port)
> > > > > > 					bus->b_hnp_enable =3D 1;
> > > > > > 				err =3D usb_control_msg(udev,
> > > > > > 					usb_sndctrlpipe(udev, 0),
> > > > > > 					USB_REQ_SET_FEATURE, 0,
> > > > > > 					bus->b_hnp_enable
> > > > > > 						? USB_DEVICE_B_HNP_ENABLE
> > > > > > 						: USB_DEVICE_A_ALT_HNP_SUPPORT,
> > > > > > 					0, NULL, 0, USB_CTRL_SET_TIMEOUT);
> > > > > >=20
> > > > > > We're sending out this control request even if this host po=
rt is not OTG.
> > > > > > Isn't that wrong?
> > > > >=20
> > > > > So send USB_DEVICE_A_ALT_HNP_SUPPORT request.
> > > > > This is correct in OTG 1.x, its intention is to remind the us=
er who is
> > > > > connecting the HNP capable OTG device to a non-OTG port, He c=
an change
> > > > > to another port of this machine which is a OTG port(with HNP)=
=2E
> > > >=20
> > > > I didn't understand.
> > > > If CONFIG_USB_OTG is enabled doesn't mean that this USB host po=
rt is OTG host.
> > > Yes, only CONFIG_USB_OTG enabled doesn't mean that this USB host =
port
> > > is a OTG port, there are might multiple usb host ports, but only =
one
> > > is a OTG port.
> >=20
> > Not necessarily. Many systems don't have any OTG port so that reque=
st cannot
> > be sent even if CONFIG_USB_OTG is enabled.
> >=20
> That's the fact, but we are talking the code only for those systems w=
hich
> have OTG port. If you think we need not cover the support for OTG 1.x=
 host,
> we can simply remove it.
>=20
> > > > So it should not send any OTG specific request to device. Right=
?
> > > Non-otg port(in OTG 1.x protocol) + OTG 1.x device, should send,
> > > otherwise, should not send.
> >=20
> > What did you mean by Non-OTG port (in OTG 1.x protocol)?
>=20
> Means host only port without HNP.
>=20
> > If it is Non-OTG port it doesn't understand any OTG protocol.
>=20
> With common sense, yes, but there is one exception.
>=20
> > So Non-OTG port should not send any OTG request.
> >=20
> see below from OTG 1.3:
>=20
> 6.5.3 a_alt_hnp_support
> Setting this feature indicates to the B-device that it is connected t=
o
> an A-device port that is not capable of HNP, but that the A-device do=
es
> have an alternate port that is capable of HNP.
> The A-device is required to set this feature under the following cond=
itions:
> =E2=80=A2 the A-device has multiple receptacles
> =E2=80=A2 the A-device port that connects to the B-device does not su=
pport HNP
> =E2=80=A2 the A-device has another port that does support HNP
> ... ...
>=20
> > >=20
> > > So the code you pasted here was right only for OTG 1.x, I assume
> > > OTG 2.0 has not been released when it was designed. But now it's
> > > out of date, it's wrong if you connect a OTG 2.0 device.=20
> > >=20
> >=20
> > The code is wrong for non-OTG ports when CONFIG_USB_OTG is set.
> >=20
> > Peter/Felipe, any comments on this?
> >=20
> > cheers,
> > -roger
> >=20
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > 				if (err < 0) {
> > > > > > 					/* OTG MESSAGE: report errors here,
> > > > > > 					 * customize to match your product.
> > > > > > 					 */
> > > > > > 					dev_info(&udev->dev,
> > > > > > 						"can't set HNP mode: %d\n",
> > > > > > 						err);
> > > > > > 					bus->b_hnp_enable =3D 0;
> > > > > > 				}
> > > > > >=20
> > > > > > Instead it should be moved inside the if (port1 =3D=3D bus-=
>otg_port) condition.
> > > > >=20
> > > > > Nope, as I explained above, this is really too detailed OTG p=
rotocol:)
> > > > > >=20
> > > > > > 			}
> > > > > > 		}
> > > > > > 	}
> > > > > > #endif
> > > > > > 	return err;
> > > > > > }
> > > > > >=20
> >=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
