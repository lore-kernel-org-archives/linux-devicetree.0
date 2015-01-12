From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Mon, 12 Jan 2015 10:05:49 -0600
Message-ID: <CAL_Jsq+ZfCajLXhLCi4MFbLRYGgs+BcDTsKg3r5rSBPv9yjGEQ@mail.gmail.com>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd> <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd> <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
 <20150110151118.GA16036@amd> <alpine.DEB.2.10.1501111009180.2556@shineypoop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1501111009180.2556@shineypoop>
Sender: linux-kernel-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Pavel Machek <pavel@denx.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 11, 2015 at 10:29 AM, atull <atull@opensource.altera.com> w=
rote:
> On Sat, 10 Jan 2015, Pavel Machek wrote:
>
>> On Sat 2015-01-10 10:10:51, Pantelis Antoniou wrote:
>> > Hi Pavel,
>> >
>> > > On Jan 9, 2015, at 22:56 , Pavel Machek <pavel@denx.de> wrote:
>> > >
>> > > On Fri 2015-01-09 13:14:24, atull wrote:
>> > >> On Wed, 7 Jan 2015, Pavel Machek wrote:
>> > >>
>> > >>> On Tue 2015-01-06 14:13:37, atull@opensource.altera.com wrote:
>> > >>>> +
>> > >>>> +What:         /sys/class/fpga_manager/<fpga>/firmware
>> > >>>> +Date:         October 2014
>> > >>>> +KernelVersion:        3.18
>> > >>>> +Contact:      Alan Tull <atull@opensource.altera.com>
>> > >>>> +Description:  Name of the FPGA image file to load using firm=
ware
>> > >>>> class.
>> > >>>
>> > >>> This one is ugly: it unneccessarily passes firmware name throu=
gh the
>> > >>> kernel. Just make interface and code simpler by always passing
>> > >>> "socfpga-fpga-image" or something like that.
>> > >>>
>> > >>> Thanks,
>> > >>>                                                               =
          Pavel
>> > >>
>> > >> Hi Pavel,
>> > >>
>> > >> It might be ugly.  It's not unnecessary.  Some uses of FPGAs in=
volve
>> > >> switching out the FPGA images dynamically under control of the =
userspace.
>> > >
>> > > Then configure udev to load right firmware for you, or ln -s
>> > > image-i-want-now socfpga-fpga-image to select the one to read=E2=
=80=A6?
>> > >
>> >
>> > Who said that udev is going to be available in the kind of system =
this is going to end in?
>>
>> Noone.
>>
>> > Doing ln -s tricks to load a different image? Really?
>>
>> But if you don't have udev, you can do ln -s. It is better than
>> open-coding symlink functionality into
>> /sys/class/fpga_manager/<fpga>/firmware ... cause that's what this i=
s.
>>
>> Actually, clean implementation of "firmware" would be symlink in
>> sysfs; but I'd say that would be overdoing it.
>>
>> > I say the interface is fine as it is.
>>
>> I say it is not.
>>                                                                     =
  Pavel
>
> Hi Pavel,
>
> I see that we could do it that way and it would eliminate one of the
> sysfs files (../fpga_manager/<fpga>/firmware).  Either way we are ass=
uming
> that there are fpga images in the filesystem in the firmware search p=
ath,
> so I don't see why adding a piece of indirection (symlink) makes thin=
gs
> better.
>
> We want to be able to switch out the FPGA image
> under control of userspace.  So we don't want an interface that makes
> it more cumbersome or tries to pretend that there's only one image.
>
> Previous uses of the firmware layer has been to use it to load once a=
fter
> bootup; this is different since some use cases will want to switch ou=
t
> the FPGA image.  If someone wants there to be only one FPGA image on
> the FGPA forever, they will probably not be using this framework; the=
ir
> FPGA will probably be loaded before Linux boots up.

That's not really true. Some WiFi devices have to load different
firmware for client and AP modes and switching is a common usecase in
phones.

There may be other instances of drivers wanting configurable firmware
names already. A common interface here would be nice. It could also be
useful to expose the firmware names such that you could generate a
list of all firmware files needed for a machine (that may already be
possible with uevents?).

Rob
