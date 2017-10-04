From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [v4, 1/2] hwmon: (max6621) Add support for Maxim MAX6621
 temperature sensor
Date: Wed, 4 Oct 2017 05:34:56 +0000
Message-ID: <AM4PR05MB3330E559C29CB6B8AA79C156A2730@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1507054108-195806-2-git-send-email-vadimp@mellanox.com>
 <20171004022128.GA1248@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171004022128.GA1248-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=20
> >  drivers/hwmon/Kconfig   |  14 ++
> >  drivers/hwmon/Makefile  |   1 +
> >  drivers/hwmon/max6621.c | 593
> > ++++++++++++++++++++++++++++++++++++++++++++++++
>=20
> I just realized that Documentation/hwmon/max6621 is missing, but since
> this is really my fault I won't you hostage on that.
>=20
> Applied to hwmon-next.
>=20
> Guenter

Thank you very much,
Vadim.

>=20
> >  3 files changed, 608 insertions(+)
> >  create mode 100644 drivers/hwmon/max6621.c
=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
