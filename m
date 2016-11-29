From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Wed, 30 Nov 2016 00:16:25 +0300
Message-ID: <20161129211625.GB9146@mobilestation>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-2-git-send-email-fancer.lancer@gmail.com>
 <20161129193750.GD20341@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161129193750.GD20341-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2016 at 08:37:50PM +0100, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Tue, Nov 29, 2016 at 01:38:20AM +0300, Serge Semin wrote:
> > +struct idt_89hpesx_dev {
> > +	u32 eesize;
> > +	bool eero;
> > +	u8 eeaddr;
> > +
> > +	u8 inieecmd;
> > +	u8 inicsrcmd;
> > +	u8 iniccode;
> > +
> > +	atomic_t csr;
> > +
> > +	int (*smb_write)(struct idt_89hpesx_dev *, const struct idt_smb_seq *);
> > +	int (*smb_read)(struct idt_89hpesx_dev *, struct idt_smb_seq *);
> > +	struct mutex smb_mtx;
> > +
> > +	struct i2c_client *client;
> > +
> > +	struct bin_attribute *ee_file;
> > +	struct dentry *csr_dir;
> > +	struct dentry *csr_file;
> > +};
> > +#define to_pdev_kobj(__kobj) \
> > +	dev_get_drvdata(container_of(__kobj, struct device, kobj))
> 
> Is it a struct device, or a kobject?  This is totally confusing to me.
> 
> And can't you just use kobj_to_dev()?
> 

I just didn't know about kobj_to_dev() inline function. Totally agree that
container_of() should be replaced with it.
What does look confusing to you? Do you mean the name "to_pdev_kobj" of the
macro?

> > +/*
> > + * eeprom_attribute - EEPROM sysfs-node attributes
> > + *
> > + * NOTE Size will be changed in compliance with OF node. EEPROM attribute will
> > + * be read-only as well if the corresponding flag is specified in OF node.
> > + */
> > +BIN_ATTR(eeprom, 0644, idt_sysfs_eeprom_read, idt_sysfs_eeprom_write,
> > +	 EEPROM_DEF_SIZE);
> 
> static?
> 
> And BIN_ATTR_RW()?
> 
> thanks,
> 
> greg k-h

Of course it should be static. Thanks for noticing that.
But I intentionally utilized BIN_ATTR() instead of BIN_ATTR_RW(), because
the last one implies to define the read/write methods with names
"_name##_read"/"_name##_write", which totally get out of naming within the
driver source code. To tell the truth macro BIN_ATTR_RW() isn't that
popular in the kernel. Neither is BIN_ATTR() macro, but it suites my driver
better than the another one.

Thanks,
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
