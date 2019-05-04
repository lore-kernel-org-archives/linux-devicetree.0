From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Sat, 4 May 2019 11:02:03 +0200
Message-ID: <20190504090203.GD13840@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172304.GB1874@kroah.com>
 <BL0PR02MB5681F4C4AF4786AC6241DDA1CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BL0PR02MB5681F4C4AF4786AC6241DDA1CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2019 at 04:44:57PM +0000, Dragan Cvetic wrote:
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Thursday 2 May 2019 18:23
> > To: Dragan Cvetic <draganc@xilinx.com>
> > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
> > 
> > On Sat, Apr 27, 2019 at 11:04:58PM +0100, Dragan Cvetic wrote:
> > > +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> > > +{
> > > +	struct xsdfec_dev *xsdfec;
> > > +
> > > +	xsdfec = container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev);
> > > +
> > > +	if (!atomic_dec_and_test(&xsdfec->open_count)) {
> > 
> > Why do you care about this?
> > 
> > And do you really think it matters?  What are you trying to protect from
> > here?
> 
> There is a request to increase the driver security. 

How does this affect "security" in any way?

> It is acceptable for us for now, even with non-perfections (will not
> be protected if opened twice with dup() or fork()).  This is covered
> in the documentation.

As this really "does nothing", no need to bother the kernel with trying
to keep this logic working properly.  So please just drop it.

thanks,

greg k-h
