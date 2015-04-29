From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 29 Apr 2015 15:17:51 +0100
Message-ID: <20150429141751.GR9169@x1>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
 <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
 <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150422093446.GA28007@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Wed, 22 Apr 2015, Maxime Ripard wrote:

> On Wed, Apr 08, 2015 at 06:23:44PM +0100, Lee Jones wrote:
> > On Wed, 08 Apr 2015, Maxime Ripard wrote:
> >=20
> > > On Wed, Apr 08, 2015 at 11:38:32AM +0100, Lee Jones wrote:
> > > > On Wed, 08 Apr 2015, Maxime Ripard wrote:
> > > >=20
> > > > > On Wed, Apr 08, 2015 at 09:14:50AM +0100, Lee Jones wrote:
> > > > > > > > +
> > > > > > > > +		    This property is not to be abused.  It is only t=
o be used to
> > > > > > > > +		    protect platforms from being crippled by gated c=
locks, not
> > > > > > > > +		    as a convenience function to avoid using the fra=
mework
> > > > > > > > +		    correctly inside device drivers.
> > > > > > >=20
> > > > > > > Disregarding what's stated here, I'm pretty sure that thi=
s will
> > > > > > > actually happen. Where do you place the cursor?
> > > > > >=20
> > > > > > That's up to Mike.
> > > > >=20
> > > > > Except that Mike won't review any of the DT changes, so he wo=
n't be
> > > > > able to refrain users from using it. Let alone out-of-tree DT=
s using a
> > > > > mainline kernel.
> > > >=20
> > > > Ideally Mike should be Cc'ed on patches using clock bindings, b=
ut if
> > > > he isn't the DT guys are smart enough to either make the right
> > > > decisions themselves (Rob has Acked these bindings already, so =
will be
> > > > on the lookout for misuse, I'm sure), or ask for Mike's help.
> > >=20
> > > Yeah, right, as if this strategy really worked in the past....
> > >=20
> > > Do we really want to look at even the DT bindings that have actua=
lly
> > > been reviewed by maintainers that got merged?
> > >=20
> > > They don't have time for that, which is totally fine, but we real=
ly
> > > should bury our head in the sand by actually thinking they will r=
eview
> > > every single DT-related patch.
> > >=20
> > > Using that as an argument is just plain denial of what really hap=
pened
> > > for the past 4 years.
> >=20
> > I agree that it's a problem, but this is a process problem and has
> > nothing to do with this set.  If you have a problem with the curren=
t
> > process and have a better alternative, submit your thoughts to the =
DT
> > list.  Rejecting all new bindings because you are frightened that t=
hey
> > will be used in a manner that they were not intended is not the way=
 to
> > go though.
>=20
> I'm not saying that this binding should not go in because of a proces=
s
> issue.
>=20
> I'm saying that discarding arguments against your binding by adding
> restrictions that cannot be enforced is not reasonable.

I'm open to constructive suggestions/alternatives.

Hand rolling this stuff in C per vendor is not of of them.

> > > > > > > Should we create a new driver for our RAM controller, or =
do we want to
> > > > > > > use clock-always-on?
> > > > > >=20
> > > > > > I would say that if all the driver did was to enable clocks=
, then you
> > > > > > should use this instead.  This binding was designed specifi=
cally for
> > > > > > that purpose.
> > > > > >=20
> > > > > > However, if the aforementioned driver clock can be safely g=
ated, then
> > > > > > it should not be an always-on clock.
> > > > >=20
> > > > > Yeah, of course, I understand the original intent of it, but =
that
> > > > > argument, which might very well be true at one point in time,=
 might
> > > > > not be true anymore two or three releases later.
> > > >=20
> > > > Why?  The H/W isn't going to change in two or three releases.  =
The
> > > > clocks designated as 'always-on' will have to be on forever, or
> > > > synonymously, 'always'.
> > > >
> > > > > And that driver might actually rely on the fact that the cloc=
k is shut
> > > > > down, which won't be the case.
> > > >=20
> > > > I think you are missing the point of this binding.  The driver =
can
> > > > never rely on that in this use-case.  If the clock is off, ther=
e is no
> > > > device driver, period.=20
> > >=20
> > > Ok. So CPU hotplug or cpuidle is not a thing then? I'm pretty sur=
e the
> > > PM guys will be happy to hear that.
> > >=20
> > > And they are not device drivers, are not mandatory in the system,=
 and
> > > it's usually a good thing to keep the CPU running whenever you do=
n't
> > > have such drivers.
> > >=20
> > > > > Introducing a DT interface solely by refering to the current =
state of
> > > > > a driver is a bit odd.
> > > >=20
> > > > I'm not sure I get your point.  This binding has nothing to do =
with
> > > > drivers.
> > >=20
> > > It's all about drivers. Or rather all about missing drivers.
> >=20
> > I think you are going to have to be more forthcoming with your issu=
es
> > with this binding, because I'm struggling to understand what your
> > problem with it is.  You have already pointed me to vendors which h=
ave
> > a genuine/valid need for it.  But instead you'd prefer they hand-ro=
ll
> > their own implementations over multiple lines of C code (each).
>=20
> I told you already.
>=20
> If you have that property, there's absolutely no way to do any kind o=
f
> clock management in the future.
>=20
> It might be fine for your use case, but see my point about the
> unreasonable restriction. People are going to use it for clocks that
> just don't have a driver *yet*, and when that driver will be merged w=
e
> will end up with a driver that (for example) makes the assumption tha=
t
> the clock has been shut down to reset the IP, that might or might not
> be the case, depending on how old the DT is exactly.

There is a need for this binding, but as you say, it must not be
abused.  So how to we get people not to use it willy-nilly?

IMO, if people choose to ignore the stark warning in the documentation
then that's they're lookout.  I guess you'd like to wrap them in more
cotton wool than I would.  That's fine too, but how.

> This will be even a bigger madness if you ask me.
>=20
> > > > > > > Do we really want to enforce this if we ever gain a drive=
r that would
> > > > > > > actually be able to manage its clock (like do we want the=
 CPU clock to
> > > > > > > never *ever* be gated just because we don't have a cpuidl=
e/hotplug
> > > > > > > driver yet?)
> > > > > >=20
> > > > > > As I've just mentioned, if a clock 'can' be turned off, thi=
s binding
> > > > > > should never be used. Situations where using always-on as a=
 stop-gap
> > > > > > due to a lack of current functionality is what the paragrap=
h above is
> > > > > > trying to mitigate.
> > > > >=20
> > > > > But it's not really what this property is about. What this pr=
operty
> > > > > describes is that these clocks should never be gated. Any poi=
nt in
> > > > > time during the life of the system AND with in any kernel ver=
sion.
> > > >=20
> > > > You got it, that's correct -- these clocks should never be gate=
d.
> > > >=20
> > > > So why would that ever change?  If that is likely (or even poss=
ible)
> > > > to change in the future then this binding should not be used.
> > > >
> > > > To reiterate; this binding should be used on ungatable clocks o=
nly.
> > > > Non-negotiable, non-changeable either by the introduction of ne=
w
> > > > functionality/support or kernel version.
> > >=20
> > > I'm pretty sure that if that patch gets merged, by the end of the
> > > year, there will be "incorrect" users by your standards.
> >=20
> > It's possible to abuse any binding.  I don't see why you are so
> > offended of this one in particular.
>=20
> I'm not offended, I just tried to push the same kind of patches two
> years ago, with Mike pushing back, and actually came to see that he
> was right a few monthes down the road.

Well this was suggested by Mike.  I even have his Ack already.  So I
guess he too has changed the error of his ways. :)

> And yeah, your point that any binding can be abused is true. This one
> is only so easy to abuse it's not even funny.
>=20
> > > If you introduce a feature, you should expect people to use
> > > it.  If not, what's the point?
> >=20
> > By your own admission, there are genuine users for this binding and=
 I
> > expect people to use it.
>=20
> The only thing that we really disagree upon is that whether that
> restriction will really be followed. You expect people to, I
> don't. It's the fundamental disagreement we have, that really prevent
> any purely technical discussion.
>=20
> Maybe we can try to address that before moving forward?

I'd like that.

If a firm warning isn't good enough, then what will be?

> > > > > > > Have you seen the numerous NAK on such approach Mike did?
> > > > > >=20
> > > > > > I haven't, but the folks reviewing previous versions have. =
 Do you
> > > > > > have something specific in mind that you'd like to bring to=
 my
> > > > > > attention?
> > > > >=20
> > > > > Unfortunately, I haven't been able to dig out such mails. But=
 it's why
> > > > > we ended up with clock protection code in various clock drive=
rs
> > > > > including:
> > > > >=20
> > > > > AT91: http://lxr.free-electrons.com/source/drivers/clk/at91/c=
lk-slow.c#L484
> > > > > iMX28: http://lxr.free-electrons.com/source/drivers/clk/mxs/c=
lk-imx28.c#L154
> > > > > Rockchip: http://lxr.free-electrons.com/source/drivers/clk/ro=
ckchip/clk.c#L320
> > > > > sunXi: http://lxr.free-electrons.com/source/drivers/clk/sunxi=
/clk-sunxi.c#L1183
> > > > > Zynq: http://lxr.free-electrons.com/source/drivers/clk/zynq/c=
lkc.c#L504
> > > > >=20
> > > > > Which is much more flexible, since you won't have to modify t=
he DT to
> > > > > change which clocks are to be left enabled, as well as way ea=
sier to
> > > > > debug if you ever have to remove that property from the DT.
> > > >=20
> > > > You're right, you don't have the change the DT in these cases. =
 You
> > > > have to write new C code, which is _less_ flexible.
> > >=20
> > > I'm sorry to learn that you never heard of that stable-DT thing.
> > >=20
> > > And a bit sorry to see that a maintainer is really seeing C as no=
t
> > > flexible.
> >=20
> > You're putting words in my mouth.  I didn't say C was not flexible.
> >=20
> > I'm referencing the original DT pros i.e. it is possible to supply =
a
> > different configuration without the need to compile the kernel.
> > That's certainly true in this case.  We can provide a clk-provider =
and
> > tag it as always-on, all without re-compile.
> >=20
> > > > So all these platforms are adding their own hand-rolled version=
 of
> > > > this binding, adding more duplication and cruft to the kernel.
> > > > Instead they can use this 'always-on' and we can consolidate an=
d strip
> > > > it all out.
> > >=20
> > > Except that all these platforms are actually not implementing a
> > > binding, ie not an interface with the DT they are bound to. Each =
and
> > > every of these platforms can change that list whenever they wish,=
 just
> > > by sending a single one-liner patch (just like the DT, really.).
> > >=20
> > > Which is not something that you can achieve with a DT binding.
> >=20
> > Once again, can you give me more information about why you have suc=
h a
> > problem with this binding.  I wish for it to be stable/ABI, I wish =
for
> > it never to be removed, I envisage it will always be needed, so wha=
t's
> > the problem?=20
> >=20
> > Do you have a vested interest that I am missing?
> >=20
> > Perhaps an example of possible calamity will help convince me that
> > you're not completely wrong and blowing everything out of proportio=
n
> > for no good reason.
>=20
> Let's say you've introduced such a clock in kernel 4.0 for the memory
> clock.
>=20
> At some point down the road, you create a ddrfreq driver (if that eve=
r
> exists). You have a new driver, which will manage the clock.
>=20
> In that driver, for some reason, you have to shutdown the clock to
> reset the DDR controller. Of course that also means that you will be
> removing the clk-always-on property from your DT.
>=20
> You will have in your driver something like:
>=20
> /* Reset our controller */
> clk_disable(clk);
> clk_enable(clk):
>=20
> And then, you expect your controller to be in its out-of-reset
> state. Which will be the case with a new DT, and not with the old one=
,
> probably creating all kind of very entertaining issues to debug.
>=20
> All of this wouldn't be the case if you had this inside the kernel,
> since (hopefully) the kernel is consistent with itself.

Surely you must have realised already that DTBs are more tightly
coupled to kernel versions than we would have initially liked?  It's
naive to assume that old DTBs will 'just-work' with newer kernels.

Wrong decisions related to DT are being made daily.  Adding mistakenly
or foolhardily adding 'clk-always-on' to a DTS is not going to be the
sole cause of breakage somewhere down the line.

Pushing back on the acceptance of this binding based on idealistic,
possibly already out-of-date premise is just frustrating.

This useful binding should be accepted and people should not abuse
it.  If they do and the vendor Maintainer's review and accept then
they have no foundation for recourse.

Would you prefer it if I made the warning starker?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
