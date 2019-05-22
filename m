From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by node
Date: Wed, 22 May 2019 08:05:09 +0000
Message-ID: <OSBPR01MB21032206146152983C8F4E8EB8000@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557823643-8616-1-git-send-email-chunfeng.yun@mediatek.com>
 <1557823643-8616-5-git-send-email-chunfeng.yun@mediatek.com>
 <20190517103736.GA1490@kuha.fi.intel.com>
 <20190517130511.GA1887@kuha.fi.intel.com>
 <1558319951.10179.352.camel@mhfsdcap03>
 <20190520080359.GC1887@kuha.fi.intel.com>
 <OSBPR01MB2103385D996762FA54F8E437B8060@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190520083601.GE1887@kuha.fi.intel.com>
 <OSBPR01MB2103C4C8920C40E42BC1B2A9B8060@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190521095839.GI1887@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521095839.GI1887@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.i>
List-Id: devicetree@vger.kernel.org

Hi Heikki,

Thanks for the feedback.

> Subject: Re: [PATCH v5 4/6] usb: roles: add API to get usb_role_switch by
> node
>=20
> On Mon, May 20, 2019 at 09:45:46AM +0000, Biju Das wrote:
> >
> >
> > Hi Heikki,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v5 4/6] usb: roles: add API to get
> > > usb_role_switch by node
> > >
> > > On Mon, May 20, 2019 at 08:06:41AM +0000, Biju Das wrote:
> > > > Hi Heikki,
> > > >
> > > > > Subject: Re: [PATCH v5 4/6] usb: roles: add API to get
> > > > > usb_role_switch by node
> > > > >
> > > > > On Mon, May 20, 2019 at 10:39:11AM +0800, Chunfeng Yun wrote:
> > > > > > Hi,
> > > > > > On Fri, 2019-05-17 at 16:05 +0300, Heikki Krogerus wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Fri, May 17, 2019 at 01:37:36PM +0300, Heikki Krogerus wro=
te:
> > > > > > > > On Tue, May 14, 2019 at 04:47:21PM +0800, Chunfeng Yun
> wrote:
> > > > > > > > > Add fwnode_usb_role_switch_get() to make easier to get
> > > > > > > > > usb_role_switch by fwnode which register it.
> > > > > > > > > It's useful when there is not device_connection
> > > > > > > > > registered between two drivers and only knows the fwnode
> > > > > > > > > which register usb_role_switch.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > > > > > Tested-by: Biju Das <biju.das@bp.renesas.com>
> > > > > > > >
> > > > > > > > Acked-by: Heikki Krogerus
> > > > > > > > <heikki.krogerus@linux.intel.com>
> > > > > > >
> > > > > > > Hold on. I just noticed Rob's comment on patch 2/6, where he
> > > > > > > points out that you don't need to use device graph since the
> > > > > > > controller is the parent of the connector. Doesn't that mean
> > > > > > > you don't really need this API?
> > > > > > No, I still need it.
> > > > > > The change is about the way how to get fwnode; when use device
> > > > > > graph, get fwnode by of_graph_get_remote_node(); but now will
> > > > > > get fwnode by of_get_parent();
> > > > >
> > > > > OK, I get that, but I'm still not convinced about if something
> > > > > like this function is needed at all. I also have concerns
> > > > > regarding how you are using the function. I'll explain in
> > > > > comment to the patch 5/6 in this
> > > series...
> > > >
> > > > FYI, Currently  I am also using this api in my patch series.
> > > > https://patchwork.kernel.org/patch/10944637/
> > >
> > > Yes, and I have the same question for you I jusb asked in comment I
> > > added to the patch 5/6 of this series. Why isn't usb_role_switch_get(=
)
> enough?
> >
> > Currently no issue. It will work with this api as well, since the port =
node is
> part of controller node.
> > For eg:-
> > https://patchwork.kernel.org/patch/10944627/
> >
> > However if any one adds port node inside the connector node, then this
> api may won't work as expected.
> > Currently I get below error
> >
> > [    2.299703] OF: graph: no port node found in
> /soc/i2c@e6500000/hd3ss3220@47
>=20
> We need to understand why is that happening?
>=20

Form the stack trace  the parent node is "parent_node=3Dhd3ss3220@47" , ins=
tead of the "connector" node.
That is the reason for the above error.

[    2.442429]  of_graph_get_next_endpoint.part.0+0x28/0x168
[    2.447889]  of_fwnode_graph_get_next_endpoint+0x5c/0xb0
[    2.453267]  fwnode_graph_get_next_endpoint+0x20/0x30
[    2.458374]  device_connection_find_match+0x74/0x1a0
[    2.463399]  usb_role_switch_get+0x20/0x28
[    2.467542]  hd3ss3220_probe+0xc4/0x218

The use case is

&i2c0 {
	hd3ss3220@47 {                                                          =20
                 	compatible =3D "ti,hd3ss3220";=20
                                  =20
                 	usb_con: connector {                                     =
       =20
                          		compatible =3D "usb-c-connector";              =
                                       =20
                         		port {                                          =
        =20
                                		 hd3ss3220_ep: endpoint {                =
        =20
                                        			remote-endpoint =3D <&usb3_role_=
switch>;  =20
                                		};                                       =
       =20
                         		};                                              =
        =20
                	 };                                                       =
       =20
	 };=20
};
  =20
&usb3_peri0 {                                                              =
     =20
         companion =3D <&xhci0>;                                           =
        =20
         usb-role-switch;                                                  =
      =20
                                                                           =
      =20
         port {                                                            =
      =20
                usb3_role_switch: endpoint {                               =
     =20
                        remote-endpoint =3D <&hd3ss3220_ep>;               =
       =20
                 };                                                        =
      =20
         };                                                                =
      =20
};  =20

Q1) How do we modify the usb_role_switch_get() function to search=20
Child(connector) and child's endpoint?

> It looks like we have an issue somewhere in the code, and instead of fixi=
ng
> that, you are working around it. Let's not do that.

OK.

Regards,
Biju
