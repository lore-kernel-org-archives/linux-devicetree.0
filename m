MIME-Version: 1.0
Date: Mon, 23 Jul 2018 11:51:50 -0600
References: <20180711053122.30773-1-andrew@aj.id.au>
	<20180711053122.30773-2-andrew@aj.id.au>
	<20180711200450.GB17291@rob-hp-laptop>
	<1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
	<CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
	<b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
	<1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
	<CAL_JsqLZo-=7UkuvvUFYdCR4asBBiWyC=Q1ryH=-HLU6vzf9tA@mail.gmail.com>
	<ece91112ecfdc7218184c4c4519e455cf9397e11.camel@kernel.crashing.org>
	<CAL_JsqL_bMXLAA0091-g8PmhXR5g5Pf2y2=ey7Ss5ofHm46sWw@mail.gmail.com>
	<c69d0e7c3a95d83da87b566a62619462671a233b.camel@kernel.crashing.org>
In-Reply-To: <c69d0e7c3a95d83da87b566a62619462671a233b.camel@kernel.crashing.org>
Message-ID: <CAL_JsqJDis4DqKjFTzz5=ML=ngaTS+XHSXTdf6FU4jdzq0a2zA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eugene.Cho@dell.com, a.amelkin@yadro.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, stewart@linux.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 18, 2018 at 5:58 PM Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
>
> On Wed, 2018-07-18 at 13:50 -0600, Rob Herring wrote:
> >
> > > So Rob, I think that's precisely where the disconnect is.
> > >
> > > I think we all (well hopefully) agree that those few tunables don't fit
> > > in any existing subystem and aren't likely to ever do (famous last
> > > words...).
> > >
> > > Where we disagree is we want to make this parametrized via the DT, and
> > > you want us to hard wire the list in some kind of SoC driver for a
> > > given SoC family/version.
> > >
> > > The reason I think hard wiring the list in the driver is not a great
> > > solution is that that list in itself is prone to variations, possibly
> > > fairly often, between boards, vendors, versions of boards, etc...
> >
> > Can we separate the list of what's enabled from the details of the
> > registers?  Even if we put all this into DT, we may still want to have
> > some separation for dts file structure. Some portion of this has to be
> > SoC specific because you are simply exposing SoC registers.
>
> Not sure I understand what you mean by "what's enabled".

For example with VGA muxing, you can separate the details of the register field location and whether you want that tunable or not for a given platform.

> The goal here is to expose register "fields" (nor raw values, some
> registers need locking for RMW etc... the kernel would handle that via
> syscon locking I expect), so basically named "tunables" to userspace.
>
> Userspace is the one that knows the values for a given system.
>
> > > We can't know for sure every SoC tunable (out of the gazillions in
> > > those chips) are going to be needed for a given system. We know which
> > > ones we do use for ours, and that's a couple of handfuls, but it could
> > > be that Dell need a slightly different set, and so might Yadro, or so
> > > might our next board revision for that matter.
> >
> > That's very hand wavy. Do you have some concrete examples (i.e. dts
> > files) showing the differences.
>
> We could list what we have on the pile for some of our IBM systems
> today, but we would need Dell and Yadro to chime in with what they
> need.
>
> I still, from experience with that stuff and gut feeling, am pretty
> sure it's going to be a moving list, and updating the kernel driver
> constantly isn't going to fly.
>
> > One problem I'm having with this is you are still going to need per
> > board specifics in userspace.
>
> Yes. Userspace is ultimately the one that knows what needs to be done
> on a given machine.
>
> >  You may be moving some of details out,
> > but moving to DT is not going to completely eliminate that.
>
> We aren't trying to either. We are trying to make sure we don't need to
> change the *kernel* all the time, in part bcs we are pushing hard for
> OpenBMC vendors to use upstream with, if possible, no vendor changes.
>
> So userspace has to know the board specific tunables anyways. Today in
> many systems, it does that by whacking /dev/mem. I guess you can
> understand why that is bad :-)
>
> > I agree
> > that not using /dev/mem is a good thing, but there are several ways
> > you could do that independent of any DT binding.
>
> Such as ? The only other option is to have one or more kernel drivers
> that have built-in the precise and complete list of those tunables that
> need to be exposed.

UIO is one way. That at least would restrict things to a specific address range(s) compared to /dev/mem, but would still possibly leave other registers exposed. 

Another option would be with your proposed driver to provide a userspace interface to register the register fields you need. Not sure if allowing userspace to be able to specify that is a security concern (though allowing a DT update would be the same). 

> It's not impossible, but I worry that it's not going to scale terribly
> well, and that vendors will constantly "fork" that driver to add
> different things to that list.
>
> I might be wrong here, so I'd like for Eugene (Dell) and Alexander
> (Yadro) to chime in, but experience with BMCs has shown that we
> regularily , as we add a feature or rewrite something, need to find
> another new magic SoC tunable the HW manufacturer hid somewhere that
> will make our stuff work.
>
> > > Now, updating the device-tree in the board flash with whatever vendor
> > > specific information is needed is a LOT easier than getting the kernel
> > > driver constantly updated. The device-tree after all is there to
> > > reflect among other things system specific ways in which the SoC is
> > > wired and configured. This is rather close...
> >
> > Sadly, updating my kernel is easier than updating my PC firmware
> > (though packaged firmware on my current laptop changes that). I can
> > assure you that ARM boards are generally much worse in that regard.
> > BTW, you may want to pay attention to EBBR[1][2]. Not sure how much
> > you care for BMCs, but there may be some interest.
>
> You are conflating your host kernel and your BMC here. The BMC kernel
> is part of the "firmware", as is its DTS and the BMC userspace.
>
> (Again this isn't the host DTS, this is the BMC DTS).

Yes, I get that. My point was just about what's easier to do actual updates for. But mainline vs. forks of the kernel is a different thing.

> They get all updated together. My point isn't about the ease or
> difficulty for a *user* to udpate their BMC, in that case the solutions
> above are equivalent.
>
> The point is from a system vendor perspective. A system vendor using
> OpenBMC will *customize* their BMC build in various ways. Typically
> they *will* have a custom DT since this is what represents their
> specific system and they will have some specific userspace bits.
>
> However, we are trying very hard for them *not* to fork the kernel, and
> if possible move OpenBMC towards a fully upstream kernel (still working
> on getting all the SoC drivers cleaned up and pushed up but it's moving
> in the right direction).
>
> So from a vendor perspective, such as us IBM, we *alread* have custom
> DTs and customized userspace, that's part of the normal flow of
> deploying a BMC.
>
> However, we are trying *NOT* to have a custom kernel (and we don't, at
> the moment there is an OpenBMC kernel accross vendors, though it's not
> *yet* fully upstream).

So if you are only trying to avoid kernel changes, then what is the advantage of putting this in DT and passing it thru to userspace. Why not just put all
>
> So if the solution proposed is prone to requiring frequent changes to a
> kernel driver, that solution makes the above a lot more difficult and
> will encourage vendors to keep forking kernels.
>
> This is what we are trying to avoid.
>
> Cheers,
> Ben.
>
> > Rob
> >
> > [1] https://github.com/ARM-software/ebbr
> > [2] https://lists.linaro.org/pipermail/boot-architecture/
