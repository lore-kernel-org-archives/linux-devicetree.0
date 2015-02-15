From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Sun, 15 Feb 2015 23:40:06 +0100
Message-ID: <20150215224006.GA5626@amd>
References: <20150113200032.GA16205@obsidianresearch.com>
 <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
 <20150115184726.GA23247@obsidianresearch.com>
 <20150115204502.591bca1d@lxorguk.ukuu.org.uk>
 <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com>
 <20150121160151.453ba403@lxorguk.ukuu.org.uk>
 <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com>
 <20150121202700.GB4942@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150121202700.GB4942@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, Andrew Morton <akpm@linux->
List-Id: devicetree@vger.kernel.org

On Wed 2015-01-21 13:27:00, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2015 at 06:33:12PM +0200, Pantelis Antoniou wrote:
> > Hi Alan,
> >=20
> > > On Jan 21, 2015, at 18:01 , One Thousand Gnomes <gnomes@lxorguk.u=
kuu.org.uk> wrote:
> > >=20
> > > On Thu, 15 Jan 2015 22:54:46 +0200
> > > Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> > >=20
> > >> Hi Alan,
> > >>=20
> > >>> On Jan 15, 2015, at 22:45 , One Thousand Gnomes <gnomes@lxorguk=
=2Eukuu.org.uk> wrote:
> > >>>=20
> > >>> On Thu, 15 Jan 2015 11:47:26 -0700
> > >>> Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> > >>>> It is a novel idea, my concern would be that embedding the FPG=
A in the
> > >>>> DT makes it permanent unswappable kernel memory.
> > >>>> Not having the kernel hold the FPGA is best for many uses.
> > >>>=20
> > >>> If you have a filesysytem before the FPGA is set up then it bel=
ongs in
> > >>> the file system. As you presumably loaded the kernel from somew=
here there
> > >>> ought to be a file system (even an initrd).
> > >>>=20
> > >>=20
> > >> Request firmware does not imply keeping it around. You can alway=
s re-request
> > >> when reloading (although there=E2=80=99s a nasty big of caching =
that needs to be
> > >> resolved with the firmware loader).
> > >=20
> > > Which comes down to the same thing. Unless you can prove that the=
re is a
> > > path to recover the firmware file that does not have any dependan=
cies
> > > upon the firmware executing (and those can be subtle and horrid a=
t times)
> > > you need to keep it around for suspend/resume at least and potent=
ially
> > > any unexpected error/reset.
> > >=20
> >=20
> > In that case the only safe place to put it is in the kernel image i=
tself, which
> > is something the firmware loader already supports.
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

Well, your current device aalso has 1GB RAM, no?

> Other systems might have to take the ram hit.

I'd say the general case is "store bitstream in RAM" we can add
optimalizations later.
										Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
