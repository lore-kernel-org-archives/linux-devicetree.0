From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Sat, 10 Jan 2015 10:10:51 +0200
Message-ID: <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com> <1420575219-27061-3-git-send-email-atull@opensource.altera.com> <20150107084819.GA1887@amd> <alpine.DEB.2.02.1501091302370.30067@linuxheads99> <20150109205643.GA5761@amd>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150109205643.GA5761@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, pawel.moll@arm.com, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Hi Pavel,

> On Jan 9, 2015, at 22:56 , Pavel Machek <pavel@denx.de> wrote:
>=20
> On Fri 2015-01-09 13:14:24, atull wrote:
>> On Wed, 7 Jan 2015, Pavel Machek wrote:
>>=20
>>> On Tue 2015-01-06 14:13:37, atull@opensource.altera.com wrote:
>>>> +
>>>> +What:		/sys/class/fpga_manager/<fpga>/firmware
>>>> +Date:		October 2014
>>>> +KernelVersion:	3.18
>>>> +Contact:	Alan Tull <atull@opensource.altera.com>
>>>> +Description:	Name of the FPGA image file to load using firmware
>>>> class.
>>>=20
>>> This one is ugly: it unneccessarily passes firmware name through th=
e
>>> kernel. Just make interface and code simpler by always passing
>>> "socfpga-fpga-image" or something like that.
>>>=20
>>> Thanks,
>>> 									Pavel
>>=20
>> Hi Pavel,
>>=20
>> It might be ugly.  It's not unnecessary.  Some uses of FPGAs involve
>> switching out the FPGA images dynamically under control of the users=
pace.
>=20
> Then configure udev to load right firmware for you, or ln -s
> image-i-want-now socfpga-fpga-image to select the one to read=E2=80=A6=
?
>=20

Who said that udev is going to be available in the kind of system this =
is going to end in?

Doing ln -s tricks to load a different image? Really?

I say the interface is fine as it is.

Regards

=E2=80=94 Pantelis

>=20
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/hors=
es/blog.html
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

