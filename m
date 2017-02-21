From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 15/36] platform: add video-multiplexer subdevice
 driver
Date: Tue, 21 Feb 2017 10:11:05 +0100
Message-ID: <1487668265.2331.23.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
         <1487211578-11360-16-git-send-email-steve_longerbeam@mentor.com>
         <20170219220237.GD32327@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170219220237.GD32327@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinu
List-Id: devicetree@vger.kernel.org

On Sun, 2017-02-19 at 23:02 +0100, Pavel Machek wrote:
> Hi!
> 
> > From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > This driver can handle SoC internal and external video bus multiplexers,
> > controlled either by register bit fields or by a GPIO. The subdevice
> > passes through frame interval and mbus configuration of the active input
> > to the output side.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > --
> >
> 
> Again, this is slightly non-standard format. Normally changes from v1
> go below ---, but in your case it would cut off the signoff...
> 
> > diff --git a/Documentation/devicetree/bindings/media/video-multiplexer.txt b/Documentation/devicetree/bindings/media/video-multiplexer.txt
> > new file mode 100644
> > index 0000000..9d133d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/video-multiplexer.txt
> > @@ -0,0 +1,59 @@
> > +Video Multiplexer
> > +=================
> > +
> > +Video multiplexers allow to select between multiple input ports. Video received
> > +on the active input port is passed through to the output port. Muxes described
> > +by this binding may be controlled by a syscon register bitfield or by a GPIO.
> > +
> > +Required properties:
> > +- compatible : should be "video-multiplexer"
> > +- reg: should be register base of the register containing the control bitfield
> > +- bit-mask: bitmask of the control bitfield in the control register
> > +- bit-shift: bit offset of the control bitfield in the control register
> > +- gpios: alternatively to reg, bit-mask, and bit-shift, a single GPIO phandle
> > +  may be given to switch between two inputs
> > +- #address-cells: should be <1>
> > +- #size-cells: should be <0>
> > +- port@*: at least three port nodes containing endpoints connecting to the
> > +  source and sink devices according to of_graph bindings. The last port is
> > +  the output port, all others are inputs.
> 
> At least three? I guess it is exactly three with the gpio?

Yes. With the mmio bitfield muxes there can be more.

> Plus you might want to describe which port correspond to which gpio
> state/bitfield values...
> 
> > +struct vidsw {
> 
> I knew it: it is secretely a switch! :-).

This driver started as a two-input gpio controlled bus switch.
I changed the name when adding support for bitfield controlled
multiplexers with more than two inputs.

> > +static void vidsw_set_active(struct vidsw *vidsw, int active)
> > +{
> > +	vidsw->active = active;
> > +	if (active < 0)
> > +		return;
> > +
> > +	dev_dbg(vidsw->subdev.dev, "setting %d active\n", active);
> > +
> > +	if (vidsw->field)
> > +		regmap_field_write(vidsw->field, active);
> > +	else if (vidsw->gpio)
> > +		gpiod_set_value(vidsw->gpio, active);
> 
>          else dev_err()...?

If neither field nor gpio are set, probe will have failed and this will
never be called.

> > +static int vidsw_async_init(struct vidsw *vidsw, struct device_node *node)
> > +{
> > +	struct device_node *ep;
> > +	u32 portno;
> > +	int numports;
> 
> numbports is int, so I guess portno should be, too?

We could change both to unsigned int, as both vidsw->num_pads and
endpoint.base.port are unsigned int, and they are only compared/assigned
to those and each other.

> > +		portno = endpoint.base.port;
> > +		if (portno >= numports - 1)
> > +			continue;
> 
     I. 
> > +	if (!pad) {
> > +		/* Mirror the input side on the output side */
> > +		cfg->type = vidsw->endpoint[vidsw->active].bus_type;
> > +		if (cfg->type == V4L2_MBUS_PARALLEL ||
> > +		    cfg->type == V4L2_MBUS_BT656)
> > +			cfg->flags = vidsw->endpoint[vidsw->active].bus.parallel.flags;
> > +	}
> 
> Will this need support for other V4L2_MBUS_ values?

To support CSI-2 multiplexers, yes.

> > +MODULE_AUTHOR("Sascha Hauer, Pengutronix");
> > +MODULE_AUTHOR("Philipp Zabel, Pengutronix");
> 
> Normally, MODULE_AUTHOR contains comma separated names of authors,
> perhaps with <email@addresses>. Not sure two MODULE_AUTHORs per file
> will work.
> 
> Thanks,
> 								Pavel

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
