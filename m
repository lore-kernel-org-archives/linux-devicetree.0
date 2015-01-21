From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Wed, 21 Jan 2015 13:27:00 -0700
Message-ID: <20150121202700.GB4942@obsidianresearch.com>
References: <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
 <20150113200032.GA16205@obsidianresearch.com>
 <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
 <20150115184726.GA23247@obsidianresearch.com>
 <20150115204502.591bca1d@lxorguk.ukuu.org.uk>
 <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com>
 <20150121160151.453ba403@lxorguk.ukuu.org.uk>
 <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D466D9FF-25DA-4765-9469-128733BEBC4D-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>Linu
List-Id: devicetree@vger.kernel.org

On Wed, Jan 21, 2015 at 06:33:12PM +0200, Pantelis Antoniou wrote:
> Hi Alan,
>=20
> > On Jan 21, 2015, at 18:01 , One Thousand Gnomes <gnomes-qBU/x9rampWTnxY3oEoUhg@public.gmane.org=
u.org.uk> wrote:
> >=20
> > On Thu, 15 Jan 2015 22:54:46 +0200
> > Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >=20
> >> Hi Alan,
> >>=20
> >>> On Jan 15, 2015, at 22:45 , One Thousand Gnomes <gnomes@lxorguk.u=
kuu.org.uk> wrote:
> >>>=20
> >>> On Thu, 15 Jan 2015 11:47:26 -0700
> >>> Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> wrote:
> >>>> It is a novel idea, my concern would be that embedding the FPGA =
in the
> >>>> DT makes it permanent unswappable kernel memory.
> >>>> Not having the kernel hold the FPGA is best for many uses.
> >>>=20
> >>> If you have a filesysytem before the FPGA is set up then it belon=
gs in
> >>> the file system. As you presumably loaded the kernel from somewhe=
re there
> >>> ought to be a file system (even an initrd).
> >>>=20
> >>=20
> >> Request firmware does not imply keeping it around. You can always =
re-request
> >> when reloading (although there=E2=80=99s a nasty big of caching th=
at needs to be
> >> resolved with the firmware loader).
> >=20
> > Which comes down to the same thing. Unless you can prove that there=
 is a
> > path to recover the firmware file that does not have any dependanci=
es
> > upon the firmware executing (and those can be subtle and horrid at =
times)
> > you need to keep it around for suspend/resume at least and potentia=
lly
> > any unexpected error/reset.
> >=20
>=20
> In that case the only safe place to put it is in the kernel image its=
elf, which
> is something the firmware loader already supports.

My point is that the current firmware layer is overly cautious and
=46PGAs are very big. My current project on small Xilinx device has a
10MB programming file. The biggest Xilinx device today has a max
bitfile size around 122MB.

So keeping that much memory pinned in the kernel when I can prove it
is uncessary for my system (either because there is no suspend/resume
possibility, or because I know the CPU can always access the
filesytem) is very undesirable.

Other systems might have to take the ram hit.

Since it seems like the kernel has no way to know, we probably have
have a way to tell it not to cache the bitfile.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
