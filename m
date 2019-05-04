From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
Date: Sat, 4 May 2019 09:55:02 +0200
Message-ID: <20190504075502.GA11133@kroah.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172007.GA1874@kroah.com>
 <BL0PR02MB5681B0F2BC0D74D8604D4289CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <BL0PR02MB5681B0F2BC0D74D8604D4289CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Derek Kiernan <dkiernan@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2019 at 04:41:21PM +0000, Dragan Cvetic wrote:
> Hi Greg,
> 
> Please find my inline comments below,
> 
> Regards
> Dragan
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Thursday 2 May 2019 18:20
> > To: Dragan Cvetic <draganc@xilinx.com>
> > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
> > 
> > On Sat, Apr 27, 2019 at 11:04:56PM +0100, Dragan Cvetic wrote:
> > > +#define DRIVER_NAME "xilinx_sdfec"
> > > +#define DRIVER_VERSION "0.3"
> > 
> > Version means nothing with the driver in the kernel tree, please remove
> > it.
> 
> Will be removed. Thank you.
> 
> > 
> > > +#define DRIVER_MAX_DEV BIT(MINORBITS)
> > 
> > Why this number?  Why limit yourself to any number?
> > 
> 
> There can be max 8 devices for this driver. I'll change to 8.
> 
> > > +
> > > +static struct class *xsdfec_class;
> > 
> > Do you really need your own class?
> 
> When writing a character device driver, my goal is to create and register an instance
> of that structure associated with a struct file_operations, exposing a set of operations
> to the user-space. One of the steps to make this goal is Create a class for a devices,
> visible in /sys/class/.

Why do you need a class?  Again, why not just use the misc_device api,
that seems much more relevant here and will make the code a lot simpler.

thanks,

greg k-h
