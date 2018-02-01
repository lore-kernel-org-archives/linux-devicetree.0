From: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 2/4] drivers: firmware: xilinx: Add ZynqMP firmware
 driver
Date: Thu, 1 Feb 2018 01:23:48 +0000
Message-ID: <CY1PR0201MB0764D88D409A35B8379323B4B8FA0@CY1PR0201MB0764.namprd02.prod.outlook.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-3-git-send-email-jollys@xilinx.com>
 <20180131182012.oshjmvahetaizlbu@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131182012.oshjmvahetaizlbu-agMKViyK24J5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org" <matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org>, "sudeep.holla-5wv7dgnIgG8@public.gmane.org" <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rajan Vaja <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,
Thanks for the review,

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> Sent: Wednesday, January 31, 2018 10:20 AM
> To: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org;
> sudeep.holla-5wv7dgnIgG8@public.gmane.org; hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org;
> dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Rajan Vaja
> <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH v3 2/4] drivers: firmware: xilinx: Add ZynqMP firmwar=
e
> driver
>=20
> On Wed, Jan 24, 2018 at 03:21:12PM -0800, Jolly Shah wrote:
> > This patch is adding communication layer with firmware.
> > Firmware driver provides an interface to firmware APIs.
> > Interface APIs can be used by any driver to communicate to
> > PMUFW(Platform Management Unit). All requests go through ATF.
>=20
> > +/**
> > + * zynqmp_pm_set_wakeup_source - PM call to specify the wakeup source
> > + *					while suspended
> > + * @target:	Node ID of the targeted PU or subsystem
> > + * @wakeup_node:Node ID of the wakeup peripheral
> > + * @enable:	Enable or disable the specified peripheral as wake source
> > + *
> > + * Return:	Returns status, either success or error+reason
> > + */
> > +static int zynqmp_pm_set_wakeup_source(const u32 target,
> > +				       const u32 wakeup_node,
> > +				       const u32 enable)
> > +{
> > +	return invoke_pm_fn(PM_SET_WAKEUP_SOURCE, target,
> > +			    wakeup_node, enable, 0, NULL); }
>=20
> I see many functions take a "Node ID" parameter, but these don't appear t=
o be
> in any DT binding, and drivers (other than the debugfs driver) aren't usi=
ng them.
>=20
> What's the plan for making use of these? Where are the node IDs going to =
come
> from in practice?
>=20
Node ids are defined in firmware.h. Node id refers to targeted PU/subsystem=
/peripheral for required action.

> > +/**
> > + * zynqmp_pm_system_shutdown - PM call to request a system shutdown or
> restart
> > + * @type:	Shutdown or restart? 0 for shutdown, 1 for restart
> > + * @subtype:	Specifies which system should be restarted or shut down
> > + *
> > + * Return:	Returns status, either success or error+reason
> > + */
> > +static int zynqmp_pm_system_shutdown(const u32 type, const u32
> > +subtype) {
> > +	return invoke_pm_fn(PM_SYSTEM_SHUTDOWN, type, subtype, 0, 0,
> NULL);
> > +}
>=20
> PSCI already has this functionality, so I'm a little confused by the dupl=
ication.
>=20
PSCI doesn't distinguish between shutdown scope. It can be APU/PS/System in=
 this case.

> [...]
>=20
> > +/**
> > + * zynqmp_pm_get_node_status - PM call to request a node's current pow=
er
> state
> > + * @node:		ID of the component or sub-system in question
> > + * @status:		Current operating state of the requested node
> > + * @requirements:	Current requirements asserted on the node,
> > + *			used for slave nodes only.
> > + * @usage:		Usage information, used for slave nodes only:
> > + *			0 - No master is currently using the node
> > + *			1 - Only requesting master is currently using the node
> > + *			2 - Only other masters are currently using the node
> > + *			3 - Both the current and at least one other master
> > + *			is currently using the node
>=20
> These should probably have corresponding macros or enum values.
Will add macros in next version patch.

>=20
> [...]
>=20
> > +/**
> > + * zynqmp_pm_sha_hash - Access the SHA engine to calculate the hash
> > + * @address:	Address of the data/ Address of output buffer where
> > + *		hash should be stored.
> > + * @size:	Size of the data.
> > + * @flags:
> > + *	BIT(0) - Sha3 init (Here address and size inputs can be NULL)
> > + *	BIT(1) - Sha3 update (address should holds the )
>=20
> Missing "data", I guess?
Yes will update in next version patch.

>=20
> > + *	BIT(2) - Sha3 final (address should hold the address of
> > + *		 buffer to store hash)
>=20
> Is the SHA engine coherent? Or is cache maintenance necessary?
>=20
> [...]
It is coherent. Update/Final has below significance here:
BIT(1) - To call Sha3_Update API which can be called multiple times when da=
ta is not contiguous.
BIT(2) - to get final hash of the whole updated data. Hash will be overwrit=
ten at provided address with 48 bytes.

>=20
> > +/**
> > + * zynqmp_pm_pinctrl_request - Request Pin from firmware
> > + * @pin:	Pin number to request
> > + *
>=20
> No DT binding for the pinctrl bits?
>=20
> [...]
It doesn't require any bindings. Calling drivers will have DT binding for p=
ins they use.=20


>=20
> > +/**
> > + * zynqmp_pm_clock_enable - Enable the clock for given id
> > + * @clock_id:	ID of the clock to be enabled
> > + *
>=20
> Likewise for the clocks?
>
It doesn't require bindings too.=20
=20
> > +/**
> > + * get_eemi_ops	- Get eemi ops functions
> > + *
> > + * Return:	- pointer of eemi_ops structure
> > + */
> > +const struct zynqmp_eemi_ops *get_eemi_ops(void) {
> > +	return &eemi_ops;
> > +}
> > +EXPORT_SYMBOL_GPL(get_eemi_ops);
> > +
> > +static int __init zynqmp_plat_init(void) {
> > +	struct device_node *np;
> > +	int ret =3D 0;
> > +
> > +	np =3D of_find_compatible_node(NULL, NULL, "xlnx,zynqmp");
> > +	if (!np)
> > +		return 0;
> > +	of_node_put(np);
> > +
> > +	/* We're running on a ZynqMP machine, the PM node is mandatory. */
> > +	np =3D of_find_compatible_node(NULL, NULL, "xlnx,zynqmp-firmware");
> > +	if (!np) {
> > +		pr_warn("%s: pm node not found\n", __func__);
> > +		return -ENXIO;
> > +	}
> > +
> > +	ret =3D get_set_conduit_method(np);
> > +	if (ret) {
> > +		of_node_put(np);
> > +		return ret;
> > +	}
> > +
> > +	/* Check PM API version number */
> > +	zynqmp_pm_get_api_version(&pm_api_version);
> > +	if (pm_api_version !=3D ZYNQMP_PM_VERSION) {
> > +		panic("%s power management API version error. Expected:
> v%d.%d - Found: v%d.%d\n",
> > +		      __func__,
> > +		      ZYNQMP_PM_VERSION_MAJOR,
> ZYNQMP_PM_VERSION_MINOR,
> > +		      pm_api_version >> 16, pm_api_version & 0xffff);
> > +	}
> > +
> > +	pr_info("%s Power management API v%d.%d\n", __func__,
> > +		ZYNQMP_PM_VERSION_MAJOR,
> ZYNQMP_PM_VERSION_MINOR);
> > +
> > +	of_node_put(np);
> > +
> > +	return ret;
> > +}
> > +
> > +early_initcall(zynqmp_plat_init);
>=20
> Why does this need to be an early initcall? Can't we probe this as a plat=
form
> device?
>=20
> Thanks,
> Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
