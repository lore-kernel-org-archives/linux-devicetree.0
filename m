From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 1/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Tue, 29 Nov 2016 20:37:50 +0100
Message-ID: <20161129193750.GD20341@kroah.com>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-2-git-send-email-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480372701-30560-2-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2016 at 01:38:20AM +0300, Serge Semin wrote:
> +struct idt_89hpesx_dev {
> +	u32 eesize;
> +	bool eero;
> +	u8 eeaddr;
> +
> +	u8 inieecmd;
> +	u8 inicsrcmd;
> +	u8 iniccode;
> +
> +	atomic_t csr;
> +
> +	int (*smb_write)(struct idt_89hpesx_dev *, const struct idt_smb_seq *);
> +	int (*smb_read)(struct idt_89hpesx_dev *, struct idt_smb_seq *);
> +	struct mutex smb_mtx;
> +
> +	struct i2c_client *client;
> +
> +	struct bin_attribute *ee_file;
> +	struct dentry *csr_dir;
> +	struct dentry *csr_file;
> +};
> +#define to_pdev_kobj(__kobj) \
> +	dev_get_drvdata(container_of(__kobj, struct device, kobj))

Is it a struct device, or a kobject?  This is totally confusing to me.

And can't you just use kobj_to_dev()?

> +/*
> + * eeprom_attribute - EEPROM sysfs-node attributes
> + *
> + * NOTE Size will be changed in compliance with OF node. EEPROM attribute will
> + * be read-only as well if the corresponding flag is specified in OF node.
> + */
> +BIN_ATTR(eeprom, 0644, idt_sysfs_eeprom_read, idt_sysfs_eeprom_write,
> +	 EEPROM_DEF_SIZE);

static?

And BIN_ATTR_RW()?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
