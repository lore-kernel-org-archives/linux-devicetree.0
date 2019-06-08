From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Sat, 8 Jun 2019 19:40:57 +0000
Message-ID: <CH2PR02MB6359406779BEEC45AAB41A98CB110@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190606132842.GC7943@kroah.com>
 <CH2PR02MB6359747C72220A978CCA807BCB100@CH2PR02MB6359.namprd02.prod.outlook.com>
 <20190607155731.GB8752@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190607155731.GB8752@kroah.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Derek Kiernan <dkiernan@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Friday 7 June 2019 16:58
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
> 
> On Fri, Jun 07, 2019 at 10:58:34AM +0000, Dragan Cvetic wrote:
> > > On Sat, May 25, 2019 at 12:37:17PM +0100, Dragan Cvetic wrote:
> > > > +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
> > > > +{
> > > > +	return 0;
> > > > +}
> > >
> > > empty open/close functions are never needed, just drop them.
> > >
> >
> > open() is needed to allocate file descriptor eg.
> > fd = open(dev_name, O_RDWR);
> 
> But you do nothing in those open/release callbacks.  Remove them and see
> that the code works just fine :)
> 

Accepted.
I will squash this commit with the first next which needs open/close, ioctal.

> thanks,
> 
> greg k-h

Thanks
Dragan
