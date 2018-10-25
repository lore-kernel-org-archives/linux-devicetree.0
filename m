From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
Date: Thu, 25 Oct 2018 06:30:30 +0100
Message-ID: <20181025053030.GD4939@dell>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-9-jae.hyun.yoo@linux.intel.com>
 <20181024105903.GB4939@dell>
 <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2018, Jae Hyun Yoo wrote:
> On 10/24/2018 3:59 AM, Lee Jones wrote:
> > On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:
> > 
> > > This commit adds PECI client MFD driver.
> > > 
> 
> <snip>

[...]

> > > +bool peci_temp_need_update(struct temp_data *temp)
> > > +{
> > > +	if (temp->valid &&
> > > +	    time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +EXPORT_SYMBOL_GPL(peci_temp_need_update);
> > > +
> > > +void peci_temp_mark_updated(struct temp_data *temp)
> > > +{
> > > +	temp->valid = 1;
> > > +	temp->last_updated = jiffies;
> > > +}
> > > +EXPORT_SYMBOL_GPL(peci_temp_mark_updated);
> > 
> > These are probably better suited as inline functions to be placed in
> > a header file.  No need to export them, since they only use their own
> > data.

Also move them into the HWMON header file.

They have no business in MFD.

[...]

> > > +int peci_client_rd_pkg_cfg_cmd(struct peci_mfd *priv, u8 mbx_idx,
> > 
> > This is gobbledegook.  What's rd?  Read?
> > 
> 
> Yes, the 'rd' means 'read'. I intended to keep command names as listed
> in the PECI specification such as RdPkgConfig, WrPkgConfig and so on.
> Should I change it to 'peci_client_read_package_config_command' ?

I looks/reads a lot nicer, don't you think?

[...]

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
