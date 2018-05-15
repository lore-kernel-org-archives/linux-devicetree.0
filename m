Return-Path: <SRS0=7rgC=IC=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC v3 1/4] base: devcon: add a new API to find the graph
Date: Tue, 15 May 2018 11:02:57 +0000
Message-ID: <OSBPR01MB2293D83364ADD5467D7A20AAD8930@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526289360-3997-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180514132740.GE21435@kuha.fi.intel.com>
 <OSBPR01MB22932EC3210BC8097E0B7F0FD8930@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20180515082911.GH21435@kuha.fi.intel.com>
In-Reply-To: <20180515082911.GH21435@kuha.fi.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Heikki,

Thank you for the reply!

> From: Heikki Krogerus, Sent: Tuesday, May 15, 2018 5:29 PM
>=20
> On Tue, May 15, 2018 at 02:19:14AM +0000, Yoshihiro Shimoda wrote:
> > Hi Heikki,
> >
> > > From: Heikki Krogerus, Sent: Monday, May 14, 2018 10:28 PM
> > >
> > > On Mon, May 14, 2018 at 06:15:57PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > > > +struct device *device_connection_find_by_graph(struct device *dev,=
 u32 port,
> > > > +					       u32 endpoint)
> > > > +{
> > > > +	struct bus_type *bus;
> > > > +	struct fwnode_handle *remote;
> > > > +	struct device *conn;
> > > > +
> > > > +	remote =3D fwnode_graph_get_remote_node(dev_fwnode(dev), port, en=
dpoint);
> > > > +	if (!remote)
> > > > +		return NULL;
> > > > +
> > > > +	for (bus =3D generic_match_buses[0]; bus; bus++) {
> > > > +		conn =3D bus_find_device(bus, NULL, remote, generic_graph_match)=
;
> > > > +		if (conn)
> > > > +			return conn;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * We only get called if a connection was found, tell the caller =
to
> > > > +	 * wait for the other device to show up.
> > > > +	 */
> > > > +	return ERR_PTR(-EPROBE_DEFER);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(device_connection_find_by_graph);
> > >
> > > Why do we need more API for walking through the graph?
> >
> > I thought there is difficult to find if a device has multiple ports or =
endpoints.
> > So, I'd like to use port and endpoint number for finding a device.
> >
> > > I'm not sure exactly sure what is going on here, I'll try to study
> > > your patches more when I have time, but the approach looks wrong. Tha=
t
> > > function looks like a helper, but just not that useful one.
> > >
> > > We really should be able to use the existing functions. In practice
> > > device_connection_find_match() should eventually parse the graph, the=
n
> > > fallback to build-in connections if no graph is found. Otherwise
> > > parsing graph here is not really useful at all.
> >
> > I think using device_connection_find_match() for finding the graph beco=
mes complicated.
> > The current arguments of the function is the below:
> >
> > void *device_connection_find_match(struct device *dev, const char *con_=
id,
> > 			       void *data,
> > 			       void *(*match)(struct device_connection *con,
> > 					      int ep, void *data))
> >
> > If finding the graph, the following arguments will be not used.
> >  - con_id
> >  - *con and ep of "match" arguments.
> >
> > This is because these arguments are for the build-in connections.
>=20
> No they're not. You do realize that we can build a temporary struct
> device_connection there and then (in stack) to be supplied for the
> ->match callback.

I understood it.

> > So, should I modify the arguments of the function for finding both
> > the graph and built-in connections somehow?
>=20
> I don't see any need for that. We may need to modify struct
> device_connection, but there should not be any need to touch the API.
>=20
> Your plan to use port and endpoint number is wrong, as they are just
> indexes, and therefore not reliable. Luckily it should be completely
> unnecessary to use them.
>=20
> The way I see this working is that we parse all the endpoints the
> caller device has. If we can't take advantage of the con_id for
> identification (though ideally we can), we just need to call ->match
> with every one of them. The implementation for the ->match callback is
> then responsible of figuring out if the endpoint is the one we are
> looking for or not in that case.

I understood it. But, I need to investigate how to find a device.

> The only problem I see with that is that we may not have a reliable
> way to convert the fwnode pointing to the remote-endpoint parent into
> struct device (if one has already been enumerated) in order to get the
> device name and use it as the second endpoint name in struct
> device_connection. To solve that, we could consider for example just
> adding a new member, fwnode pointer perhaps, to the structure. Or
> perhaps use the endpoint members for something else than device names
> when graph is used, and add a member defining the type of match:
> graph, build-in, etc. There are many things we can consider.

I don't understand why adding such new member(s) can solve that.
Anyway, I will investigate this more...

> I don't know if I'm able to explain what I'm after with this, so if
> you like, I can propose something for this myself. Though that will
> have to wait for few weeks. Right now I'm too busy with other stuff.

Thank you for your proposal! However, I'd like to try to investigate
once more while you are too busy.

Best regards,
Yoshihiro Shimoda

>=20
> Thanks,
>=20
> --
> heikki
