From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
Date: Tue, 7 May 2019 14:21:06 +0200
Message-ID: <20190507122106.GA7873@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172007.GA1874@kroah.com>
 <BL0PR02MB5681B0F2BC0D74D8604D4289CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
 <20190504075502.GA11133@kroah.com>
 <BL0PR02MB56814D6EACC16938A0575D16CB300@BL0PR02MB5681.namprd02.prod.outlook.com>
 <20190506123425.GA26360@kroah.com>
 <BL0PR02MB568169E26DCD12498EBDFC3ACB310@BL0PR02MB5681.namprd02.prod.outlook.com>
 <20190507093941.GC20355@kroah.com>
 <BL0PR02MB568148AD27F3FE86D168BDF9CB310@BL0PR02MB5681.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BL0PR02MB568148AD27F3FE86D168BDF9CB310@BL0PR02MB5681.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 07, 2019 at 11:55:42AM +0000, Dragan Cvetic wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Tuesday 7 May 2019 10:40
> > To: Dragan Cvetic <draganc@xilinx.com>
> > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
> > 
> > On Tue, May 07, 2019 at 08:48:41AM +0000, Dragan Cvetic wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > Sent: Monday 6 May 2019 13:34
> > > > To: Dragan Cvetic <draganc@xilinx.com>
> > > > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > > > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > > > Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
> > > >
> > > > On Mon, May 06, 2019 at 12:23:56PM +0000, Dragan Cvetic wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > > Sent: Saturday 4 May 2019 08:55
> > > > > > To: Dragan Cvetic <draganc@xilinx.com>
> > > > > > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > > > > > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > > > > > Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
> > > > > >
> > > > > > On Fri, May 03, 2019 at 04:41:21PM +0000, Dragan Cvetic wrote:
> > > > > > > Hi Greg,
> > > > > > >
> > > > > > > Please find my inline comments below,
> > > > > > >
> > > > > > > Regards
> > > > > > > Dragan
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > > > > Sent: Thursday 2 May 2019 18:20
> > > > > > > > To: Dragan Cvetic <draganc@xilinx.com>
> > > > > > > > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > > > > > > > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > > > > > > > Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
> > > > > > > >
> > > > > > > > On Sat, Apr 27, 2019 at 11:04:56PM +0100, Dragan Cvetic wrote:
> > > > > > > > > +#define DRIVER_NAME "xilinx_sdfec"
> > > > > > > > > +#define DRIVER_VERSION "0.3"
> > > > > > > >
> > > > > > > > Version means nothing with the driver in the kernel tree, please remove
> > > > > > > > it.
> > > > > > >
> > > > > > > Will be removed. Thank you.
> > > > > > >
> > > > > > > >
> > > > > > > > > +#define DRIVER_MAX_DEV BIT(MINORBITS)
> > > > > > > >
> > > > > > > > Why this number?  Why limit yourself to any number?
> > > > > > > >
> > > > > > >
> > > > > > > There can be max 8 devices for this driver. I'll change to 8.
> > > > > > >
> > > > > > > > > +
> > > > > > > > > +static struct class *xsdfec_class;
> > > > > > > >
> > > > > > > > Do you really need your own class?
> > > > > > >
> > > > > > > When writing a character device driver, my goal is to create and register an instance
> > > > > > > of that structure associated with a struct file_operations, exposing a set of operations
> > > > > > > to the user-space. One of the steps to make this goal is Create a class for a devices,
> > > > > > > visible in /sys/class/.
> > > > > >
> > > > > > Why do you need a class?  Again, why not just use the misc_device api,
> > > > > > that seems much more relevant here and will make the code a lot simpler.
> > > > > >
> > > > >
> > > > > The driver can have 8 devices in SoC plus more in Programming Logic.
> > > > > It looked logical to group them under the same MAJOR, although they
> > > > > are independent of each other.  Is this argument strong enough to use
> > > > > class?
> > > >
> > > > Not really :)
> > > >
> > > > 8 devices is pretty small.  What tool will be trying to talk to all of
> > > > these devices and how was it going to find out what devices were in the
> > > > system?
> > > >
> > >
> > > These devices are Forward Error Correction encoder/decoder
> > > and will be part of the RF communication chain. They will be included
> > > in the system through DT. Also, described in DT.
> > 
> > Userspace doesn't mess with DT.
> > 
> > I am asking what userspace tool/program is going to be interacting with
> > these devices through your now-custom api you are creating.  Do you have
> > a link to that software, and how is that code doing the "determine what
> > device nodes are associated with what devices" logic?
> > 
> 
> Example code is not public yet, sorry.

Ok, then I think we need to wait for that to get this merged at the
minimum, don't you agree?  Otherwise how do we even know that any of
these codepaths are tested?

> The index number in the device name
> is a link to device, see snippet from the example code:
> 
> #define FEC_DEC  "/dev/xsdfec0"
> dec_fd = open_xsdfec(FEC_DEC);
> 
> The index number corresponds to the device order in DT.

So that implies you don't need a class at all, right?

thanks,

greg k-h
