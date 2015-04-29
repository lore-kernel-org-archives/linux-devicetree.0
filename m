From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 29 Apr 2015 17:07:13 +0100
Message-ID: <20150429160713.GY9169@x1>
References: <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
 <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <20150429145114.GW6325@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150429145114.GW6325@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 Apr 2015, Sascha Hauer wrote:

> On Wed, Apr 29, 2015 at 03:17:51PM +0100, Lee Jones wrote:
> > On Wed, 22 Apr 2015, Maxime Ripard wrote:
> >=20
> > > On Wed, Apr 08, 2015 at 06:23:44PM +0100, Lee Jones wrote:
> > > > On Wed, 08 Apr 2015, Maxime Ripard wrote:
> > > >=20
> > > > > On Wed, Apr 08, 2015 at 11:38:32AM +0100, Lee Jones wrote:
> > > > > > On Wed, 08 Apr 2015, Maxime Ripard wrote:
> > > > > >=20
> > > > > > > On Wed, Apr 08, 2015 at 09:14:50AM +0100, Lee Jones wrote=
:
> > > > > > > > > > +
> > > > > > > > > > +		    This property is not to be abused.  It is on=
ly to be used to
> > > > > > > > > > +		    protect platforms from being crippled by gat=
ed clocks, not
> > > > > > > > > > +		    as a convenience function to avoid using the=
 framework
> > > > > > > > > > +		    correctly inside device drivers.
> > > > > > > > >=20
> > > > > > > > > Disregarding what's stated here, I'm pretty sure that=
 this will
> > > > > > > > > actually happen. Where do you place the cursor?
> > > > > > > >=20
> > > > > > > > That's up to Mike.
> > > > > > >=20
> > > > > > > Except that Mike won't review any of the DT changes, so h=
e won't be
> > > > > > > able to refrain users from using it. Let alone out-of-tre=
e DTs using a
> > > > > > > mainline kernel.
> > > > > >=20
> > > > > > Ideally Mike should be Cc'ed on patches using clock binding=
s, but if
> > > > > > he isn't the DT guys are smart enough to either make the ri=
ght
> > > > > > decisions themselves (Rob has Acked these bindings already,=
 so will be
> > > > > > on the lookout for misuse, I'm sure), or ask for Mike's hel=
p.
> > > > >=20
> > > > > Yeah, right, as if this strategy really worked in the past...=
=2E
> > > > >=20
> > > > > Do we really want to look at even the DT bindings that have a=
ctually
> > > > > been reviewed by maintainers that got merged?
> > > > >=20
> > > > > They don't have time for that, which is totally fine, but we =
really
> > > > > should bury our head in the sand by actually thinking they wi=
ll review
> > > > > every single DT-related patch.
> > > > >=20
> > > > > Using that as an argument is just plain denial of what really=
 happened
> > > > > for the past 4 years.
> > > >=20
> > > > I agree that it's a problem, but this is a process problem and =
has
> > > > nothing to do with this set.  If you have a problem with the cu=
rrent
> > > > process and have a better alternative, submit your thoughts to =
the DT
> > > > list.  Rejecting all new bindings because you are frightened th=
at they
> > > > will be used in a manner that they were not intended is not the=
 way to
> > > > go though.
> > >=20
> > > I'm not saying that this binding should not go in because of a pr=
ocess
> > > issue.
> > >=20
> > > I'm saying that discarding arguments against your binding by addi=
ng
> > > restrictions that cannot be enforced is not reasonable.
> >=20
> > I'm open to constructive suggestions/alternatives.
> >=20
> > Hand rolling this stuff in C per vendor is not of of them.
> >=20
> > > > > > > > > Should we create a new driver for our RAM controller,=
 or do we want to
> > > > > > > > > use clock-always-on?
> > > > > > > >=20
> > > > > > > > I would say that if all the driver did was to enable cl=
ocks, then you
> > > > > > > > should use this instead.  This binding was designed spe=
cifically for
> > > > > > > > that purpose.
> > > > > > > >=20
> > > > > > > > However, if the aforementioned driver clock can be safe=
ly gated, then
> > > > > > > > it should not be an always-on clock.
> > > > > > >=20
> > > > > > > Yeah, of course, I understand the original intent of it, =
but that
> > > > > > > argument, which might very well be true at one point in t=
ime, might
> > > > > > > not be true anymore two or three releases later.
> > > > > >=20
> > > > > > Why?  The H/W isn't going to change in two or three release=
s.  The
> > > > > > clocks designated as 'always-on' will have to be on forever=
, or
> > > > > > synonymously, 'always'.
> > > > > >
> > > > > > > And that driver might actually rely on the fact that the =
clock is shut
> > > > > > > down, which won't be the case.
> > > > > >=20
> > > > > > I think you are missing the point of this binding.  The dri=
ver can
> > > > > > never rely on that in this use-case.  If the clock is off, =
there is no
> > > > > > device driver, period.=20
> > > > >=20
> > > > > Ok. So CPU hotplug or cpuidle is not a thing then? I'm pretty=
 sure the
> > > > > PM guys will be happy to hear that.
> > > > >=20
> > > > > And they are not device drivers, are not mandatory in the sys=
tem, and
> > > > > it's usually a good thing to keep the CPU running whenever yo=
u don't
> > > > > have such drivers.
> > > > >=20
> > > > > > > Introducing a DT interface solely by refering to the curr=
ent state of
> > > > > > > a driver is a bit odd.
> > > > > >=20
> > > > > > I'm not sure I get your point.  This binding has nothing to=
 do with
> > > > > > drivers.
> > > > >=20
> > > > > It's all about drivers. Or rather all about missing drivers.
> > > >=20
> > > > I think you are going to have to be more forthcoming with your =
issues
> > > > with this binding, because I'm struggling to understand what yo=
ur
> > > > problem with it is.  You have already pointed me to vendors whi=
ch have
> > > > a genuine/valid need for it.  But instead you'd prefer they han=
d-roll
> > > > their own implementations over multiple lines of C code (each).
> > >=20
> > > I told you already.
> > >=20
> > > If you have that property, there's absolutely no way to do any ki=
nd of
> > > clock management in the future.
> > >=20
> > > It might be fine for your use case, but see my point about the
> > > unreasonable restriction. People are going to use it for clocks t=
hat
> > > just don't have a driver *yet*, and when that driver will be merg=
ed we
> > > will end up with a driver that (for example) makes the assumption=
 that
> > > the clock has been shut down to reset the IP, that might or might=
 not
> > > be the case, depending on how old the DT is exactly.
> >=20
> > There is a need for this binding, but as you say, it must not be
> > abused.  So how to we get people not to use it willy-nilly?
> >=20
> > IMO, if people choose to ignore the stark warning in the documentat=
ion
> > then that's they're lookout.  I guess you'd like to wrap them in mo=
re
> > cotton wool than I would.  That's fine too, but how.
> >=20
> > > This will be even a bigger madness if you ask me.
> > >=20
> > > > > > > > > Do we really want to enforce this if we ever gain a d=
river that would
> > > > > > > > > actually be able to manage its clock (like do we want=
 the CPU clock to
> > > > > > > > > never *ever* be gated just because we don't have a cp=
uidle/hotplug
> > > > > > > > > driver yet?)
> > > > > > > >=20
> > > > > > > > As I've just mentioned, if a clock 'can' be turned off,=
 this binding
> > > > > > > > should never be used. Situations where using always-on =
as a stop-gap
> > > > > > > > due to a lack of current functionality is what the para=
graph above is
> > > > > > > > trying to mitigate.
> > > > > > >=20
> > > > > > > But it's not really what this property is about. What thi=
s property
> > > > > > > describes is that these clocks should never be gated. Any=
 point in
> > > > > > > time during the life of the system AND with in any kernel=
 version.
> > > > > >=20
> > > > > > You got it, that's correct -- these clocks should never be =
gated.
> > > > > >=20
> > > > > > So why would that ever change?  If that is likely (or even =
possible)
> > > > > > to change in the future then this binding should not be use=
d.
> > > > > >
> > > > > > To reiterate; this binding should be used on ungatable cloc=
ks only.
> > > > > > Non-negotiable, non-changeable either by the introduction o=
f new
> > > > > > functionality/support or kernel version.
> > > > >=20
> > > > > I'm pretty sure that if that patch gets merged, by the end of=
 the
> > > > > year, there will be "incorrect" users by your standards.
> > > >=20
> > > > It's possible to abuse any binding.  I don't see why you are so
> > > > offended of this one in particular.
> > >=20
> > > I'm not offended, I just tried to push the same kind of patches t=
wo
> > > years ago, with Mike pushing back, and actually came to see that =
he
> > > was right a few monthes down the road.
> >=20
> > Well this was suggested by Mike.  I even have his Ack already.  So =
I
> > guess he too has changed the error of his ways. :)
> >=20
> > > And yeah, your point that any binding can be abused is true. This=
 one
> > > is only so easy to abuse it's not even funny.
> > >=20
> > > > > If you introduce a feature, you should expect people to use
> > > > > it.  If not, what's the point?
> > > >=20
> > > > By your own admission, there are genuine users for this binding=
 and I
> > > > expect people to use it.
> > >=20
> > > The only thing that we really disagree upon is that whether that
> > > restriction will really be followed. You expect people to, I
> > > don't. It's the fundamental disagreement we have, that really pre=
vent
> > > any purely technical discussion.
> > >=20
> > > Maybe we can try to address that before moving forward?
> >=20
> > I'd like that.
> >=20
> > If a firm warning isn't good enough, then what will be?
> >=20
> > > > > > > > > Have you seen the numerous NAK on such approach Mike =
did?
> > > > > > > >=20
> > > > > > > > I haven't, but the folks reviewing previous versions ha=
ve.  Do you
> > > > > > > > have something specific in mind that you'd like to brin=
g to my
> > > > > > > > attention?
> > > > > > >=20
> > > > > > > Unfortunately, I haven't been able to dig out such mails.=
 But it's why
> > > > > > > we ended up with clock protection code in various clock d=
rivers
> > > > > > > including:
> > > > > > >=20
> > > > > > > AT91: http://lxr.free-electrons.com/source/drivers/clk/at=
91/clk-slow.c#L484
> > > > > > > iMX28: http://lxr.free-electrons.com/source/drivers/clk/m=
xs/clk-imx28.c#L154
> > > > > > > Rockchip: http://lxr.free-electrons.com/source/drivers/cl=
k/rockchip/clk.c#L320
> > > > > > > sunXi: http://lxr.free-electrons.com/source/drivers/clk/s=
unxi/clk-sunxi.c#L1183
> > > > > > > Zynq: http://lxr.free-electrons.com/source/drivers/clk/zy=
nq/clkc.c#L504
> > > > > > >=20
> > > > > > > Which is much more flexible, since you won't have to modi=
fy the DT to
> > > > > > > change which clocks are to be left enabled, as well as wa=
y easier to
> > > > > > > debug if you ever have to remove that property from the D=
T.
> > > > > >=20
> > > > > > You're right, you don't have the change the DT in these cas=
es.  You
> > > > > > have to write new C code, which is _less_ flexible.
> > > > >=20
> > > > > I'm sorry to learn that you never heard of that stable-DT thi=
ng.
> > > > >=20
> > > > > And a bit sorry to see that a maintainer is really seeing C a=
s not
> > > > > flexible.
> > > >=20
> > > > You're putting words in my mouth.  I didn't say C was not flexi=
ble.
> > > >=20
> > > > I'm referencing the original DT pros i.e. it is possible to sup=
ply a
> > > > different configuration without the need to compile the kernel.
> > > > That's certainly true in this case.  We can provide a clk-provi=
der and
> > > > tag it as always-on, all without re-compile.
> > > >=20
> > > > > > So all these platforms are adding their own hand-rolled ver=
sion of
> > > > > > this binding, adding more duplication and cruft to the kern=
el.
> > > > > > Instead they can use this 'always-on' and we can consolidat=
e and strip
> > > > > > it all out.
> > > > >=20
> > > > > Except that all these platforms are actually not implementing=
 a
> > > > > binding, ie not an interface with the DT they are bound to. E=
ach and
> > > > > every of these platforms can change that list whenever they w=
ish, just
> > > > > by sending a single one-liner patch (just like the DT, really=
=2E).
> > > > >=20
> > > > > Which is not something that you can achieve with a DT binding=
=2E
> > > >=20
> > > > Once again, can you give me more information about why you have=
 such a
> > > > problem with this binding.  I wish for it to be stable/ABI, I w=
ish for
> > > > it never to be removed, I envisage it will always be needed, so=
 what's
> > > > the problem?=20
> > > >=20
> > > > Do you have a vested interest that I am missing?
> > > >=20
> > > > Perhaps an example of possible calamity will help convince me t=
hat
> > > > you're not completely wrong and blowing everything out of propo=
rtion
> > > > for no good reason.
> > >=20
> > > Let's say you've introduced such a clock in kernel 4.0 for the me=
mory
> > > clock.
> > >=20
> > > At some point down the road, you create a ddrfreq driver (if that=
 ever
> > > exists). You have a new driver, which will manage the clock.
> > >=20
> > > In that driver, for some reason, you have to shutdown the clock t=
o
> > > reset the DDR controller. Of course that also means that you will=
 be
> > > removing the clk-always-on property from your DT.
> > >=20
> > > You will have in your driver something like:
> > >=20
> > > /* Reset our controller */
> > > clk_disable(clk);
> > > clk_enable(clk):
> > >=20
> > > And then, you expect your controller to be in its out-of-reset
> > > state. Which will be the case with a new DT, and not with the old=
 one,
> > > probably creating all kind of very entertaining issues to debug.
> > >=20
> > > All of this wouldn't be the case if you had this inside the kerne=
l,
> > > since (hopefully) the kernel is consistent with itself.
> >=20
> > Surely you must have realised already that DTBs are more tightly
> > coupled to kernel versions than we would have initially liked?  It'=
s
> > naive to assume that old DTBs will 'just-work' with newer kernels.
> >=20
> > Wrong decisions related to DT are being made daily.  Adding mistake=
nly
> > or foolhardily adding 'clk-always-on' to a DTS is not going to be t=
he
> > sole cause of breakage somewhere down the line.
>=20
> It may not be the sole cause of breakage, but one we can avoid.
>=20
> >=20
> > Pushing back on the acceptance of this binding based on idealistic,
> > possibly already out-of-date premise is just frustrating.
> >=20
> > This useful binding should be accepted and people should not abuse
> > it.  If they do and the vendor Maintainer's review and accept then
> > they have no foundation for recourse.
>=20
> Maxime gave a good example for a clock which looks like a candidate f=
or
> clk-always-on but needs to be turned off in a later kernel revision.

In the example Maxime gave, I'm struggling to understand how you might
enable such a framework whist still using an old DT.  If you want to
make use of new features/drivers/enablement/power-saving you must be
in a position to edit your platform code/Device Tree.

> Could you elaborate why you still want to have the clk-always-on in t=
he
> device tree instead of in the kernel where it can be removed when
> necessary? What's your problem with enabling the critical clocks usin=
g
> clk_prepare_enable like other SoCs already do?

I've explained what my issues are already.  I'm not a fan of
hand-rolling and duplicating code which can be consolidated and make
generic.  Call me old fashioned. :)
=20
--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
