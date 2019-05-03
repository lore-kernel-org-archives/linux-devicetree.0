Return-Path: <SRS0=zbdD=TD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
 renesas,usb-role-switch property
Date: Fri, 3 May 2019 06:39:24 +0000
Message-ID: 
 <OSAPR01MB2098D4F5C9C2D620324DD42CB8350@OSAPR01MB2098.jpnprd01.prod.outlook.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
 <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
 <20190426181405.GA1881@bogus>
 <OSBPR01MB2103BF796E95B788CC018CA2B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB2103BF796E95B788CC018CA2B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Yu Chen <chenyu56@huawei.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,


> Subject: RE: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
> renesas,usb-role-switch property
> > On Wed, Apr 24, 2019 at 10:22:18AM +0100, Biju Das wrote:
> > > Add an optional property renesas,usb-role-switch to support dual
> > > role switch for USB Type-C DRP port controller devices using USB
> > > role switch class framework.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  V4-->V5
> > >   * No Change
> > >  V3-->V4
> > >   * No Change
> > >  V2-->V3
> > >   * Added optional renesas,usb-role-switch property.
> > >  V1-->V2
> > >   * Added usb-role-switch-property
> > >   * Updated the example with usb-role-switch property.
> > > ---
> > >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> > ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > index 35039e7..f1cb06a 100644
> > > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > @@ -22,6 +22,7 @@ Required properties:
> > >  Optional properties:
> > >    - phys: phandle + phy specifier pair
> > >    - phy-names: must be "usb"
> > > +  - renesas,usb-role-switch: use USB role switch to handle role
> > > + switch events
> >
> > Mediatek and HiSilicon both have same or similar properties in patches
> > under review. Please coordinate and document a common property.
>=20
> As per R-Car Gen3 boards design. The USB3.0 port  on the boards (Salvator=
-xs
> and Ebisu) has a USB3.0 Type-A receptor.
> For debug purpose , the same port can be used as peripheral  using
> force_b_device mode on debugfs.
> Ie, we can use force_b_device to switch the role on this boards.
>=20
> Where as RZ/G2E board is having USB 3.0 type-C connector.  So the driver
> needs to know whether to use debugfs based dual role switch or non-
> debugfs based dual role switch(type-C). That is the reason I have added t=
his
> property.
>=20
> > Really, I'm wondering why this is needed. Can't you walk the graph to
> > the connector and determine if dual role is supported by the connector
> type?
>=20
> Yes, Basically we don't need this property. I could walk through the grap=
h and
> determine the role supported by connector type
>=20
> Please find the example code which will be used in the driver.
>=20
> +static bool is_ext_dual_role_usb_connector_available(struct device
> +*dev) {
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *parent;
> +       struct device_node *child;
> +       bool ret =3D false;
> +       const char *role_type =3D NULL;
> +
> +       child =3D of_graph_get_endpoint_by_regs(np, -1, -1);
> +       if (!child)
> +               return ret;
> +
> +       parent =3D of_graph_get_remote_port_parent(child);
> +       of_node_put(child);
> +       child =3D of_get_child_by_name(parent, "connector");
> +       of_node_put(parent);
> +       if (!child)
> +               return ret;
> +
> +       if (of_device_is_compatible(child, "usb-c-connector")) {
> +               of_property_read_string(child, "data-role", &role_type);
> +               if (role_type && (!strncmp(role_type, "dual", strlen("dua=
l"))))
> +                       ret =3D true;
> +       }
> +
> +       of_node_put(child);
> +       return ret;
> +}

Since we are introducing "usb-role-switch " common property[1],
I feel using the common-property make things simpler compared to walking th=
rough the graph.=20

Are you happy with using the  common property?  Or  still prefer walk throu=
gh the graph solution?
Please let me  know.

[1] https://patchwork.kernel.org/patch/10920909/

Regards,
Biju
