From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v7 2/4] fpga manager: add sysfs interface document
Date: Fri, 2 Jan 2015 12:50:10 +0200
Message-ID: <20FF5ACF-DA9F-4FBA-AA87-490A73D02A2E@konsulko.com>
References: <1419007551-10040-1-git-send-email-atull@opensource.altera.com> <1419007551-10040-3-git-send-email-atull@opensource.altera.com> <20150102051200.GI4873@amd>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150102051200.GI4873@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguyen@op
List-Id: devicetree@vger.kernel.org

Hi Pavel,

> On Jan 2, 2015, at 07:12 , Pavel Machek <pavel@denx.de> wrote:
>=20
>=20
>> +What:		/sys/class/fpga_manager/<fpga>/firmware
>> +Date:		October 2014
>> +KernelVersion:	3.18
>> +Contact:	Alan Tull <atull@opensource.altera.com>
>> +Description:	Name of the FPGA image file to load using firmware cla=
ss.
>=20
> This is wrong interface, right? The only use of this string is to pas=
s
> it to udev. We should simply pass "fpga-0" as a firware name, and let
> udev figure it out, no need to to prepare name in separate component,
> then pass it to kernel, which passes it back to udev.
>=20

No. No dependencies on udev please. This should hook directly to the fi=
rmware
loader interface which does not rely on userspace at all.

>> +What:		/sys/class/fpga_manager/<fpga>/reset
>> +Date:		October 2014
>> +KernelVersion:	3.18
>> +Contact:	Alan Tull <atull@opensource.altera.com>
>> +Description:	Write 1 to reset the FPGA
>=20
> Does 0 need to be written there to pull the fpga out of reset? Is thi=
s
> a suitable interface?
>=20
> 								Pavel
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/hors=
es/blog.html

Regards

=E2=80=94 Pantelis
