From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Wed, 21 Jan 2015 22:32:23 +0200
Message-ID: <7E60D554-8660-4CDB-BF68-D39DD29039BE@konsulko.com>
References: <20150113162847.2778b5a5@lxorguk.ukuu.org.uk> <20150113200032.GA16205@obsidianresearch.com> <alpine.DEB.2.02.1501131455130.30192@linuxheads99> <20150113222450.GA17475@obsidianresearch.com> <alpine.DEB.2.02.1501150936390.16760@linuxheads99> <20150115184726.GA23247@obsidianresearch.com> <20150115204502.591bca1d@lxorguk.ukuu.org.uk> <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com> <20150121160151.453ba403@lxorguk.ukuu.org.uk> <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com> <20150121202700.GB4942@obsidianresearch.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150121202700.GB4942@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@denx.de>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, Andrew Morton <akpm@linux-foundation.org>Linu
List-Id: devicetree@vger.kernel.org

Hi Jason,

> On Jan 21, 2015, at 22:27 , Jason Gunthorpe <jgunthorpe@obsidianresea=
rch.com> wrote:
>=20
> On Wed, Jan 21, 2015 at 06:33:12PM +0200, Pantelis Antoniou wrote:
>> Hi Alan,
>>=20
>>> On Jan 21, 2015, at 18:01 , One Thousand Gnomes <gnomes@lxorguk.uku=
u.org.uk> wrote:
>>>=20
>>> On Thu, 15 Jan 2015 22:54:46 +0200
>>> Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
>>>=20
>>>> Hi Alan,
>>>>=20
>>>>> On Jan 15, 2015, at 22:45 , One Thousand Gnomes <gnomes@lxorguk.u=
kuu.org.uk> wrote:
>>>>>=20
>>>>> On Thu, 15 Jan 2015 11:47:26 -0700
>>>>> Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
>>>>>> It is a novel idea, my concern would be that embedding the FPGA =
in the
>>>>>> DT makes it permanent unswappable kernel memory.
>>>>>> Not having the kernel hold the FPGA is best for many uses.
>>>>>=20
>>>>> If you have a filesysytem before the FPGA is set up then it belon=
gs in
>>>>> the file system. As you presumably loaded the kernel from somewhe=
re there
>>>>> ought to be a file system (even an initrd).
>>>>>=20
>>>>=20
>>>> Request firmware does not imply keeping it around. You can always =
re-request
>>>> when reloading (although there=E2=80=99s a nasty big of caching th=
at needs to be
>>>> resolved with the firmware loader).
>>>=20
>>> Which comes down to the same thing. Unless you can prove that there=
 is a
>>> path to recover the firmware file that does not have any dependanci=
es
>>> upon the firmware executing (and those can be subtle and horrid at =
times)
>>> you need to keep it around for suspend/resume at least and potentia=
lly
>>> any unexpected error/reset.
>>>=20
>>=20
>> In that case the only safe place to put it is in the kernel image it=
self, which
>> is something the firmware loader already supports.
>=20
> My point is that the current firmware layer is overly cautious and
> FPGAs are very big. My current project on small Xilinx device has a
> 10MB programming file. The biggest Xilinx device today has a max
> bitfile size around 122MB.
>=20
> So keeping that much memory pinned in the kernel when I can prove it
> is uncessary for my system (either because there is no suspend/resume
> possibility, or because I know the CPU can always access the
> filesytem) is very undesirable.
>=20
> Other systems might have to take the ram hit.
>=20
> Since it seems like the kernel has no way to know, we probably have
> have a way to tell it not to cache the bitfile.
>=20

The firmware loader was not originally meant to handle these cases, but
I=E2=80=99m sure it=E2=80=99s not an insurmountable obstacle.

> Jason

Regards

=E2=80=94 Pantelis

