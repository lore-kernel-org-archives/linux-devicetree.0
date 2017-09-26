From: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 12/12] staging: typec: tcpci: move tcpci driver out of
 staging
Date: Tue, 26 Sep 2017 07:16:24 +0000
Message-ID: <DB4PR04MB0768423268C5D9D7BFFD3625897B0@DB4PR04MB0768.eurprd04.prod.outlook.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-13-git-send-email-jun.li@nxp.com>
 <20170926065749.GE6250@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170926065749.GE6250-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org" <o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, "A.s. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Greg KH [mailto:gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org]
> Sent: Tuesday, September 26, 2017 2:58 PM
> To: Jun Li <jun.li-3arQi8VN3Tc@public.gmane.org>
> Cc: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org; yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org;
> Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>; A.s. Dong <aisheng.dong-3arQi8VN3Tc@public.gmane.org>; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH 12/12] staging: typec: tcpci: move tcpci driver out o=
f
> staging
>=20
> On Tue, Sep 26, 2017 at 08:45:27AM +0800, Li Jun wrote:
> > Move TCPCI(Typec port controller interface) driver out of staging.
> >
> > Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  drivers/staging/Kconfig        |   2 -
> >  drivers/staging/Makefile       |   1 -
> >  drivers/staging/typec/Kconfig  |  14 -
> >  drivers/staging/typec/Makefile |   1 -
> >  drivers/staging/typec/TODO     |   5 -
> >  drivers/staging/typec/tcpci.c  | 637
> > -----------------------------------------
> >  drivers/staging/typec/tcpci.h  | 133 ---------
> >  drivers/usb/typec/Kconfig      |   7 +
> >  drivers/usb/typec/Makefile     |   1 +
> >  drivers/usb/typec/tcpci.c      | 637
> +++++++++++++++++++++++++++++++++++++++++
> >  drivers/usb/typec/tcpci.h      | 133 +++++++++
> >  11 files changed, 778 insertions(+), 793 deletions(-)
>=20
>=20
> Creating patches like this with "-M" to git format-patch is nice, that wa=
y we see
> the rename as just a rename, and not a big delete/add patch.
>=20
> Can you do that instead and resend this series?

Thanks, I will do that and resend.

Li Jun
>=20
> thanks,
>=20
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
