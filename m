From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V7 00/11] misc: xilinx sd-fec drive
Date: Fri, 21 Jun 2019 17:49:45 +0000
Message-ID: <CH2PR02MB635999D7374378CEA096FE72CBE70@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1560274185-264438-1-git-send-email-dragan.cvetic@xilinx.com>
 <20190621141553.GA16650@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621141553.GA16650@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Friday 21 June 2019 15:16
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V7 00/11] misc: xilinx sd-fec drive
>=20
> On Tue, Jun 11, 2019 at 06:29:34PM +0100, Dragan Cvetic wrote:
> > This patchset is adding the full Soft Decision Forward Error
> > Correction (SD-FEC) driver implementation, driver DT binding and
> > driver documentation.
> >
> > Forward Error Correction (FEC) codes such as Low Density Parity
> > Check (LDPC) and turbo codes provide a means to control errors in
> > data transmissions over unreliable or noisy communication
> > channels. The SD-FEC Integrated Block is an optimized block for
> > soft-decision decoding of these codes. Fixed turbo codes are
> > supported directly, whereas custom and standardized LDPC codes
> > are supported through the ability to specify the parity check
> > matrix through an AXI4-Lite bus or using the optional programmable
> > (PL)-based support logic. For the further information see
> > https://www.xilinx.com/support/documentation/ip_documentation/
> > sd_fec/v1_1/pg256-sdfec-integrated-block.pdf
> >
> > This driver is a platform device driver which supports SDFEC16
> > (16nm) IP. SD-FEC driver supports LDPC decoding and encoding and
> > Turbo code decoding. LDPC codes can be specified on
> > a codeword-by-codeword basis, also a custom LDPC code can be used.
> >
> > The SD-FEC driver exposes a char device interface and supports
> > file operations: open(), close(), poll() and ioctl(). The driver
> > allows only one usage of the device, open() limits the number of
> > driver instances. The driver also utilize Common Clock Framework
> > (CCF).
> >
> > The control and monitoring is supported over ioctl system call.
> > The features supported by ioctl():
> > - enable or disable data pipes to/from device
> > - configure the FEC algorithm parameters
> > - set the order of data
> > - provide a control of a SDFEC bypass option
> > - activates/deactivates SD-FEC
> > - collect and provide statistical data
> > - enable/disable interrupt mode
>=20
> Is there any userspace tool that talks to this device using these custom
> ioctls yet?
>=20
Tools no, but could be the customer who is using the driver.


> Doing a one-off ioctl api is always a risky thing, you are pretty much
> just creating brand new system calls for one piece of hardware.
>=20

Why is that wrong and what is the risk?
What would you propose?
Definitely, I have to read about this.

> Anyway, I took the first 3 patches here because they looked sane.  and
> stopped when I ran into the ioctl problem...
>=20


Thanks for these 3

Dragan

> thanks,
>=20
> greg k-h
