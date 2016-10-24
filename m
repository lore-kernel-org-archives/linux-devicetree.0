From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] ARM: memory: da8xx-ddrctl: new driver
Date: Mon, 24 Oct 2016 10:35:30 -0700
Message-ID: <7hd1ipzm3h.fsf@baylibre.com>
References: <1477327596-16060-1-git-send-email-bgolaszewski@baylibre.com>
        <1477327596-16060-2-git-send-email-bgolaszewski@baylibre.com>
        <20161024170035.GO15620@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024170035.GO15620@leverpostej> (Mark Rutland's message of
        "Mon, 24 Oct 2016 18:00:36 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Mon, Oct 24, 2016 at 06:46:36PM +0200, Bartosz Golaszewski wrote:
>> Create a new driver for the da8xx DDR2/mDDR controller and implement
>> support for writing to the Peripheral Bus Burst Priority Register.
>> 
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../memory-controllers/ti-da8xx-ddrctl.txt         |  20 +++
>>  drivers/memory/Kconfig                             |   8 +
>>  drivers/memory/Makefile                            |   1 +
>>  drivers/memory/da8xx-ddrctl.c                      | 187 +++++++++++++++++++++
>>  4 files changed, 216 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>>  create mode 100644 drivers/memory/da8xx-ddrctl.c
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>> b/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>> new file mode 100644
>> index 0000000..f0eda59
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>> @@ -0,0 +1,20 @@
>> +* Device tree bindings for Texas Instruments da8xx DDR2/mDDR memory controller
>> +
>> +The DDR2/mDDR memory controller present on Texas Instruments da8xx SoCs memory
>> +maps a set of registers which allow to tweak the controller's behavior.
>
> This is a description of the *driver*. The device itself doesn't map
> some registers, it features them. Please descrive the *device*.
>
>> +
>> +Documentation:
>> +OMAP-L138 (DA850) - http://www.ti.com/lit/ug/spruh82c/spruh82c.pdf
>> +
>> +Required properties:
>> +
>> +- compatible:		"ti,da850-ddrctl" - for da850 SoC based boards
>
> Perhaps:
>
> 	"ti,da850-ddr-controller"
>
>> +static int da8xx_ddrctl_probe(struct platform_device *pdev)
>> +{
>> +	const struct da8xx_ddrctl_config_knob *knob;
>> +	const struct da8xx_ddrctl_setting *setting;
>> +	u32 regprop[2], base, memsize, reg;
>> +	struct device_node *node, *parent;
>> +	void __iomem *ddrctl;
>> +	const char *board;
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = &pdev->dev;
>> +	node = dev->of_node;
>> +
>> +	/* Find the board name. */
>> +	for (parent = node;
>> +	     !of_node_is_root(parent);
>> +	     parent = of_get_parent(parent));
>> +
>> +	ret = of_property_read_string(parent, "compatible", &board);
>> +	if (ret) {
>> +		dev_err(dev, "unable to read the soc model\n");
>> +		return ret;
>> +	}
>
> I can see that you want to expose sysfs knobs for this, but is it really
> necessary to match boards like this? It's very fragile, and commits us
> to maintaining a database of board data (i.e. a board file).
>
> I am very much not keen on that.

The original proposal[1] was to create DT properties reflecting the
various knobs in the DDR Controller, but that was frowned upon since
that was more HW configuration than hardware description.

That resulted in this approach which keeps the HW configuration values
in the driver, and selectable based on DT compatible.

IMO, neither aproach is pretty.  From a DT maintainer perspective, can
you comment on your preference?

Thanks,

Kevin

[1] https://marc.info/?l=linux-arm-kernel&m=147672200715076&w=2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
