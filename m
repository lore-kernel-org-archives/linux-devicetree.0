From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Mon, 12 Jan 2015 14:48:47 +0100
Message-ID: <bed1d7ce1b984c79acc75a47495cb959@BL2FFO11FD043.protection.gbl>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
 <20150110151118.GA16036@amd> <alpine.DEB.2.10.1501111009180.2556@shineypoop>
 <20150112084530.GA28681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150112084530.GA28681@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>, atull <atull@opensource.altera.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@lin>
List-Id: devicetree@vger.kernel.org

On 01/12/2015 09:45 AM, Pavel Machek wrote:
> On Sun 2015-01-11 10:29:00, atull wrote:
>> On Sat, 10 Jan 2015, Pavel Machek wrote:
>>
>>> On Sat 2015-01-10 10:10:51, Pantelis Antoniou wrote:
>>>> Hi Pavel,
>>>>
>>>>> On Jan 9, 2015, at 22:56 , Pavel Machek <pavel@denx.de> wrote:
>>>>>
>>>>> On Fri 2015-01-09 13:14:24, atull wrote:
>>>>>> On Wed, 7 Jan 2015, Pavel Machek wrote:
>>>>>>
>>>>>>> On Tue 2015-01-06 14:13:37, atull@opensource.altera.com wrote:
>>>>>>>> +
>>>>>>>> +What:		/sys/class/fpga_manager/<fpga>/firmware
>>>>>>>> +Date:		October 2014
>>>>>>>> +KernelVersion:	3.18
>>>>>>>> +Contact:	Alan Tull <atull@opensource.altera.com>
>>>>>>>> +Description:	Name of the FPGA image file to load using firmwa=
re
>>>>>>>> class.
>>>>>>>
>>>>>>> This one is ugly: it unneccessarily passes firmware name throug=
h the
>>>>>>> kernel. Just make interface and code simpler by always passing
>>>>>>> "socfpga-fpga-image" or something like that.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> 									Pavel
>>>>>>
>>>>>> Hi Pavel,
>>>>>>
>>>>>> It might be ugly.  It's not unnecessary.  Some uses of FPGAs inv=
olve
>>>>>> switching out the FPGA images dynamically under control of the u=
serspace.
>>>>>
>>>>> Then configure udev to load right firmware for you, or ln -s
>>>>> image-i-want-now socfpga-fpga-image to select the one to read=E2=80=
=A6?
>>>>>
>>>>
>>>> Who said that udev is going to be available in the kind of system =
this is going to end in?
>>>
>>> Noone.
>>>
>>>> Doing ln -s tricks to load a different image? Really?
>>>
>>> But if you don't have udev, you can do ln -s. It is better than
>>> open-coding symlink functionality into
>>> /sys/class/fpga_manager/<fpga>/firmware ... cause that's what this =
is.
>>>
>>> Actually, clean implementation of "firmware" would be symlink in
>>> sysfs; but I'd say that would be overdoing it.
>>>
>>>> I say the interface is fine as it is.
>>>
>>> I say it is not.
>>> 									Pavel
>>
>> Hi Pavel,
>>
>> I see that we could do it that way and it would eliminate one of the
>> sysfs files (../fpga_manager/<fpga>/firmware).  Either way we are as=
suming
>> that there are fpga images in the filesystem in the firmware search =
path,
>> so I don't see why adding a piece of indirection (symlink) makes thi=
ngs
>> better.
>=20
> Well.. you are basically re-implementing symlink with
> ../fpga_manager/<fpga>/firmware "file" in sysfs, and doing it
> badly. It has no advantages over real symlink.
>=20
>> We want to be able to switch out the FPGA image
>> under control of userspace.  So we don't want an interface that make=
s
>> it more cumbersome or tries to pretend that there's only one image.
>=20
> What is cumbersome about symlink? Why is "fake" symlink in sysfs bett=
er?
>=20
>> Previous uses of the firmware layer has been to use it to load once =
after
>> bootup; this is different since some use cases will want to switch o=
ut
>> the FPGA image.  If someone wants there to be only one FPGA image on
>> the FGPA forever, they will probably not be using this framework; th=
eir
>> FPGA will probably be loaded before Linux boots up.
>=20
> Why? I have just one image on the fpga, and would prefer to load it
> from Linux.

Pavel: These patches target staging and sysfs interface doesn't need to=
 be stable
at this time. I would prefer to add these patches to staging for 3.20
and feel free to send the patch which fix this.
With your code will be exactly clear how you want to use it and we can
talk about it.

Thanks,
Michal



