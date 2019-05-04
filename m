From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Sat, 4 May 2019 11:01:07 +0200
Message-ID: <20190504090107.GC13840@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172345.GC1874@kroah.com>
 <BL0PR02MB568178214B7789431977E91BCB350@BL0PR02MB5681.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BL0PR02MB568178214B7789431977E91BCB350@BL0PR02MB5681.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2019 at 04:46:12PM +0000, Dragan Cvetic wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Thursday 2 May 2019 18:24
> > To: Dragan Cvetic <draganc@xilinx.com>
> > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
> > 
> > On Sat, Apr 27, 2019 at 11:04:58PM +0100, Dragan Cvetic wrote:
> > > Add char device interface per DT node present and support
> > > file operations:
> > > - open(),
> > > - close(),
> > > - unlocked_ioctl(),
> > > - compat_ioctl().
> > 
> > Why do you need compat_ioctl() at all?  Any "new" driver should never
> > need it.  Just create your structures properly.
> 
> This was a comment from Arnd, see https://lkml.org/lkml/2019/3/19/377.
> Please advise.

Why do you need a compat_ioctl callback when there is nothing to fix up?

thanks,

greg k-h
