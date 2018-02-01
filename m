From: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Thu, 1 Feb 2018 01:04:45 +0000
Message-ID: <CY1PR0201MB076454E915A6E6947A39F04BB8FA0@CY1PR0201MB0764.namprd02.prod.outlook.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-2-git-send-email-jollys@xilinx.com>
 <20180131180354.mqf4gvvprdtycbn5@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131180354.mqf4gvvprdtycbn5-agMKViyK24J5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org" <matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org>, "sudeep.holla-5wv7dgnIgG8@public.gmane.org" <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rajan Vaja <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,
Thanks for the review,

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> Sent: Wednesday, January 31, 2018 10:04 AM
> To: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org;
> sudeep.holla-5wv7dgnIgG8@public.gmane.org; hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org;
> dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Rajan Vaja
> <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqM=
P
> firmware
>=20
> On Wed, Jan 24, 2018 at 03:21:11PM -0800, Jolly Shah wrote:
> > Add documentation to describe Xilinx ZynqMP firmware driver bindings.
> > Firmware driver provides an interface to firmware APIs. Interface APIs
> > can be used by any driver to communicate to PMUFW (Platform Management
> > Unit).
> >
> > Signed-off-by: Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Rajan Vaja <rajanv-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16
> ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware
> > .txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > new file mode 100644
> > index 0000000..a7aaf56
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-fi
> > +++ rmware.txt
> > @@ -0,0 +1,16 @@
> > +Xilinx Zynq MPSoC Firmware Device Tree Bindings
> > +
> > +The zynqmp-firmware node describes the interface to platform firmware.
>=20
> Is there any documentation for this that can be referred to?
>

Will add more information about supported APIs in next version patch.
Below document describes interface APIs though it is not latest.  =20
https://www.xilinx.com/support/documentation/user_guides/ug1200-eemi-api.pd=
f


> > +
> > +Required properties:
> > + - compatible:	Must contain:  "xlnx,zynqmp-firmware"
> > + - method:	The method of calling the PM-API firmware layer.
> > +		Permitted values are:
> > +		 - "smc" : To be used in configurations without a hypervisor
> > +		 - "hvc" : To be used when hypervisor is present
>=20
> Please specify what exactly these mean. I assume these follow the SMCCC.
> If so, this can be:
>=20
> - method: The method of calling the PM-API firmware layer.
>           Permitted values are:
> 	  - "smc" : SMC #0, following the SMCCC
> 	  - "hvc" : HVC #0, following the SMCCC
>=20
> Otherwise, this looks ok to me.
>=20

Yes it follows SMCCC.=20

> Thanks,
> Mark.
>=20
> > +
> > +Examples:
> > +	zynqmp_firmware: zynqmp-firmware {
> > +		compatible =3D "xlnx,zynqmp-firmware";
> > +		method =3D "smc";
> > +	};
> > --
> > 2.7.4
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
