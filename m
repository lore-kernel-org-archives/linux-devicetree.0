From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
Date: Mon, 14 Nov 2016 13:22:56 +0200
Message-ID: <2365181.44tD8uopZF@avalon>
References: <cover.1478103726.git.jsarha@ti.com> <1740464.TP0bE1PYbC@avalon> <ac8e0f72-fac2-45e5-0004-d6028ddeb221@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ac8e0f72-fac2-45e5-0004-d6028ddeb221-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tomi,

On Monday 14 Nov 2016 13:16:49 Tomi Valkeinen wrote:
> On 14/11/16 13:10, Laurent Pinchart wrote:
> > On Monday 14 Nov 2016 10:49:43 Jyri Sarha wrote:
> >> On 11/03/16 19:46, Laurent Pinchart wrote:
> >>>> +Required properties:
> >>>>> +	- compatible: "ti,tfp410"
> >>> 
> >>> The device is an I2C slave, it should have a reg property. Given that
> >>> the chip can be used without being controlled through I2C, the reg
> >>> property should be optional. You should document this clearly, and
> >>> explain how the DT node can be instantiated as a child of an I2C
> >>> controller when the I2C interface is used, or in other parts of the
> >>> device tree otherwise.
> >> 
> >> Shouldn't I have two different compatible strings if want to make both
> >> platform driver probe and i2c client probe to work?
> > 
> > I don't think so, it's still the same chip.
> > 
> >> Or can it be done with single compatible string? Would you know of an
> >> example of such a driver?
> > 
> > You will need to register both a i2c_driver and a platform_driver in the
> > tfp410 driver. Both will advertise the same compatible string. As you'll
> > have two probe functions, it should be easy to handle the differences
> > between the
>
> If you have the same compatible string, won't both probes trigger? If
> so, how does, e.g., the platform driver know this is actually i2c case,
> and bail out? And if both probes don't trigger, why not? How does the
> device probing machinery know that this DT node is actually an i2c node,
> not a platform device node?

The driver for the bus on which the device is sitting is responsible for 
instantiating a struct device corresponding to the bus type, and for binding 
the corresponding bus drivers. This will be a struct i2c_client for I2C buses, 
and a struct platform_device for platform buses. Only the corresponding driver 
type will be probed.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
