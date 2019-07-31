From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V7 00/11] misc: xilinx sd-fec drive
Date: Wed, 31 Jul 2019 13:56:33 +0000
Message-ID: <CH2PR02MB6359408E8F94AFB745DC273ACBDF0@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1560274185-264438-1-git-send-email-dragan.cvetic@xilinx.com>
 <20190621141553.GA16650@kroah.com>
 <CH2PR02MB635999D7374378CEA096FE72CBE70@CH2PR02MB6359.namprd02.prod.outlook.com>
 <20190622060135.GB26200@kroah.com>
 <CH2PR02MB6359A32E03E920AE5EEB7324CBE60@CH2PR02MB6359.namprd02.prod.outlook.com>
 <20190731124853.GA4905@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731124853.GA4905@kroah.com>
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
> Sent: Wednesday 31 July 2019 13:49
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V7 00/11] misc: xilinx sd-fec drive
> 
> On Sat, Jun 22, 2019 at 05:54:04PM +0000, Dragan Cvetic wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Saturday 22 June 2019 07:02
> > > To: Dragan Cvetic <draganc@xilinx.com>
> > > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > > Subject: Re: [PATCH V7 00/11] misc: xilinx sd-fec drive
> > >
> > > On Fri, Jun 21, 2019 at 05:49:45PM +0000, Dragan Cvetic wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > Sent: Friday 21 June 2019 15:16
> > > > > To: Dragan Cvetic <draganc@xilinx.com>
> > > > > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org;
> > > > > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > > > > Subject: Re: [PATCH V7 00/11] misc: xilinx sd-fec drive
> > > > >
> > > > > On Tue, Jun 11, 2019 at 06:29:34PM +0100, Dragan Cvetic wrote:
> > > > > > This patchset is adding the full Soft Decision Forward Error
> > > > > > Correction (SD-FEC) driver implementation, driver DT binding and
> > > > > > driver documentation.
> > > > > >
> > > > > > Forward Error Correction (FEC) codes such as Low Density Parity
> > > > > > Check (LDPC) and turbo codes provide a means to control errors in
> > > > > > data transmissions over unreliable or noisy communication
> > > > > > channels. The SD-FEC Integrated Block is an optimized block for
> > > > > > soft-decision decoding of these codes. Fixed turbo codes are
> > > > > > supported directly, whereas custom and standardized LDPC codes
> > > > > > are supported through the ability to specify the parity check
> > > > > > matrix through an AXI4-Lite bus or using the optional programmable
> > > > > > (PL)-based support logic. For the further information see
> > > > > > https://www.xilinx.com/support/documentation/ip_documentation/
> > > > > > sd_fec/v1_1/pg256-sdfec-integrated-block.pdf
> > > > > >
> > > > > > This driver is a platform device driver which supports SDFEC16
> > > > > > (16nm) IP. SD-FEC driver supports LDPC decoding and encoding and
> > > > > > Turbo code decoding. LDPC codes can be specified on
> > > > > > a codeword-by-codeword basis, also a custom LDPC code can be used.
> > > > > >
> > > > > > The SD-FEC driver exposes a char device interface and supports
> > > > > > file operations: open(), close(), poll() and ioctl(). The driver
> > > > > > allows only one usage of the device, open() limits the number of
> > > > > > driver instances. The driver also utilize Common Clock Framework
> > > > > > (CCF).
> > > > > >
> > > > > > The control and monitoring is supported over ioctl system call.
> > > > > > The features supported by ioctl():
> > > > > > - enable or disable data pipes to/from device
> > > > > > - configure the FEC algorithm parameters
> > > > > > - set the order of data
> > > > > > - provide a control of a SDFEC bypass option
> > > > > > - activates/deactivates SD-FEC
> > > > > > - collect and provide statistical data
> > > > > > - enable/disable interrupt mode
> > > > >
> > > > > Is there any userspace tool that talks to this device using these custom
> > > > > ioctls yet?
> > > > >
> > > > Tools no, but could be the customer who is using the driver.
> > >
> > > I don't understand this.  Who has written code to talk to these
> > > special ioctls from userspace?  Is there a pointer to that code
> > > anywhere?
> > >
> >
> > The code which use this driver are written by the driver maintainers
> > they are examples APP and test code which are not public.
> 
> So, no open code is talking to this one specific driver?  And you have
> run this past your lawyers?  Please go talk to them about this and see
> what they say (hint, creating a custom ioctl that only you use is a
> "fun" legal area...)


Greg,
this driver and all example code APP will be public and open source 
fully. In that sense this code is same as any other driver. 


> 
> > > > > Doing a one-off ioctl api is always a risky thing, you are pretty much
> > > > > just creating brand new system calls for one piece of hardware.
> > > > >
> > > >
> > > > Why is that wrong and what is the risk?
> > >
> > > You now have custom syscalls for one specfic piece of hardware that you
> > > now have to maintain working properly for the next 40+ years.  You have
> > > to make sure those calls are correct and that this is the correct api to
> > > talk to this hardware.
> >
> > This is very specific HW, it's high speed Forward Error Correction HW.
> 
> I have no idea what that actually means.
> 
> What is "Forward Error Correction"?  What does it do?  Is this a network
> device?  Video device?  Random black box that sends radio waves?
> 
> Is there no other in-kernel driver that does much the same type of
> thing?  What "class" of driver would this be?

This is the RF data communication device, type "misc" driver.

> 
> > > > What would you propose?
> > > > Definitely, I have to read about this.
> > >
> > > What is this hardware and what is it used for?  Who will be talking to
> >
> > The Soft-Decision Forward Error Correction (SD-FEC) integrated block
> > supports Low Density Parity Check (LDPC) decoding and encoding and
> > Turbo code decoding.
> 
> I still don't understand what this means.
> 
> > SD-FEC use case is in high data rate applications such as 4G, 5G and
> > DOCSIS3.1 Cable Access.  A high performance SD-FEC (i.e. >1Gbps), is a
> > block used to enable these systems to function under non-ideal
> > environments.
> 
> Nor do I understand what this is either.  Do you have a pointer to this
> hardware somewhere online that might describe it better?  Given that I
> have no clue, odds are others do not know what it is either.

https://www.xilinx.com/support/documentation/ip_documentation/sd_fec/v1_1/pg256-sdfec-integrated-block.pdf

> 
> > > it from userspace?  What userspace workload uses it?  What tools need to
> >
> > There will be APP which configures the HW for the use cases listed above.
> 
> What exactly are these use cases?
> 
> Where is the application?  Who runs it?  Is it already in a distro
> somewhere?  Who is going to distribute it?  Who is going to support it?
> Is it only for sale?  What is the license of it?

According to marketing people here there are about 72 individual programs 
spanning probably ~40 different customers. These are possible users
and APP will be created and run by them.
Driver will be supported by us, APP by customers with our technical support.
Is it for sale? Xilinx gives away all drivers and examples for free, it's up to the
Customer what they do with it and they meet open source licence legal requirements.

Greg,
I'll be out of the office from Friday for a couple of weeks, and I'll try my best to respond on your replies after that.

> 
> thanks,
> 
> greg k-h
