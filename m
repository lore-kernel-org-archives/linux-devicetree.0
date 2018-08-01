From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [PATCH 3/3] ptp_qoriq: convert to use module parameters for
 initialization
Date: Wed, 1 Aug 2018 04:36:40 +0000
Message-ID: <DB6PR0401MB253643010802739AD55820F3F82D0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <20180730100154.27906-1-yangbo.lu@nxp.com>
 <20180730100154.27906-3-yangbo.lu@nxp.com>
 <20180730143043.qu66ttzwyjbw6si7@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730143043.qu66ttzwyjbw6si7@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Richard,

> -----Original Message-----
> From: Richard Cochran [mailto:richardcochran@gmail.com]
> Sent: Monday, July 30, 2018 10:31 PM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; Madalin-cristian Bucur
> <madalin.bucur@nxp.com>; Rob Herring <robh+dt@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; David S . Miller <davem@davemloft.net>;
> devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 3/3] ptp_qoriq: convert to use module parameters for
> initialization
>=20
> On Mon, Jul 30, 2018 at 06:01:54PM +0800, Yangbo Lu wrote:
> > The ptp_qoriq driver initialized the 1588 timer with the
> > configurations provided by the properties of device tree node. For
> > example,
> >
> >   fsl,tclk-period =3D <5>;
> >   fsl,tmr-prsc    =3D <2>;
> >   fsl,tmr-add     =3D <0xaaaaaaab>;
> >   fsl,tmr-fiper1  =3D <999999995>;
> >   fsl,tmr-fiper2  =3D <99990>;
> >   fsl,max-adj     =3D <499999999>;
> >
> > These things actually were runtime configurations which were not
> > proper to be put into dts.
>=20
> That is debatable.  While I agree that the dts isn't ideal for these, sti=
ll it is the
> lesser of two or more evils.

[Y.b. Lu] Ok. You're right indeed :)

>=20
> > This patch is to convert
> > to use module parameters for 1588 timer initialization, and to support
> > initial register values calculation.
>=20
> It is hard for me to understand how using module parameters improves the
> situation.

[Y.b. Lu] Actually I'm not sure whether module_param will be accepted to re=
place dts.
I thought the most possibility would be rejection before sending them out.
Just want suggestion and confirmation whether there is better idea than dts=
 from your comments.

Since we should keep the dts, I will drop the module_param.
Could I add a function to calculate a set of default register values to ini=
tialize ptp timer when dts method failed to get required properties in driv=
er?
I think this will be useful. The ptp timer on new platforms (you may see tw=
o dts patches in this patchset. Many platforms will be affected.) will work=
 without these dts properties. If user want specific setting, they can set =
dts properties.


>=20
> > If the parameters are not provided, the driver will calculate register
> > values with a set of default parameters. With this patch, those dts
> > properties are no longer needed for new platform to support 1588
> > timer, and many QorIQ DPAA platforms (some P series and T series
> > platforms of PowerPC, and some LS series platforms of ARM64) could use
> > this driver for their fman ptp timer with default module parameters.
> > However, this patch didn't remove the dts method. Because there were
> > still many old platforms using the dts method. We need to clean up
> > their dts files, verify module parameters on them, and convert them to
> > the new method gradually in case of breaking any function.
>=20
> In addition, like it or not, because the dts is an ABI, you must continue=
 support
> of the dts values as a legacy option.

[Y.b. Lu] I get your point now. The dts should be kept :)

>=20
> Thanks,
> Richard
