From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V3 07/12] misc: xilinx_sdfec: Add ability to configure
 LDPC
Date: Fri, 3 May 2019 16:49:19 +0000
Message-ID: <BL0PR02MB5681D386363988CB2CA4D040CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-8-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172713.GD1874@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502172713.GD1874@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Greg,

Please find inline comments below.

Regards
Dragan


> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 2 May 2019 18:27
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V3 07/12] misc: xilinx_sdfec: Add ability to configur=
e LDPC
>=20
> On Sat, Apr 27, 2019 at 11:05:01PM +0100, Dragan Cvetic wrote:
> > --- a/include/uapi/misc/xilinx_sdfec.h
> > +++ b/include/uapi/misc/xilinx_sdfec.h
>=20
> <snip>
>=20
> > +/**
> > + * xsdfec_calculate_shared_ldpc_table_entry_size - Calculates shared c=
ode
> > + * table sizes.
> > + * @ldpc: Pointer to the LPDC Code Parameters
> > + * @table_sizes: Pointer to structure containing the calculated table =
sizes
> > + *
> > + * Calculates the size of shared LDPC code tables used for a specified=
 LPDC code
> > + * parameters.
> > + */
> > +inline void
> > +xsdfec_calculate_shared_ldpc_table_entry_size(struct xsdfec_ldpc_param=
s *ldpc,
> > +	struct xsdfec_ldpc_param_table_sizes *table_sizes)
> > +{
> > +	/* Calculate the sc_size in 32 bit words */
> > +	table_sizes->sc_size =3D (ldpc->nlayers + 3) >> 2;
> > +	/* Calculate the la_size in 256 bit words */
> > +	table_sizes->la_size =3D ((ldpc->nlayers << 2) + 15) >> 4;
> > +	/* Calculate the qc_size in 256 bit words */
> > +	table_sizes->qc_size =3D ((ldpc->nqc << 2) + 15) >> 4;
> > +}
>=20
> Why do you have an inline function in a user api .h file?  That's really
> not a good idea.

This is just a Helper function for users aligning the calculations.
Please advise, is this acceptable?

>=20
> thanks,
>=20
> greg k-h
