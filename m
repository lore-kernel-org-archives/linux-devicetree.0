From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Fri, 7 Jun 2019 17:57:31 +0200
Message-ID: <20190607155731.GB8752@kroah.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190606132842.GC7943@kroah.com>
 <CH2PR02MB6359747C72220A978CCA807BCB100@CH2PR02MB6359.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CH2PR02MB6359747C72220A978CCA807BCB100@CH2PR02MB6359.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 07, 2019 at 10:58:34AM +0000, Dragan Cvetic wrote:
> > On Sat, May 25, 2019 at 12:37:17PM +0100, Dragan Cvetic wrote:
> > > +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
> > > +{
> > > +	return 0;
> > > +}
> > 
> > empty open/close functions are never needed, just drop them.
> > 
> 
> open() is needed to allocate file descriptor eg.
> fd = open(dev_name, O_RDWR);

But you do nothing in those open/release callbacks.  Remove them and see
that the code works just fine :)

thanks,

greg k-h
