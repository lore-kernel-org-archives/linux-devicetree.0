From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Mon, 8 Dec 2014 19:56:33 +0200
Message-ID: <6B035765-3AFB-4A28-8A16-51D2E2737932@konsulko.com>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com> <1414007405-32186-3-git-send-email-atull@opensource.altera.com> <20141024105200.GA20775@amd> <B914D894-E486-4EF1-8F84-169E939C58B4@konsulko.com> <alpine.DEB.2.02.1410240906340.23446@atx-linux-37> <CACxGe6tiLxbCThzjOqrQg44Ue3XJuuRgti5jZY=UrssSY8=xqg@mail.gmail.com> <20141206135533.GA19672@amd> <20141208175050.92EDAC40D73@trevor.secretlab.ca>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141208175050.92EDAC40D73@trevor.secretlab.ca>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Pavel Machek <pavel@denx.de>, atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ira Snyder <iws@ovro.caltech.edu>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason <jason@lakedaemon.net>, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>Rob Landley <ro>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Dec 8, 2014, at 19:50 , Grant Likely <grant.likely@linaro.org> wro=
te:
>=20
> On Sat, 6 Dec 2014 14:55:33 +0100
> , Pavel Machek <pavel@denx.de>
> wrote:
>> Hi!
>>=20
>>>> I am accustomed to doing 'echo -n' for most of sysfs anyway.  Once=
 in a
>>>> while I am a bonehead and forget the '-n' and spend a few minutes
>>>> wondering why this thing that worked last week suddenly rejects al=
l
>>>> commands.  I'm just trying to make my user interface a bit user-fr=
iendly.
>>>>=20
>>>> I will take out the '\n' stripping and update the documentation.  =
I didn't
>>>> realize this would be controversial.
>>>=20
>>> Don't. You're doing the right thing by scrubbing your input. Requir=
ing
>>> 'echo -n' is just stupid when it is so easy to make work easily.
>>=20
>> 'foo\nbar\n' is unusual but valid filename in linux. It is bad idea =
to
>> echo filenames into files in the first place... and arbitrarily
>> disallowing certain filenames is not helping.
>=20
> Meh. Just because it is a valid linux filename doesn't mean this
> interface is forced to accept it. There should be tighter rules about
> how the filename can be constructed. Allowing any arbitrary path for =
any
> arbitrary valid linux filename makes for a large attack surface.
>=20
> I would like to know, what is the purpose of the interface? Why is it
> important to provide the firmware filename in this manor? Are there
> going to be a lot of different FPGA bitstreams that may need to be
> loaded? How does userspace choose between them, and is there a better
> way to do the selection without passing the firmware filename through
> the kernel? Is this merely intended to get udev to behave in a certai=
n
> way? If so, then maybe there is a better way to go about it.
>=20
> We could for example use a UDEV 'PROGRAM=3D' rule to execute a usersp=
ace
> app and have that program figure out which firmware file to provide t=
o
> the kernel.
>=20

Please, lets not depend at all on udev. Firmware can be embedded in the=
 kernel
image, which is pretty important to work before userland if you have to=
 have
the rootfs on a device that=E2=80=99s instantiated via an FPGA bitstrea=
m.

> g.

Regards

=E2=80=94 Pantelis

