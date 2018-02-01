From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] drivers: firmware: xilinx: Add ZynqMP firmware
 driver
Date: Thu, 1 Feb 2018 10:33:21 +0000
Message-ID: <20180201103321.fftn37mgzbk6oltl@lakrids.cambridge.arm.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-3-git-send-email-jollys@xilinx.com>
 <20180131182012.oshjmvahetaizlbu@lakrids.cambridge.arm.com>
 <CY1PR0201MB0764D88D409A35B8379323B4B8FA0@CY1PR0201MB0764.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CY1PR0201MB0764D88D409A35B8379323B4B8FA0-w5HSbVcoX6AJQdFqRSmStRrHTHEw16jenBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org" <matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org>, "sudeep.holla-5wv7dgnIgG8@public.gmane.org" <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rajan Vaja <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 01, 2018 at 01:23:48AM +0000, Jolly Shah wrote:
> Hi Mark,
> Thanks for the review,
> 
> > -----Original Message-----
> > From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> > Sent: Wednesday, January 31, 2018 10:20 AM
> > To: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> > gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org;
> > sudeep.holla-5wv7dgnIgG8@public.gmane.org; hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org;
> > dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Rajan Vaja
> > <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Subject: Re: [PATCH v3 2/4] drivers: firmware: xilinx: Add ZynqMP firmware
> > driver
> > 
> > On Wed, Jan 24, 2018 at 03:21:12PM -0800, Jolly Shah wrote:
> > > This patch is adding communication layer with firmware.
> > > Firmware driver provides an interface to firmware APIs.
> > > Interface APIs can be used by any driver to communicate to
> > > PMUFW(Platform Management Unit). All requests go through ATF.
> > 
> > > +/**
> > > + * zynqmp_pm_set_wakeup_source - PM call to specify the wakeup source
> > > + *					while suspended
> > > + * @target:	Node ID of the targeted PU or subsystem
> > > + * @wakeup_node:Node ID of the wakeup peripheral
> > > + * @enable:	Enable or disable the specified peripheral as wake source
> > > + *
> > > + * Return:	Returns status, either success or error+reason
> > > + */
> > > +static int zynqmp_pm_set_wakeup_source(const u32 target,
> > > +				       const u32 wakeup_node,
> > > +				       const u32 enable)
> > > +{
> > > +	return invoke_pm_fn(PM_SET_WAKEUP_SOURCE, target,
> > > +			    wakeup_node, enable, 0, NULL); }
> > 
> > I see many functions take a "Node ID" parameter, but these don't appear to be
> > in any DT binding, and drivers (other than the debugfs driver) aren't using them.
> > 
> > What's the plan for making use of these? Where are the node IDs going to come
> > from in practice?
> > 
> Node ids are defined in firmware.h. Node id refers to targeted PU/subsystem/peripheral for required action.

Ok. What I was asking was how a node id would be associated with
particular peripheral instances (which are presumably going to be nodes
in the DT).

e.g. if I have

	device@foo {
		compatible = "xlnx,some-device";
		reg = <0xf00 0x100>;
		...
	};

... how does the kernel know which node id(s) the device is associated
with?

I assume that those will need something like a xlnx,eemi-node-id
property.

[...]

> > > +/**
> > > + * zynqmp_pm_pinctrl_request - Request Pin from firmware
> > > + * @pin:	Pin number to request
> > > + *
> > 
> > No DT binding for the pinctrl bits?
> > 
> > [...]
> It doesn't require any bindings. Calling drivers will have DT binding for pins they use. 

For those drivers to be able to refer to the EEMI FW as a pin
controller, we'll need a pinctrl node in the DT (and hence a binding).

> > > +/**
> > > + * zynqmp_pm_clock_enable - Enable the clock for given id
> > > + * @clock_id:	ID of the clock to be enabled
> > > + *
> > 
> > Likewise for the clocks?
> >
> It doesn't require bindings too. 

As with pinctrl, for drivers to be able to refer to these clocks, we'll
need a clock node in the DT (and hence a binding).

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
