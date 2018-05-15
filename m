Return-Path: <SRS0=7rgC=IC=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC v3 1/4] base: devcon: add a new API to find the graph
Date: Tue, 15 May 2018 02:19:14 +0000
Message-ID: <OSBPR01MB22932EC3210BC8097E0B7F0FD8930@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526289360-3997-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180514132740.GE21435@kuha.fi.intel.com>
In-Reply-To: <20180514132740.GE21435@kuha.fi.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Heikki,

> From: Heikki Krogerus, Sent: Monday, May 14, 2018 10:28 PM
>=20
> On Mon, May 14, 2018 at 06:15:57PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > diff --git a/drivers/base/devcon.c b/drivers/base/devcon.c
> > index d427e80..5a0da33 100644
> > --- a/drivers/base/devcon.c
> > +++ b/drivers/base/devcon.c
<snip>
> > +static int generic_graph_match(struct device *dev, void *fwnode)
> > +{
> > +	return dev->fwnode =3D=3D fwnode;
> > +}
> > +
> > +/**
> > + * device_connection_find_by_graph - Find two devices connected togeth=
er
> > + * @dev: Device to find connected device
> > + * @port: identifier of the @dev port node
> > + * @endpoint: identifier of the @dev endpoint node
> > + *
> > + * Find a connection with @port and @endpoint by using graph between @=
dev and
> > + * another device. On success returns handle to the device that is con=
nected
> > + * to @dev, with the reference count for the found device incremented.=
 Returns
> > + * NULL if no matching connection was found, or ERR_PTR(-EPROBE_DEFER)=
 when
> > + * a connection was found but the other device has not been enumerated=
 yet.
> > + */
> > +struct device *device_connection_find_by_graph(struct device *dev, u32=
 port,
> > +					       u32 endpoint)
> > +{
> > +	struct bus_type *bus;
> > +	struct fwnode_handle *remote;
> > +	struct device *conn;
> > +
> > +	remote =3D fwnode_graph_get_remote_node(dev_fwnode(dev), port, endpoi=
nt);
> > +	if (!remote)
> > +		return NULL;
> > +
> > +	for (bus =3D generic_match_buses[0]; bus; bus++) {
> > +		conn =3D bus_find_device(bus, NULL, remote, generic_graph_match);
> > +		if (conn)
> > +			return conn;
> > +	}
> > +
> > +	/*
> > +	 * We only get called if a connection was found, tell the caller to
> > +	 * wait for the other device to show up.
> > +	 */
> > +	return ERR_PTR(-EPROBE_DEFER);
> > +}
> > +EXPORT_SYMBOL_GPL(device_connection_find_by_graph);
>=20
> Why do we need more API for walking through the graph?

I thought there is difficult to find if a device has multiple ports or endp=
oints.
So, I'd like to use port and endpoint number for finding a device.

> I'm not sure exactly sure what is going on here, I'll try to study
> your patches more when I have time, but the approach looks wrong. That
> function looks like a helper, but just not that useful one.
>=20
> We really should be able to use the existing functions. In practice
> device_connection_find_match() should eventually parse the graph, then
> fallback to build-in connections if no graph is found. Otherwise
> parsing graph here is not really useful at all.

I think using device_connection_find_match() for finding the graph becomes =
complicated.
The current arguments of the function is the below:

void *device_connection_find_match(struct device *dev, const char *con_id,
			       void *data,
			       void *(*match)(struct device_connection *con,
					      int ep, void *data))

If finding the graph, the following arguments will be not used.
 - con_id
 - *con and ep of "match" arguments.

This is because these arguments are for the build-in connections.
So, should I modify the arguments of the function for finding both
the graph and built-in connections somehow?

Best regards,
Yoshihiro Shimoda

>=20
> Thanks,
>=20
> --
> heikki
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
