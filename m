Return-Path: <SRS0=LeJN=QA=linuxfoundation.org=gregkh@kernel.org>
Date: Thu, 24 Jan 2019 07:57:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10 03/12] peci: Add support for PECI bus driver core
Message-ID: <20190124065714.GA28194@kroah.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
 <20190122132047.GA12357@kroah.com>
 <0826ef5c-c919-cdd7-5e2a-fc056d41756e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0826ef5c-c919-cdd7-5e2a-fc056d41756e@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, David Kershner <david.kershner@unisys.com>, Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, Gavin Schenk <g.schenk@eckelmann.de>, Viresh Kumar <viresh.kumar@linaro.org>, Cyrille Pitchen <cyrille.pitchen@free-electrons.com>, Alan Cox <alan@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fengguang Wu <fengguang.wu@intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Julia Cartwright <juliac@eso.teric.us>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 23, 2019 at 01:38:24PM -0800, Jae Hyun Yoo wrote:
> Hi Greg,
> 
> Thanks for sharing your time on reviewing this patch. Please find my
> answers below.
> 
> On 1/22/2019 5:20 AM, Greg Kroah-Hartman wrote:
> > On Mon, Jan 07, 2019 at 01:41:27PM -0800, Jae Hyun Yoo wrote:
> > > +config PECI
> > > +	bool "PECI support"
> > > +	select RT_MUTEXES
> > > +	select CRC8
> > > +	help
> > > +	  The Platform Environment Control Interface (PECI) is a one-wire bus
> > > +	  interface that provides a communication channel from Intel processors
> > > +	  and chipset components to external monitoring or control devices.
> > 
> > Why can't this be built as a module?
> 
> This PECI core driver should be prepared ahead of any PECI adapter
> driver registration which can be called from 'kernel_init' if the
> adapter driver is built-in. So this driver uses 'postcore_initcall' and
> it's the reason why it can't be built as a module.

Then set up your dependancies correctly.  As an example, you can have
the USB core as a module, and you are not allowed to have USB drivers
built into the kernel.  It's not difficult to do this.  Please make your
core also be a module so that you do not burden the zillions of machines
out there with code that they do not need, just because you forced the
distro to choose "Y" or "N".

> > And why do you rely on rt mutexes?
> 
> I intended to use that for giving priorities on each PECI sideband
> function. For an example, Crach Dump sideband function should have a
> higher priority than Temperature Monitoring sideband function. But, in
> this initial implementation, it doesn't have any priority adjustment
> code on the rt mutext yet so I'll remove this config dependency and will
> replace rt_mutex with mutex for now. It could be replaced back with
> rt_mutex later when it's actually needed.

thank you.

> > > +	u8 *msg;
> > > +
> > > +	if (!capable(CAP_SYS_ADMIN))
> > > +		return -EPERM;
> > 
> > Really?  Nice, you have userspace tools running as root, what could go
> > wrong... :)
> 
> I didn't catch your point. Should it be removed?

You are forcing your userspace tools to have CAP_SYS_ADMIN in order to
talk to your device.  Why?  What is wrong with the file permissions on
the device node instead?  Why can't userspace decide what user should be
able to talk to your device?

Don't require special permissions for no good reason.  This forces
whatever userspace tool that handles this, to have enough permission to
do anything it wants in the system.  And I do not think you want that.

> > > +static int peci_detect(struct peci_adapter *adapter, u8 addr)
> > > +{
> > > +	struct peci_ping_msg msg;
> > > +
> > > +	msg.addr = addr;
> > 
> > What about the un-initialized fields in this structure?  Can you
> > properly handle that, and also, is this ok to be on the stack?
> 
> It's fully initialized at here because the peci_ping_msg struct has only
> one member:
> 
> struct peci_ping_msg {
> 	__u8 addr;
> };

Ok.  But my question about "can you do this off the stack" remains.

> > > +static ssize_t peci_sysfs_new_device(struct device *dev,
> > > +				     struct device_attribute *attr,
> > > +				     const char *buf, size_t count)
> > > +{
> > > +	struct peci_adapter *adapter = to_peci_adapter(dev);
> > > +	struct peci_board_info info = {};
> > > +	struct peci_client *client;
> > > +	char *blank, end;
> > > +	int rc;
> > > +
> > > +	/* Parse device type */
> > > +	blank = strchr(buf, ' ');
> > > +	if (!blank) {
> > > +		dev_err(dev, "%s: Missing parameters\n", "new_device");
> > > +		return -EINVAL;
> > > +	}
> > > +	if (blank - buf > PECI_NAME_SIZE - 1) {
> > > +		dev_err(dev, "%s: Invalid device type\n", "new_device");
> > > +		return -EINVAL;
> > > +	}
> > > +	memcpy(info.type, buf, blank - buf);
> > > +
> > > +	/* Parse remaining parameters, reject extra parameters */
> > > +	rc = sscanf(++blank, "%hi%c", &info.addr, &end);
> > 
> > Please do not tell me you are parsing a sysfs write to do some type of
> > new configuration.  That is not what sysfs is for, that is what configfs
> > is for, please use that instead, this isn't ok.
> 
> This is for run-time registration of a PECI client which is connected to
> a PECI bus adapter. The life cycle of this sysfs interface will be
> synced with the adapter driver. Actually, it follows what I2C core
> driver currently does.

What i2c core driver parses configuration options in sysfs?

Ugh, I see that now.  That's horrible.  Please do not emulate that at
all.

Again, use configfs, that is what it is there for, do not spread bad
interfaces to new places in the kernel.

> > > +	if (rc < 1) {
> > > +		dev_err(dev, "%s: Can't parse client address\n", "new_device");
> > > +		return -EINVAL;
> > > +	}
> > > +	if (rc > 1  && end != '\n') {
> > > +		dev_err(dev, "%s: Extra parameters\n", "new_device");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	client = peci_new_device(adapter, &info);
> > > +	if (!client)
> > > +		return -EINVAL;
> > > +
> > > +	/* Keep track of the added device */
> > > +	mutex_lock(&adapter->userspace_clients_lock);
> > > +	list_add_tail(&client->detected, &adapter->userspace_clients);
> > > +	mutex_unlock(&adapter->userspace_clients_lock);
> > > +	dev_info(dev, "%s: Instantiated device %s at 0x%02hx\n", "new_device",
> > > +		 info.type, info.addr);
> > 
> > Don't be noisy for things that are expected to happen.
> 
> I think it should print out a result on a userspace request for client
> module registration.

Why?  Who is going to do anything with this?  Userspace "knows" it
worked because their function call returned success.  It is not going to
then parse a kernel log.

> > > +
> > > +	return count;
> > > +}
> > > +static DEVICE_ATTR(new_device, 0200, NULL, peci_sysfs_new_device);
> > 
> > Not that you should be doing this, but DEVICE_ATTR_RO() is what you want
> > here, right?
> 
> Actually, DEVICE_ATTR_WO() is what I can use here. The reason why I used
> DEVICE_ATTR() is for keeping the function naming pattern as
> 'peci_sysfs_new_device()' instead of 'new_device_store()'.

Sorry, yes, WO is what you want.  But anyway, this should be in
configfs, not sysfs.

> > > +static ssize_t peci_sysfs_delete_device(struct device *dev,
> > > +					struct device_attribute *attr,
> > > +					const char *buf, size_t count)
> > > +{
> > > +	struct peci_adapter *adapter = to_peci_adapter(dev);
> > > +	struct peci_client *client, *next;
> > > +	struct peci_board_info info = {};
> > > +	struct peci_driver *driver;
> > > +	char *blank, end;
> > > +	int rc;
> > > +
> > > +	/* Parse device type */
> > > +	blank = strchr(buf, ' ');
> > > +	if (!blank) {
> > > +		dev_err(dev, "%s: Missing parameters\n", "delete_device");
> > > +		return -EINVAL;
> > > +	}
> > > +	if (blank - buf > PECI_NAME_SIZE - 1) {
> > > +		dev_err(dev, "%s: Invalid device type\n", "delete_device");
> > > +		return -EINVAL;
> > > +	}
> > > +	memcpy(info.type, buf, blank - buf);
> > > +
> > > +	/* Parse remaining parameters, reject extra parameters */
> > > +	rc = sscanf(++blank, "%hi%c", &info.addr, &end);
> > > +	if (rc < 1) {
> > > +		dev_err(dev, "%s: Can't parse client address\n",
> > > +			"delete_device");
> > > +		return -EINVAL;
> > > +	}
> > > +	if (rc > 1  && end != '\n') {
> > > +		dev_err(dev, "%s: Extra parameters\n", "delete_device");
> > > +		return -EINVAL;
> > > +	}
> > 
> > Same here, no parsing of configurations through sysfs, that is not ok.
> > Again, use configfs.
> 
> Same as above. This is for run-time deregistration of a PECI client
> which is registered on a PECI bus adapter. The life cycle of this sysfs
> interface will be synced with the adapter driver. Actually, it follows
> what I2C core driver currently does.

Again, do not copy previous mistakes please.

> > > +
> > > +	return rc;
> > > +}
> > > +static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, 0200, NULL,
> > > +				  peci_sysfs_delete_device);
> > 
> > sysfs files that remove themselves are reserved for a specific circle in
> > hell, you really don't want to mess with them :(
> 
> It cannot remove itself. The owner of the sysfs files is an adapter
> driver and only client devices can be added/removed by these sysfs
> files. An adapter can't be removed by accessing of this sysfs.

They why the LOCKDEP notation?

> > > +/**
> > > + * struct peci_adapter - represent a PECI adapter
> > > + * @owner: owner module of the PECI adpater
> > > + * @bus_lock: mutex for exclusion of multiple callers
> > > + * @dev: device interface to this driver
> > > + * @cdev: character device object to create character device
> > > + * @nr: the bus number to map
> > > + * @name: name of the adapter
> > > + * @userspace_clients_lock: mutex for exclusion of clients handling
> > > + * @userspace_clients: list of registered clients
> > > + * @xfer: low-level transfer function pointer of the adapter
> > > + * @cmd_mask: mask for supportable PECI commands
> > > + *
> > > + * Each PECI adapter can communicate with one or more PECI client children.
> > > + * These make a small bus, sharing a single wired PECI connection.
> > > + */
> > > +struct peci_adapter {
> > > +	struct module		*owner;
> > > +	struct rt_mutex		bus_lock;
> > > +	struct device		dev;
> > > +	struct cdev		cdev;
> > 
> > Yeah, two differently reference counted variables in the same structure,
> > what could go wrong!  :(
> > 
> > Don't do this, make your cdev a pointer to be sure you get things right,
> > otherwise this will never work properly.
> > 
> > And shouldn't the character device be a class device?  Don't confuse
> > devices in the driver model with the interaction of them to userspace in
> > a specific manner, those should be separate things, right?
> 
> Okay, I got your point. I'll split out the character device part as
> a separated module and will make the module can be attached to a PECI
> bus.

I'm not saying it has to be a whole separate module, at the least it
needs to be a new structure.  As it is, your code is not correct due to
the dual-structures-trying-to-fight-it-out-for-lifecycle-rules

> > > +/**
> > > + * struct peci_xfer_msg - raw PECI transfer command
> > > + * @addr; address of the client
> > > + * @tx_len: number of data to be written in bytes
> > > + * @rx_len: number of data to be read in bytes
> > > + * @tx_buf: data to be written, or NULL
> > > + * @rx_buf: data to be read, or NULL
> > > + *
> > > + * raw PECI transfer
> > > + */
> > > +struct peci_xfer_msg {
> > > +	__u8 addr;
> > > +	__u8 tx_len;
> > > +	__u8 rx_len;
> > > +	__u8 tx_buf[PECI_BUFFER_SIZE];
> > > +	__u8 rx_buf[PECI_BUFFER_SIZE];
> > > +} __attribute__((__packed__));
> > 
> > Go kick the hardware engineer who did not align things on a 32bit
> > boundry.  They should have known better :(
> 
> I intended to make it as contiguous byte sequence in this order because
> some PECI commands need to caclulate CRC8 checksum using this as a byte
> array. I'll align these on a 32bit boundary and will use a temporary
> buffer instead while calcuating a CRC8 checksum.

If this really is the way the structure needs to be on the wire, that's
fine, it's just a complaint about the protocol and how bad accessing
those fields are going to suck for some processors.

But if you can get away with not doing it like this, that would be nice.

thanks,

greg k-h
