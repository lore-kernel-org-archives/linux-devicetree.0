From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v2 1/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Wed, 30 Nov 2016 00:45:11 +0300
Message-ID: <20161129214511.GC9146@mobilestation>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-2-git-send-email-fancer.lancer@gmail.com>
 <20161129193750.GD20341@kroah.com>
 <20161129211625.GB9146@mobilestation>
 <20161129212412.GA20334@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161129212412.GA20334@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: srinivas.kandagatla@linaro.org, andrew@lunn.ch, robh+dt@kernel.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2016 at 10:24:12PM +0100, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Nov 30, 2016 at 12:16:25AM +0300, Serge Semin wrote:
> > On Tue, Nov 29, 2016 at 08:37:50PM +0100, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > On Tue, Nov 29, 2016 at 01:38:20AM +0300, Serge Semin wrote:
> > > > +struct idt_89hpesx_dev {
> > > > +	u32 eesize;
> > > > +	bool eero;
> > > > +	u8 eeaddr;
> > > > +
> > > > +	u8 inieecmd;
> > > > +	u8 inicsrcmd;
> > > > +	u8 iniccode;
> > > > +
> > > > +	atomic_t csr;
> > > > +
> > > > +	int (*smb_write)(struct idt_89hpesx_dev *, const struct idt_smb_seq *);
> > > > +	int (*smb_read)(struct idt_89hpesx_dev *, struct idt_smb_seq *);
> > > > +	struct mutex smb_mtx;
> > > > +
> > > > +	struct i2c_client *client;
> > > > +
> > > > +	struct bin_attribute *ee_file;
> > > > +	struct dentry *csr_dir;
> > > > +	struct dentry *csr_file;
> > > > +};
> > > > +#define to_pdev_kobj(__kobj) \
> > > > +	dev_get_drvdata(container_of(__kobj, struct device, kobj))
> > > 
> > > Is it a struct device, or a kobject?  This is totally confusing to me.
> > > 
> > > And can't you just use kobj_to_dev()?
> > > 
> > 
> > I just didn't know about kobj_to_dev() inline function. Totally agree that
> > container_of() should be replaced with it.
> > What does look confusing to you? Do you mean the name "to_pdev_kobj" of the
> > macro?
> 
> Yes, the macro is odd.  As you are doing two different things here, just
> spell it out in the code and use kobj_to_dev() to make it easier to
> read please.
> 
> > > > +/*
> > > > + * eeprom_attribute - EEPROM sysfs-node attributes
> > > > + *
> > > > + * NOTE Size will be changed in compliance with OF node. EEPROM attribute will
> > > > + * be read-only as well if the corresponding flag is specified in OF node.
> > > > + */
> > > > +BIN_ATTR(eeprom, 0644, idt_sysfs_eeprom_read, idt_sysfs_eeprom_write,
> > > > +	 EEPROM_DEF_SIZE);
> > > 
> > > static?
> > > 
> > > And BIN_ATTR_RW()?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Of course it should be static. Thanks for noticing that.
> > But I intentionally utilized BIN_ATTR() instead of BIN_ATTR_RW(), because
> > the last one implies to define the read/write methods with names
> > "_name##_read"/"_name##_write", which totally get out of naming within the
> > driver source code.
> 
> That's ok, use the names the macro wants you to, that's the best way,
> and it ensures that I don't have to audit your permissions are correct
> for the file.
> 
> > To tell the truth macro BIN_ATTR_RW() isn't that popular in the
> > kernel.
> 
> Yes, but it should be, I have patches floating around somewhere to fix
> almost all of these up.
> 
> > Neither is BIN_ATTR() macro, but it suites my driver better than the
> > another one.
> 
> a "raw" BIN_ATTR() shouldn't be used either, please use the _RW()
> variant.
> 
> thanks,
> 
> greg k-h

Agreed with all the notes. I will send patchset v3 within next hour.

Thanks,
-Sergey
