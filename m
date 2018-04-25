Return-Path: <SRS0=k9qO=HO=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC 04/11] of: platform: add device connection parsing
Date: Wed, 25 Apr 2018 08:59:11 +0000
Message-ID: <OSBPR01MB22939C555DB92B225D693142D88F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524039005-30618-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180424123344.GC25723@kuha.fi.intel.com>
In-Reply-To: <20180424123344.GC25723@kuha.fi.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Heikki,

> From: Heikki Krogerus, Sent: Tuesday, April 24, 2018 9:34 PM
>=20
> Hi Yoshihiro,
>=20
> On Wed, Apr 18, 2018 at 05:09:58PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > +		devcon->endpoint[0] =3D dev_name(&pdev->dev);
> > +		devcon->endpoint[1] =3D dev_name(&remote_pdev->dev);
> > +
> > +		/* TODO: How to remove the connection? */
> > +		device_connection_add(devcon);
>=20
> This is wrong. You are converting a connection that is described in
> graph into a "build-in" one. If the connection is already described in
> graph there is no need to, actually, we _should not_, add it to the
> list of "build-in" connection descriptions.
>=20
> What should be done is that we parse the graph the moment
> device_connection_find*() is called. And that should be done in
> drivers/base/devcon.c .

Thank you for the comments! I completely misunderstood which framework I sh=
ould improve.
I'll try to improve the devcon.
However, I'll have a vacation in next week. So, I think I can submit next v=
ersion in early May.

Best regards,
Yoshihiro Shimoda

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * of_platform_bus_create() - Create a device for a node and its child=
ren.
> >   * @bus: device node of the bus to instantiate
> > @@ -477,6 +535,14 @@ int of_platform_populate(struct device_node *root,
> >  	}
> >  	of_node_set_flag(root, OF_POPULATED_BUS);
> >
> > +	for_each_child_of_node(root, child) {
> > +		rc =3D of_parse_device_connection(child);
> > +		if (rc) {
> > +			of_node_put(child);
> > +			break;
> > +		}
> > +	}
> > +
> >  	of_node_put(root);
> >  	return rc;
> >  }
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 4d25e4f..30aa103 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -143,6 +143,7 @@ static inline void of_node_put(struct device_node *=
node) { }
> >  #define OF_DETACHED	2 /* node has been detached from the device tree *=
/
> >  #define OF_POPULATED	3 /* device already created for the node */
> >  #define OF_POPULATED_BUS	4 /* of_platform_populate recursed to childre=
n of this node */
> > +#define OF_DEVICE_CONNECTED	5 /* checked devcon on of_platform_populat=
e */
> >
> >  #define OF_BAD_ADDR	((u64)-1)
>=20
>=20
> Thanks,
>=20
> --
> heikki
