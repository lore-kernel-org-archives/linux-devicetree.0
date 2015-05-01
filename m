From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Fri, 1 May 2015 07:44:05 +0100
Message-ID: <20150501064405.GB4047@x1>
References: <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <20150429202332.GG6062@lukather>
 <20150430095722.GB1815@x1>
 <20150501053406.GI4946@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150501053406.GI4946@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Fri, 01 May 2015, Sascha Hauer wrote:
> On Thu, Apr 30, 2015 at 10:57:22AM +0100, Lee Jones wrote:
> > On Wed, 29 Apr 2015, Maxime Ripard wrote:
> >=20
> > > On Wed, Apr 29, 2015 at 03:17:51PM +0100, Lee Jones wrote:
> > > > On Wed, 22 Apr 2015, Maxime Ripard wrote:
> > > >=20
> > > > > On Wed, Apr 08, 2015 at 06:23:44PM +0100, Lee Jones wrote:
> > > > > > On Wed, 08 Apr 2015, Maxime Ripard wrote:
> > > > > >=20
> > > > > > > On Wed, Apr 08, 2015 at 11:38:32AM +0100, Lee Jones wrote=
:
> > > > > > > > On Wed, 08 Apr 2015, Maxime Ripard wrote:
> > > > > > > >=20
> > > > > > > > > On Wed, Apr 08, 2015 at 09:14:50AM +0100, Lee Jones w=
rote:
> > > > > > > > > > > > +
> > > > > > > > > > > > +		    This property is not to be abused.  It i=
s only to be used to
> > > > > > > > > > > > +		    protect platforms from being crippled by=
 gated clocks, not
> > > > > > > > > > > > +		    as a convenience function to avoid using=
 the framework
> > > > > > > > > > > > +		    correctly inside device drivers.
> > > > > > > > > > >=20
> > > > > > > > > > > Disregarding what's stated here, I'm pretty sure =
that this will
> > > > > > > > > > > actually happen. Where do you place the cursor?
> > > > > > > > > >=20
> > > > > > > > > > That's up to Mike.
> > > > > > > > >=20
> > > > > > > > > Except that Mike won't review any of the DT changes, =
so he won't be
> > > > > > > > > able to refrain users from using it. Let alone out-of=
-tree DTs using a
> > > > > > > > > mainline kernel.
> > > > > > > >=20
> > > > > > > > Ideally Mike should be Cc'ed on patches using clock bin=
dings, but if
> > > > > > > > he isn't the DT guys are smart enough to either make th=
e right
> > > > > > > > decisions themselves (Rob has Acked these bindings alre=
ady, so will be
> > > > > > > > on the lookout for misuse, I'm sure), or ask for Mike's=
 help.
> > > > > > >=20
> > > > > > > Yeah, right, as if this strategy really worked in the pas=
t....
> > > > > > >=20
> > > > > > > Do we really want to look at even the DT bindings that ha=
ve actually
> > > > > > > been reviewed by maintainers that got merged?
> > > > > > >=20
> > > > > > > They don't have time for that, which is totally fine, but=
 we really
> > > > > > > should bury our head in the sand by actually thinking the=
y will review
> > > > > > > every single DT-related patch.
> > > > > > >=20
> > > > > > > Using that as an argument is just plain denial of what re=
ally happened
> > > > > > > for the past 4 years.
> > > > > >=20
> > > > > > I agree that it's a problem, but this is a process problem =
and has
> > > > > > nothing to do with this set.  If you have a problem with th=
e current
> > > > > > process and have a better alternative, submit your thoughts=
 to the DT
> > > > > > list.  Rejecting all new bindings because you are frightene=
d that they
> > > > > > will be used in a manner that they were not intended is not=
 the way to
> > > > > > go though.
> > > > >=20
> > > > > I'm not saying that this binding should not go in because of =
a process
> > > > > issue.
> > > > >=20
> > > > > I'm saying that discarding arguments against your binding by =
adding
> > > > > restrictions that cannot be enforced is not reasonable.
> > > >=20
> > > > I'm open to constructive suggestions/alternatives.
> > > >=20
> > > > Hand rolling this stuff in C per vendor is not of of them.
> > >=20
> > > I'm sorry, but ruling out alternatives that work for everyone (an=
d
> > > actually work better) just because you don't want to edit a C fil=
e is
> > > not really constructive either.
> > >=20
> > > > > > > > > > > Should we create a new driver for our RAM control=
ler, or do we want to
> > > > > > > > > > > use clock-always-on?
> > > > > > > > > >=20
> > > > > > > > > > I would say that if all the driver did was to enabl=
e clocks, then you
> > > > > > > > > > should use this instead.  This binding was designed=
 specifically for
> > > > > > > > > > that purpose.
> > > > > > > > > >=20
> > > > > > > > > > However, if the aforementioned driver clock can be =
safely gated, then
> > > > > > > > > > it should not be an always-on clock.
> > > > > > > > >=20
> > > > > > > > > Yeah, of course, I understand the original intent of =
it, but that
> > > > > > > > > argument, which might very well be true at one point =
in time, might
> > > > > > > > > not be true anymore two or three releases later.
> > > > > > > >=20
> > > > > > > > Why?  The H/W isn't going to change in two or three rel=
eases.  The
> > > > > > > > clocks designated as 'always-on' will have to be on for=
ever, or
> > > > > > > > synonymously, 'always'.
> > > > > > > >
> > > > > > > > > And that driver might actually rely on the fact that =
the clock is shut
> > > > > > > > > down, which won't be the case.
> > > > > > > >=20
> > > > > > > > I think you are missing the point of this binding.  The=
 driver can
> > > > > > > > never rely on that in this use-case.  If the clock is o=
ff, there is no
> > > > > > > > device driver, period.=20
> > > > > > >=20
> > > > > > > Ok. So CPU hotplug or cpuidle is not a thing then? I'm pr=
etty sure the
> > > > > > > PM guys will be happy to hear that.
> > > > > > >=20
> > > > > > > And they are not device drivers, are not mandatory in the=
 system, and
> > > > > > > it's usually a good thing to keep the CPU running wheneve=
r you don't
> > > > > > > have such drivers.
> > > > > > >=20
> > > > > > > > > Introducing a DT interface solely by refering to the =
current state of
> > > > > > > > > a driver is a bit odd.
> > > > > > > >=20
> > > > > > > > I'm not sure I get your point.  This binding has nothin=
g to do with
> > > > > > > > drivers.
> > > > > > >=20
> > > > > > > It's all about drivers. Or rather all about missing drive=
rs.
> > > > > >=20
> > > > > > I think you are going to have to be more forthcoming with y=
our issues
> > > > > > with this binding, because I'm struggling to understand wha=
t your
> > > > > > problem with it is.  You have already pointed me to vendors=
 which have
> > > > > > a genuine/valid need for it.  But instead you'd prefer they=
 hand-roll
> > > > > > their own implementations over multiple lines of C code (ea=
ch).
> > > > >=20
> > > > > I told you already.
> > > > >=20
> > > > > If you have that property, there's absolutely no way to do an=
y kind of
> > > > > clock management in the future.
> > > > >=20
> > > > > It might be fine for your use case, but see my point about th=
e
> > > > > unreasonable restriction. People are going to use it for cloc=
ks that
> > > > > just don't have a driver *yet*, and when that driver will be =
merged we
> > > > > will end up with a driver that (for example) makes the assump=
tion that
> > > > > the clock has been shut down to reset the IP, that might or m=
ight not
> > > > > be the case, depending on how old the DT is exactly.
> > > >=20
> > > > There is a need for this binding,
> > >=20
> > > That's your opinion. Several people already disagreed on this.
> > >=20
> > > Now, what we probably need is a generic way to flag the clocks as
> > > supposed to be enabled. The fact that this information should be =
in
> > > the DT is a different story.
> > >=20
> > > > but as you say, it must not be abused.  So how to we get people=
 not
> > > > to use it willy-nilly?
> > > >=20
> > > > IMO, if people choose to ignore the stark warning in the docume=
ntation
> > > > then that's they're lookout.  I guess you'd like to wrap them i=
n more
> > > > cotton wool than I would.  That's fine too, but how.
> > >=20
> > > You've chosen to ignore all our warnings. Fine. Assume that other
> > > people will ignore yours.
> > >=20
> > > This is not about whatever you put in the documentation or checkp=
atch,
> > > there will be people and/or maintainers that will go against that=
=2E
> > >=20
> > > The only way to prevent any abuse of the binding, is not to have =
any
> > > binding, really.
> > >=20
> > > > > This will be even a bigger madness if you ask me.
> > > > >=20
> > > > > > > > > > > Do we really want to enforce this if we ever gain=
 a driver that would
> > > > > > > > > > > actually be able to manage its clock (like do we =
want the CPU clock to
> > > > > > > > > > > never *ever* be gated just because we don't have =
a cpuidle/hotplug
> > > > > > > > > > > driver yet?)
> > > > > > > > > >=20
> > > > > > > > > > As I've just mentioned, if a clock 'can' be turned =
off, this binding
> > > > > > > > > > should never be used. Situations where using always=
-on as a stop-gap
> > > > > > > > > > due to a lack of current functionality is what the =
paragraph above is
> > > > > > > > > > trying to mitigate.
> > > > > > > > >=20
> > > > > > > > > But it's not really what this property is about. What=
 this property
> > > > > > > > > describes is that these clocks should never be gated.=
 Any point in
> > > > > > > > > time during the life of the system AND with in any ke=
rnel version.
> > > > > > > >=20
> > > > > > > > You got it, that's correct -- these clocks should never=
 be gated.
> > > > > > > >=20
> > > > > > > > So why would that ever change?  If that is likely (or e=
ven possible)
> > > > > > > > to change in the future then this binding should not be=
 used.
> > > > > > > >
> > > > > > > > To reiterate; this binding should be used on ungatable =
clocks only.
> > > > > > > > Non-negotiable, non-changeable either by the introducti=
on of new
> > > > > > > > functionality/support or kernel version.
> > > > > > >=20
> > > > > > > I'm pretty sure that if that patch gets merged, by the en=
d of the
> > > > > > > year, there will be "incorrect" users by your standards.
> > > > > >=20
> > > > > > It's possible to abuse any binding.  I don't see why you ar=
e so
> > > > > > offended of this one in particular.
> > > > >=20
> > > > > I'm not offended, I just tried to push the same kind of patch=
es two
> > > > > years ago, with Mike pushing back, and actually came to see t=
hat he
> > > > > was right a few monthes down the road.
> > > >=20
> > > > Well this was suggested by Mike.  I even have his Ack already. =
 So I
> > > > guess he too has changed the error of his ways. :)
> > >=20
> > > I wonder why it's not even merged yet then if you have the mainta=
iners
> > > Acked-by, and want to ignore any other review.
> > >=20
> > > > > And yeah, your point that any binding can be abused is true. =
This one
> > > > > is only so easy to abuse it's not even funny.
> > > > >=20
> > > > > > > If you introduce a feature, you should expect people to u=
se
> > > > > > > it.  If not, what's the point?
> > > > > >=20
> > > > > > By your own admission, there are genuine users for this bin=
ding and I
> > > > > > expect people to use it.
> > > > >=20
> > > > > The only thing that we really disagree upon is that whether t=
hat
> > > > > restriction will really be followed. You expect people to, I
> > > > > don't. It's the fundamental disagreement we have, that really=
 prevent
> > > > > any purely technical discussion.
> > > > >=20
> > > > > Maybe we can try to address that before moving forward?
> > > >=20
> > > > I'd like that.
> > > >=20
> > > > If a firm warning isn't good enough, then what will be?
> > > >=20
> > > > > > > > > > > Have you seen the numerous NAK on such approach M=
ike did?
> > > > > > > > > >=20
> > > > > > > > > > I haven't, but the folks reviewing previous version=
s have.  Do you
> > > > > > > > > > have something specific in mind that you'd like to =
bring to my
> > > > > > > > > > attention?
> > > > > > > > >=20
> > > > > > > > > Unfortunately, I haven't been able to dig out such ma=
ils. But it's why
> > > > > > > > > we ended up with clock protection code in various clo=
ck drivers
> > > > > > > > > including:
> > > > > > > > >=20
> > > > > > > > > AT91: http://lxr.free-electrons.com/source/drivers/cl=
k/at91/clk-slow.c#L484
> > > > > > > > > iMX28: http://lxr.free-electrons.com/source/drivers/c=
lk/mxs/clk-imx28.c#L154
> > > > > > > > > Rockchip: http://lxr.free-electrons.com/source/driver=
s/clk/rockchip/clk.c#L320
> > > > > > > > > sunXi: http://lxr.free-electrons.com/source/drivers/c=
lk/sunxi/clk-sunxi.c#L1183
> > > > > > > > > Zynq: http://lxr.free-electrons.com/source/drivers/cl=
k/zynq/clkc.c#L504
> > > > > > > > >=20
> > > > > > > > > Which is much more flexible, since you won't have to =
modify the DT to
> > > > > > > > > change which clocks are to be left enabled, as well a=
s way easier to
> > > > > > > > > debug if you ever have to remove that property from t=
he DT.
> > > > > > > >=20
> > > > > > > > You're right, you don't have the change the DT in these=
 cases.  You
> > > > > > > > have to write new C code, which is _less_ flexible.
> > > > > > >=20
> > > > > > > I'm sorry to learn that you never heard of that stable-DT=
 thing.
> > > > > > >=20
> > > > > > > And a bit sorry to see that a maintainer is really seeing=
 C as not
> > > > > > > flexible.
> > > > > >=20
> > > > > > You're putting words in my mouth.  I didn't say C was not f=
lexible.
> > > > > >=20
> > > > > > I'm referencing the original DT pros i.e. it is possible to=
 supply a
> > > > > > different configuration without the need to compile the ker=
nel.
> > > > > > That's certainly true in this case.  We can provide a clk-p=
rovider and
> > > > > > tag it as always-on, all without re-compile.
> > > > > >=20
> > > > > > > > So all these platforms are adding their own hand-rolled=
 version of
> > > > > > > > this binding, adding more duplication and cruft to the =
kernel.
> > > > > > > > Instead they can use this 'always-on' and we can consol=
idate and strip
> > > > > > > > it all out.
> > > > > > >=20
> > > > > > > Except that all these platforms are actually not implemen=
ting a
> > > > > > > binding, ie not an interface with the DT they are bound t=
o. Each and
> > > > > > > every of these platforms can change that list whenever th=
ey wish, just
> > > > > > > by sending a single one-liner patch (just like the DT, re=
ally.).
> > > > > > >=20
> > > > > > > Which is not something that you can achieve with a DT bin=
ding.
> > > > > >=20
> > > > > > Once again, can you give me more information about why you =
have such a
> > > > > > problem with this binding.  I wish for it to be stable/ABI,=
 I wish for
> > > > > > it never to be removed, I envisage it will always be needed=
, so what's
> > > > > > the problem?=20
> > > > > >=20
> > > > > > Do you have a vested interest that I am missing?
> > > > > >=20
> > > > > > Perhaps an example of possible calamity will help convince =
me that
> > > > > > you're not completely wrong and blowing everything out of p=
roportion
> > > > > > for no good reason.
> > > > >=20
> > > > > Let's say you've introduced such a clock in kernel 4.0 for th=
e memory
> > > > > clock.
> > > > >=20
> > > > > At some point down the road, you create a ddrfreq driver (if =
that ever
> > > > > exists). You have a new driver, which will manage the clock.
> > > > >=20
> > > > > In that driver, for some reason, you have to shutdown the clo=
ck to
> > > > > reset the DDR controller. Of course that also means that you =
will be
> > > > > removing the clk-always-on property from your DT.
> > > > >=20
> > > > > You will have in your driver something like:
> > > > >=20
> > > > > /* Reset our controller */
> > > > > clk_disable(clk);
> > > > > clk_enable(clk):
> > > > >=20
> > > > > And then, you expect your controller to be in its out-of-rese=
t
> > > > > state. Which will be the case with a new DT, and not with the=
 old one,
> > > > > probably creating all kind of very entertaining issues to deb=
ug.
> > > > >=20
> > > > > All of this wouldn't be the case if you had this inside the k=
ernel,
> > > > > since (hopefully) the kernel is consistent with itself.
> > > >=20
> > > > Surely you must have realised already that DTBs are more tightl=
y
> > > > coupled to kernel versions than we would have initially liked?
> > >=20
> > > Just to get things straight. I'm *not* one proponent of the "DT a=
s an
> > > ABI" rule.
> > >=20
> > > BUT, if you're designing a generic property, then you're also
> > > designing it for platforms that have chose to have that stability=
=2E And
> > > we do have some of those in the tree.
> > >=20
> > > And of course, that's assuming that the ABI stability is never go=
ing
> > > to be a thing (which might or might not happen).
> > >=20
> > > > It's naive to assume that old DTBs will 'just-work' with newer
> > > > kernels.
> > >=20
> > > Like I said, it does work on some mainline ARM platforms.
> > >=20
> > > > Wrong decisions related to DT are being made daily. Adding
> > > > mistakenly or foolhardily adding 'clk-always-on' to a DTS is no=
t
> > > > going to be the sole cause of breakage somewhere down the line.
> > >=20
> > > I'm not sure that saying that accepting bindings because some oth=
er
> > > bindings are just as bad is a good argument, especially on bindin=
gs
> > > that do impact all the platforms.
> > >=20
> > > > Pushing back on the acceptance of this binding based on idealis=
tic,
> > > > possibly already out-of-date premise is just frustrating.
> > >=20
> > > Don't worry, it's just as frustrating on the other end. Showing y=
ou
> > > exactly why it's going to be an issue with you simply ignoring by
> > > saying something close to "not my use case" is just as frustratin=
g.
> > >=20
> > > > This useful binding should be accepted and people should not ab=
use
> > > > it.  If they do and the vendor Maintainer's review and accept t=
hen
> > > > they have no foundation for recourse.
> > >=20
> > > And in the end, there will be more and more bloated and / or poor=
 code
> > > in the kernel, hurting it as a whole.
> > >=20
> > > > Would you prefer it if I made the warning starker?
> > >=20
> > > The only kind of warning that would be noticed by anyone is a run=
time
> > > warning. I'm not sure this is a reasonable option :)
> >=20
> > Does Sascha's antidote patch change your opinion?  We can use DT to
> > declare critical clocks, and in the rare case of the introduction o=
f a
> > new DDRFreq-like feature, which doesn't adapt the DT will still be
> > able to unlock the criticalness of the clock and use it as expected=
?
>=20
> Honestly I'm not very fond of declaring these in the device tree, but

I know why you guys are saying that, but I'd like you to understand
the reasons for me pushing for this.  Rather than be being deliberately
obtuse, I'm thinking of the mess that not having this stuff in DT will
cause for clock implementations like ours, which describe more of a
framework than a description.

The providers in drivers/clock/st are blissfully ignorant of platform
specifics.  Per-platform configuration is described in DT.  So we'd
have 2 options to use a C-only based API; 1) duplicate platform
information in drivers/clk/st, or 2) supply a vendor specific
st,critical-clocks binding, pull out those references then run them
though the aforementioned framework.  It is my opinion that neither of
those methods are desirable.

As an aside, we also have 9 add_provider() and 9 clock_register()
calls, where we would need to consider calling the new
critical_clock() API from/after.

Please tell me that you understand and agree, or please provide me
with a suggestion to combat the issues I currently face.

> naming them 'critical-clocks' rather than 'always-on' seems more
> acceptable for me. It leaves a way out for the user to turn the clock
> off later as it only means "you may turn them off when you know what =
you
> are doing".

With the introduction of your latest patch we are no longer in the
peril previously described, thus if a platform does separate their
DT from its associated kernel, it won't be the end of the world (or
cost a couple mWh) if a clock becomes controllable in a subsequent
kernel version.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
