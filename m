From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Wed, 23 Sep 2015 12:10:13 -0500
Message-ID: <alpine.DEB.2.02.1509231129350.23595@linuxheads99>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com> <1442935271-10375-4-git-send-email-atull@opensource.altera.com> <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Josh,

Thanks for the review.  This is all at the tail end of a long
(>2 years) discussion on this.  I hope that the way this has
shaped out still meets the needs of the people who have been
in this discussion the most and have had the strongest feelings
(due to being current users of FPGAs under Linux).

On Tue, 22 Sep 2015, Josh Cartwright wrote:

> > 
> > The following sysfs files are created:
> > * /sys/class/fpga_manager/<fpga>/name
> >   Name of low level driver.
> 
> Don't 'struct device's already have a name?  Why do you need another name
> attribute?

It's a nicety but not a necessity.  And it's not the only kernel framework
that has human readable names like that. Look at i2c for one example.
Nobody's complained about this one before but I guess it's not
absolutely needed.

> > +
> > +static const char * const state_str[] = {
> > +	[FPGA_MGR_STATE_UNKNOWN] =		"unknown",
> > +	[FPGA_MGR_STATE_POWER_OFF] =		"power off",
> > +	[FPGA_MGR_STATE_POWER_UP] =		"power up",
> > +	[FPGA_MGR_STATE_RESET] =		"reset",
> > +
> > +	/* requesting FPGA image from firmware */
> > +	[FPGA_MGR_STATE_FIRMWARE_REQ] =		"firmware request",
> > +	[FPGA_MGR_STATE_FIRMWARE_REQ_ERR] =	"firmware request error",
> > +
> > +	/* Preparing FPGA to receive image */
> > +	[FPGA_MGR_STATE_WRITE_INIT] =		"write init",
> > +	[FPGA_MGR_STATE_WRITE_INIT_ERR] =	"write init error",
> > +
> > +	/* Writing image to FPGA */
> > +	[FPGA_MGR_STATE_WRITE] =		"write",
> > +	[FPGA_MGR_STATE_WRITE_ERR] =		"write error",
> > +
> > +	/* Finishing configuration after image has been written */
> > +	[FPGA_MGR_STATE_WRITE_COMPLETE] =	"write complete",
> > +	[FPGA_MGR_STATE_WRITE_COMPLETE_ERR] =	"write complete error",
> > +
> > +	/* FPGA reports to be in normal operating mode */
> > +	[FPGA_MGR_STATE_OPERATING] =		"operating",
> > +};
> 
> Is it really necessary to expose the whole FPGA manager state machine to
> userspace?  Is the only justification "for debugging"?
> 
> If so, that seems pretty short-sighted, as it then makes the state
> machine part of the stable usermode API.  It even makes less sense given
> this patchsets current state: configuration of the FPGA is not something
> that userspace is directly triggering.

Nope, not for debugging.

This feature was requested two years ago by folks who have userspace
bringing up a complicated system in FPGAs under Linux.

https://lkml.org/lkml/2013/9/18/490

There are likely to be interfaces that can be triggered by userspace. Please
look at my last patchset for one example: using device tree overlays.
That can be triggered from userspace.  You could have a layered system
where userspace loads one DT overlay (which triggers FPGA programming
and drivers probing), checks for success, then loads the next
DT overlay to program the next FPGA in the system.  In this case
the userspace interface is the configfs interface for DT overlays
so I would not be able to add FPGA manager status to that interface.
The only status I would have would be in the configfs, indicating
whether the overlay got applied successfully or not.

> 
> > +
> > +static ssize_t name_show(struct device *dev,
> > +			 struct device_attribute *attr, char *buf)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +
> > +	return sprintf(buf, "%s\n", mgr->name);
> > +}
> > +
> > +static ssize_t state_show(struct device *dev,
> > +			  struct device_attribute *attr, char *buf)
> > +{
> > +	struct fpga_manager *mgr = to_fpga_manager(dev);
> > +
> > +	return sprintf(buf, "%s\n", state_str[mgr->state]);
> > +}
> 
> Is it possible that the state of the FPGA has changed since the last
> time we've done an update?  Should the lower-level drivers' state()
> callback be invoked here?

Exposing the low level driver's state is not exactly the intent here.
Above I commented further on the intent of exposing state.
I want to expose how far the FPGA manager core's state machine gets
in the process of programming.  So if we can't get the FPGA into
a state ready for receiving data, it will be "write init error", for
instance.  If we can't load the specific firmware file we wanted,
it's "firmware request error." 

> 
> > +
> > +static DEVICE_ATTR_RO(name);
> > +static DEVICE_ATTR_RO(state);
> > +
> > +static struct attribute *fpga_mgr_attrs[] = {
> > +	&dev_attr_name.attr,
> > +	&dev_attr_state.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(fpga_mgr);
> > +
> > +static int fpga_mgr_of_node_match(struct device *dev, const void *data)
> > +{
> > +	return dev->of_node == data;
> > +}
> > +
> > +/**
> > + * of_fpga_mgr_get - get an exclusive reference to a fpga mgr
> > + * @node:	device node
> > + *
> > + * Given a device node, get an exclusive reference to a fpga mgr.
> > + *
> > + * Return: fpga manager struct or IS_ERR() condition containing error code.
> > + */
> > +struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
> > +{
> > +	struct fpga_manager *mgr;
> > +	struct device *dev;
> > +
> > +	if (!node)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	dev = class_find_device(fpga_mgr_class, NULL, node,
> > +				fpga_mgr_of_node_match);
> > +	if (!dev)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	mgr = to_fpga_manager(dev);
> > +	put_device(dev);
> 
> Who's ensuring the FPGA manager device's lifetime between _get and _put?

Well... get_device and put_device are not sufficient?

> 
> > +	if (!mgr)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	/* Get exclusive use of fpga manager */
> > +	if (!mutex_trylock(&mgr->ref_mutex))
> > +		return ERR_PTR(-EBUSY);
> > +
> > +	if (!try_module_get(THIS_MODULE)) {
> > +		mutex_unlock(&mgr->ref_mutex);
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	return mgr;
> > +}
> [..]
> > +int fpga_mgr_register(struct device *dev, const char *name,
> > +		      const struct fpga_manager_ops *mops,
> > +		      void *priv)
> > +{
> > +	struct fpga_manager *mgr;
> > +	const char *dt_label;
> > +	int id, ret;
> > +
> > +	if (!mops || !mops->write_init || !mops->write ||
> > +	    !mops->write_complete || !mops->state) {
> > +		dev_err(dev, "Attempt to register without fpga_manager_ops\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!name || !strlen(name)) {
> > +		dev_err(dev, "Attempt to register with no name!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
> > +	if (!mgr)
> > +		return -ENOMEM;
> > +
> > +	id = ida_simple_get(&fpga_mgr_ida, 0, 0, GFP_KERNEL);
> > +	if (id < 0) {
> > +		ret = id;
> > +		goto error_kfree;
> > +	}
> > +
> > +	mutex_init(&mgr->ref_mutex);
> > +
> > +	mgr->name = name;
> > +	mgr->mops = mops;
> > +	mgr->priv = priv;
> > +
> > +	/*
> > +	 * Initialize framework state by requesting low level driver read state
> > +	 * from device.  FPGA may be in reset mode or may have been programmed
> > +	 * by bootloader or EEPROM.
> > +	 */
> > +	mgr->state = mgr->mops->state(mgr);
> > +
> > +	device_initialize(&mgr->dev);
> > +	mgr->dev.class = fpga_mgr_class;
> > +	mgr->dev.parent = dev;
> > +	mgr->dev.of_node = dev->of_node;
> > +	mgr->dev.id = id;
> > +	dev_set_drvdata(dev, mgr);
> > +
> > +	dt_label = of_get_property(mgr->dev.of_node, "label", NULL);
> > +	if (dt_label)
> > +		ret = dev_set_name(&mgr->dev, "%s", dt_label);
> > +	else
> > +		ret = dev_set_name(&mgr->dev, "fpga%d", id);
> 
> I'm wondering if an alias {} node is better for this.

I could look into that.  Is there an example of that you particularly
like for this?

> 
> [..]
> > +++ b/include/linux/fpga/fpga-mgr.h
> [..]
> > +/*
> > + * FPGA Manager flags
> > + * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
> > + */
> > +#define FPGA_MGR_PARTIAL_RECONFIG	BIT(0)
> > +
> > +/**
> > + * struct fpga_manager_ops - ops for low level fpga manager drivers
> > + * @state: returns an enum value of the FPGA's state
> > + * @write_init: prepare the FPGA to receive confuration data
> 
>                                                ^configuration

Ah spelling.  Thanks!

> 
> > + * @write: write count bytes of configuration data to the FPGA
> > + * @write_complete: set FPGA to operating state after writing is done
> > + * @fpga_remove: optional: Set FPGA into a specific state during driver remove
> 
> Any specific state?  State in the FPGA-manager-state-machine case?  Or a
> basic 'reset' state?

Could be reset. Leaving that one open for the person implemening the low
level driver.

> 
>   Josh
> 
