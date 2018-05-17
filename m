Return-Path: <SRS0=GrEx=IE=nxp.com=jun.li@kernel.org>
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 05/14] usb: typec: add API to get typec basic port
 power and data config
Date: Thu, 17 May 2018 14:05:41 +0000
Message-ID: 
 <VI1PR0402MB39179F63BCF3E605443D877389910@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-6-git-send-email-jun.li@nxp.com>
 <c28a8352-e960-449b-e7c1-7965d340536e@gmail.com>
 <VI1PR0402MB3917CE86B45CBC1B6F7F576B899C0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <74e1c164-1652-75f4-409c-bd1c214bda4d@gmail.com>
 <20180516122527.GC11469@kuha.fi.intel.com>
 <33d02e76-bdf2-be50-68ec-9d520acdbe82@gmail.com>
 <20180517123506.GF11469@kuha.fi.intel.com>
In-Reply-To: <20180517123506.GF11469@kuha.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mats Karrman <mats.dev.list@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, Peter Chen <peter.chen@nxp.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Heikki,

> > I reread this patch and tried to see it more in the context of the
> > other patches and the existing code. The naming of the existing string
> > tables doesn't help in getting this right, however I have a proposal:
> >
> > typec_find_port_power_role() to get to TYPEC_PORT_SRC/SNK/DRP
> > typec_find_port_data_role() to get to TYPEC_PORT_DFP/UFP/DRD
> > typec_find_power_role() to get to TYPEC_SINK/SOURCE
> >
> > and sometime, if the use should arise
> >
> > typec_find_data_role() to get to TYPEC_DEVICE/HOST
> >
> > I think it is fairly comprehensible, *_port_* concerns a capability
> > and without *_port_* it is an actual state. Plus it matches the names
> > of the constants.
>=20
> Well, there are now four things to consider:
>=20
> 1) the roles (power and data) the port is capable of supporting
> 2) Try.SRC and Try.SNK, i.e. the preferred role
> 3) the current roles
> 4) the role(s) the user want's to limit the use of a port with DRP ports
>=20
> The last one I don't know if it's relevant with these functions. It's not
> information that we would get for example from firmware.
>=20
> I also don't think we need to use these functions with the current roles =
the port
> is in.
>=20
> If the preferred role is "sink" or "source", so just like the power role,=
 we don't
> need separate function for it here.
>=20
> So isn't two functions all we need here: one for the power and one for da=
ta
> role?

Take power as an example, can we use one function to only look up
typec_port_types[]? as capability(typec_port_type) and state(typec_role)
are different enum, and the allowed strings are different.

static const char * const typec_roles[] =3D {
	[TYPEC_SINK]    =3D "sink",
	[TYPEC_SOURCE]  =3D "source",
};

static const char * const typec_port_types[] =3D {
	[TYPEC_PORT_SRC] =3D "source",
	[TYPEC_PORT_SNK] =3D "sink",
	[TYPEC_PORT_DRP] =3D "dual",
};

Thanks
Li Jun
>=20
>=20
> Thanks,
>=20
> --
> heikki
