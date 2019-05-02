From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
Date: Thu, 2 May 2019 19:20:07 +0200
Message-ID: <20190502172007.GA1874@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 27, 2019 at 11:04:56PM +0100, Dragan Cvetic wrote:
> +#define DRIVER_NAME "xilinx_sdfec"
> +#define DRIVER_VERSION "0.3"

Version means nothing with the driver in the kernel tree, please remove
it.

> +#define DRIVER_MAX_DEV BIT(MINORBITS)

Why this number?  Why limit yourself to any number?

> +
> +static struct class *xsdfec_class;

Do you really need your own class?

> +static atomic_t xsdfec_ndevs = ATOMIC_INIT(0);

Why?

> +static dev_t xsdfec_devt;

Why?

Why not use misc_device for this?  Why do you need your own major with a
bunch of minor devices reserved ahead of time?  Why not just create a
new misc device for every individual device that happens to be found in
the system?  That will make the code a lot simpler and smaller and
easier.



> +
> +/**
> + * struct xsdfec_dev - Driver data for SDFEC
> + * @regs: device physical base address
> + * @dev: pointer to device struct
> + * @config: Configuration of the SDFEC device
> + * @open_count: Count of char device being opened
> + * @xsdfec_cdev: Character device handle
> + * @irq_lock: Driver spinlock
> + *
> + * This structure contains necessary state for SDFEC driver to operate
> + */
> +struct xsdfec_dev {
> +	void __iomem *regs;
> +	struct device *dev;
> +	struct xsdfec_config config;
> +	atomic_t open_count;
> +	struct cdev xsdfec_cdev;
> +	/* Spinlock to protect state_updated and stats_updated */
> +	spinlock_t irq_lock;
> +};
> +
> +static const struct file_operations xsdfec_fops = {
> +	.owner = THIS_MODULE,
> +};

No operations at all?  That's an easy driver :)

thanks,

greg k-h
