From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Tue, 27 May 2014 11:22:01 -0700
Message-ID: <20140527182201.GA2439@roeck-us.net>
References: <CAMuHMdUGdjVKBR5rRzZ274rf7p8XfztNRWEojH1RrZV8c_V1uA@mail.gmail.com>
 <20140526112348.907B7C421A5@trevor.secretlab.ca>
 <A6195DFD-0447-4444-AC09-501C43F09924@konsulko.com>
 <20140526213303.C1C73C40E11@trevor.secretlab.ca>
 <20140526223630.GA32691@earth.universe>
 <5383D174.8070304@roeck-us.net>
 <20140527121236.3B818C40A5A@trevor.secretlab.ca>
 <9CF30A1A-5EB6-401E-A0D5-453CB99B4A83@konsulko.com>
 <20140527152115.GA30180@roeck-us.net>
 <CAMuHMdXy_qn7jufr3_My4AQ_J_=-wzx6uXH15NiHzsth-ZH2jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXy_qn7jufr3_My4AQ_J_=-wzx6uXH15NiHzsth-ZH2jw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pete Popov <pete>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Tue, May 27, 2014 at 07:52:57PM +0200, Geert Uytterhoeven wrote:
> Hi G=FCnther,
>=20
> On Tue, May 27, 2014 at 5:21 PM, Guenter Roeck <linux@roeck-us.net> w=
rote:
> > On Tue, May 27, 2014 at 03:24:35PM +0300, Pantelis Antoniou wrote:
> >> On May 27, 2014, at 3:12 PM, Grant Likely wrote:
> >> > On Mon, 26 May 2014 16:42:44 -0700, Guenter Roeck <linux@roeck-u=
s.net> wrote:
> >> >> On 05/26/2014 03:36 PM, Sebastian Reichel wrote:
> >> >>> On Mon, May 26, 2014 at 10:33:03PM +0100, Grant Likely wrote:
> >> >>>> After thinking about it more, I think it is very likely that =
removing
> >> >>>> all the overlays is the correct thing to do in the kexec use-=
case. When
> >> >>>> kexec-ing, it makes sense that we'd want the exact same behav=
iour from
> >> >>>> the kexec'ed kernel. That means we want the device drivers to=
 do the
> >> >>>> same thing including loading whatever overlays they depend on=
=2E
> >> >>>>
> >> >>>> If the flattened tree was left applied, then the behaviour be=
comes
> >> >>>> different.
> >> >>>>
> >> >>>> I say always remove the overlays unless explicitly told not t=
o, but I'm
> >> >>>> struggling to come up with use cases where keeping them appli=
ed is
> >> >>>> desirable.
> >> >>>
> >> >>> I would assume, that I want them applied in most cases. DT des=
cribes
> >> >>> the hardware. If I kexec into a new kernel I change software, =
not
> >> >>> hardware.
> >> >>>
> >> >>> Maybe I'm missing the main purpose of the feature. I currently=
 see
> >> >>> two useful usecases for DT overlays:
> >> >>>
> >> >>> 1. The dtb the kernel is booted with cannot be changed for som=
e
> >> >>>    reason, but the board has additional hardware attached (e.g=
=2E
> >> >>>    the user added a sensor on the i2c bus)
> >> >>> 2. The hardware is changed on the fly (e.g. the user flashed t=
he
> >> >>>    FPGA part of a zynq processor), sensors on i2c bus, ...
> >> >>>
> >> >>> In both cases the kernel should be booted with the additional
> >> >>> overlay information IMHO. Though for the second case it should
> >> >>> be possible to remove the "programmed" hardware information
> >> >>> somehow.
> >> >>>
> >> >>
> >> >> 3. Some hot-plug device or card is inserted or removed.
> >> >>
> >> >> I would argue that the kernel should _not_ be booted with the o=
verlay in place.
> >> >> Otherwise the code handling overlays would have to have special=
 handling
> >> >> for the restart case, which is much more complex than just to r=
e-insert
> >> >> the overlay when it is determined that the device or card is st=
ill there.
> >> >
> >> > Exactly.
> >> >
> >>
> >> Looks like we are levitating to the 'remove overlays on kexec' app=
roach.
> >> Is that correct?
> >>
> >
> > Let's just assume for a minute that this is not the case, and that =
loaded
> > overlays are passed on.
> >
> > This would be an interesting challenge for the overlay manager, as =
it would
> > have to handle a number of startup conditions. After all, it can no=
t take
> > it as granted that the hardware state did not change after it was s=
topped
> > in the old kernel, and before it was started in the new kernel.
> > - overlay loaded, but hardware/device no longer present
> >   -> unload overlay
> > - overlay loaded, but different hardware present
> >   -> unload old overlay, load new one
> > - overlay not loaded, hardware present
> >   -> load overlay
> > - overlay loaded and matches hardware
> >   -> do nothing
> >
> > In comparison, its task would be quite straightforward if loaded ov=
erlays
> > are not passed on to the new kernel.
> > - If hardware is present, load overlay
> >
> > Ultimately, I seem to be missing something, as I don't really see t=
he benefit
> > of passing on the loaded overlay(s) to the new kernel. Activation t=
ime, maybe,
> > for the most common case (overlay loaded and matches hardware) ?
>=20
> All of the above assume you're using a system with overlays and an ov=
erlay
> manager. I.e. you have add-on devices together with an overlay DT.
> One way to handle this is via auto-detection of capes, that identify =
themselves,
> so the overlay manager knows which overlay to load.
>=20
Possibly auto-detected (and in our case that is so), but not necessaril=
y.
A user space overlay manager, which keeps state in user space, would be=
 possible
as well.

> I'm trying to look at it in a more generic way: you add hardware whic=
h is not
> in the DT, so the DT must be modified (in some way or another) to mat=
ch the
> hardware.
>=20
> If you run kexec, the added hardware is still there. In the absence o=
f a system
> with auto-detection of capes, the newly booted kernel cannot know tha=
t
> hardware has been added, compared to a pristine system. If it's in th=
e
> DT passed through kexec, everything will work.
>=20
Yes, but only for that case. You'd still have the problem that you'll n=
eed=20
to keep the state somewhere to be able to remove the pre-loaded overlay=
(s) later
on. If you don't have hardware auto-detection, I would assume that to b=
e in user
space. No matter if the system auto-detects hardware or not, the same m=
echanism
could be used: If, on startup, the hardware status (no matter if kept i=
n some
file or auto-detected) indicates that an overlay should be loaded, load=
 it.

If, for some reason, the overlay manager can not auto-detect hardware b=
ut keeps
state in the kernel, it may make sense to have that state passed to the=
 new kernel.
However, that should be part of the overlay manager implementation, and=
 not be
dictated by the core overlay mechanism.

Thanks,
Guenter
