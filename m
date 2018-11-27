From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 1/3] clk: analogbits: add Wide-Range PLL library
Date: Mon, 26 Nov 2018 18:55:37 -0800 (PST)
Message-ID: <alpine.DEB.2.21.9999.1811261726030.16271@viisi.sifive.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com> <20181020135024.28573-2-paul.walmsley@sifive.com> <154045364470.53599.7774255558661483303@swboyd.mtv.corp.google.com> <c1eff982-c7f3-5095-1a82-2ae9afe20b4c@sifive.com>
 <154278980575.88331.16504895003109700312@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1043048292-1543287337=:16271"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154278980575.88331.16504895003109700312@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Megan Wachs <megan@sifive.com>, linux-kernel@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1043048292-1543287337=:16271
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 Nov 2018, Stephen Boyd wrote:
> Quoting Paul Walmsley (2018-11-08 17:01:54)
> > On 10/25/18 12:47 AM, Stephen Boyd wrote:
> > > Quoting Paul Walmsley (2018-10-20 06:50:22)
> > >> diff --git a/drivers/clk/analogbits/wrpll-cln28hpc.c b/drivers/clk/a=
nalogbits/wrpll-cln28hpc.c
> > >> new file mode 100644
> > >> index 000000000000..ebdef859cbf5
> > >> --- /dev/null
> > >> +++ b/drivers/clk/analogbits/wrpll-cln28hpc.c

[...]

> > >> +/**
> > >> + * __wrpll_update_parent_rate() - update PLL data when parent rate =
changes
> > >> + * @c: ptr to a struct analogbits_wrpll_cfg record to write PLL dat=
a to
> > >> + * @parent_rate: PLL input refclk rate (pre-R-divider)
> > >> + *
> > >> + * Pre-compute some data used by the PLL configuration algorithm wh=
en
> > >> + * the PLL's reference clock rate changes.  The intention is to avo=
id
> > >> + * computation when the parent rate remains constant - expected to =
be
> > >> + * the common case.
> > >> + *
> > >> + * Returns: 0 upon success or -1 if the reference clock rate is out=
 of range.
> > >> + */
> > >> +static int __wrpll_update_parent_rate(struct analogbits_wrpll_cfg *=
c,
> > >> +                                     unsigned long parent_rate)
> > >> +{
> > >> +       u8 max_r_for_parent;

[...]

> > >> +
> > >> +       if (parent_rate > MAX_INPUT_FREQ || parent_rate < MIN_POST_D=
IVR_FREQ)
> > >> +               return -1;

[...]

> >=20
> > > Is this case even possible?
> >=20
> > If analogbits_wrpll_configure_for_rate() is called with a parent_rate
> > outside of the PLL's specification range, it seems reasonable to fail -=
-
> > or do you see the situation differently?=C2=A0 These parent rate restri=
ctions
> > are defined in the PLL datasheet.
>=20
> I've been pushing driver writers to use clk_hw_set_rate_range() so that
> the core framework will clamp the frequency to what is supported. Can
> you somehow use that for these clks?

Although the code in this patch is related to a hardware clock source (the=
=20
WRPLL), this code isn't dependent on the Linux clock framework.  It's just=
=20
a library that implements algorithms that are specific to this PLL. =20

Patch 3 ("clk: sifive: add a driver for the SiFive FU540 PRCI IP block")=20
adds drivers/clk/sifive/fu540-prci.c, which integrates the library with=20
the CCF.

We could also make the code in this patch dependent on the Linux clock=20
framework.  My thought was that CCF dependencies weren't really needed in=
=20
this file, and that the algorithms would be easier to read and analyze=20
without them.

So if it's all right with you, I'd propose that we keep clock=20
framework-dependent functions localized into=20
drivers/clk/sifive/fu540-prci.c.

Let me know what you'd like.

> > >  It would be nicer
> > > if this function just returned void.
> >=20
> >=20
> > =C2=A0Is it that you'd prefer the rate check to be moved into
> > analogbits_wrpll_configure_for_rate()?=C2=A0 Or that you'd prefer that =
I not
> > validate the input parent rate at all?
>=20
> I lost the context! But I think I'm just saying that if the clamping is
> done in the core framework with limits then this function can just
> return void because there aren't errors to be had.

OK.  The outcome here seems connected with the discussion outcome on=20
the above comment, since this code is written to avoid adding clock=20
framework dependencies.  So will wait for your thoughts on that before=20
taking action here.

> > >> +/*
> > >> + * Public functions
> > >> + */
> > >> +
> > >> +/**
> > >> + * analogbits_wrpll_configure() - compute PLL configuration for a t=
arget rate
> > >> + * @c: ptr to a struct analogbits_wrpll_cfg record to write into
> > >> + * @target_rate: target PLL output clock rate (post-Q-divider)
> > >> + * @parent_rate: PLL input refclk rate (pre-R-divider)
> > >> + *
> > >> + * Given a pointer to a PLL context @c, a desired PLL target output
> > >> + * rate @target_rate, and a reference clock input rate @parent_rate=
,
> > >> + * compute the appropriate PLL signal configuration values.  PLL
> > >> + * reprogramming is not glitchless, so the caller should switch any
> > >> + * downstream logic to a different clock source or clock-gate it
> > >> + * before presenting these values to the PLL configuration signals.
> > >> + *
> > >> + * The caller must pass this function a pre-initialized struct
> > >> + * analogbits_wrpll_cfg record: either initialized to zero (with th=
e
> > >> + * exception of the .name and .flags fields) or read from the PLL.
> > >> + *
> > >> + * Context: Any context.  Caller must protect the memory pointed to=
 by @c
> > >> + *          from simultaneous access or modification.
> > >> + *
> > >> + * Return: 0 upon success; anything else upon failure.
> > >> + */
> > >> +int analogbits_wrpll_configure_for_rate(struct analogbits_wrpll_cfg=
 *c,
> > >> +                                       u32 target_rate,
> > >> +                                       unsigned long parent_rate)
> > >> +{
> > >> +       unsigned long ratio;
> > >> +       u64 target_vco_rate, delta, best_delta, f_pre_div, vco, vco_=
pre;
> > >> +       u32 best_f, f, post_divr_freq, fbcfg;
> > >> +       u8 fbdiv, divq, best_r, r;
> > >> +
> > >> +       if (!c)
> > >> +               return -1;
> > > -EINVAL? Of course, it's probably better to just not care and blow up=
 if
> > > the user of the API passes in NULL.
> >=20
> >=20
> > Agreed for statically-scoped functions it's most likely overkill.=C2=A0=
 But
> > for globally-scoped functions like this, it seemed better to catch the
> > errors rather than to blow up. The underlying approach was intended to
> > be standard precondition-based (paranoia-based?) development.=C2=A0 See=
ms
> > like I often screw up the calling side during development, so figured
> > this approach would save human time.=C2=A0 The performance impact seems
> > minimal.=C2=A0 That said, if it's your strong preference or requirement=
 for
> > these to be dropped, I will of course do it - let me know.
>=20
> I would still prefer to remove it. It's a semi-global API that's really
> only used and exported by clk providers. We should expect an oops and
> big callstack/crash if some driver author is using the API improperly.
> Hopefully those developers are testing their code, and they see that
> it's experiencing problems here. So the calling side screwing up during
> development will very quickly realize they're doing something wrong vs.
> noticing later that some clk is not there.

OK - dropped the null pointer check.

> > >> +               return -1;
> > >> +       }
> > >> +
> > >> +       fbcfg =3D WRPLL_FLAGS_INT_FEEDBACK_MASK | WRPLL_FLAGS_EXT_FE=
EDBACK_MASK;
> > >> +       if ((c->flags & fbcfg) =3D=3D fbcfg) {
> > >> +               WARN(1, "%s called with invalid PLL config", __func_=
_);
> > >> +               return -1;
> > >> +       }
> > >> +
> > >> +       if (c->flags =3D=3D WRPLL_FLAGS_EXT_FEEDBACK_MASK) {
> > >> +               WARN(1, "%s: external feedback mode not currently su=
pported",
> > >> +                    __func__);
> > >> +               return -1;
> > >> +       }
> > > Like a bunch of this stuff, why are we checking things that the calle=
r
> > > should know to do itself? I'd prefer we keep things simple and assume
> > > the caller knows what they're doing.
> >=20
> > My thinking was that it's easy to screw up if someone is unfamiliar wit=
h
> > the library.=C2=A0 Since the preconditions are computationally simple t=
o
> > verify, the runtime cost is essentially zero.=C2=A0 Put differently, th=
ey are
> > intended to trade off a small amount of CPU time to save a larger amoun=
t
> > of human time.
>=20
> Can we move the checks to build time with some macro that defines the
> configuration structure and has BUILD_BUG_ON() checks?=20

In the short term, I agree that it's unlikely that PLLs will be=20
instantiated with this library using anything other than static C=20
structure records.  In the future, these PLLs may be instantiated=20
completely dynamically from data not available at build time, at which=20
point the static checks won't catch problems there.

> Sure it doesn't have much runtime overhead, but it has a codesize=20
> overhead and mental logic overhead for something that would be better=20
> served with some static check or documentation/comments and code review.=
=20
> Put another way, it's not like this configuration is coming from random=
=20
> user input and so we need to validate the input to make sure it's sane.=
=20
> We can validate the input when merging the code or when building the=20
> code and avoid this all.

Seems like we have similar goals in mind; just different ways of viewing=20
the problem.  I personally rest easier knowing that the preconditions are=
=20
always satisfied before entering the function.  That way there's no need=20
to worry about whether a given library user (which may not be the Linux=20
clock framework) really is careful about what's being passed in.  Another=
=20
nice side effect about verifying parameter domains at runtime is that it=20
can reduce the amount of anguish involved in debugging runtime memory=20
corruption bugs, since the preconditions can catch corruption closer to=20
when it actually happens.

In any case - I will post a revision with them implemented statically, as=
=20
you request.

> > >> +}
> > >> diff --git a/include/linux/clk/analogbits-wrpll-cln28hpc.h b/include=
/linux/clk/analogbits-wrpll-cln28hpc.h
> > >> new file mode 100644
> > >> index 000000000000..cc4268f16067
> > >> --- /dev/null
> > >> +++ b/include/linux/clk/analogbits-wrpll-cln28hpc.h
> > >> +
> > >> +/**
> > >> + * struct analogbits_wrpll_cfg - WRPLL configuration values
> > >> + * @divr: reference divider value (6 bits), as presented to the PLL=
 signals.
> > >> + * @divf: feedback divider value (9 bits), as presented to the PLL =
signals.
> > >> + * @divq: output divider value (3 bits), as presented to the PLL si=
gnals.
> > >> + * @flags: PLL configuration flags.  See above for more information=
=2E
> > >> + * @range: PLL loop filter range.  See below for more information.
> > >> + * @_output_rate_cache: cached output rates, swept across DIVQ.
>=20
> Drop the full-stops on here too please.

Done, thanks.

> > > We don't typically care about this in the kernel, just mark it
> > > static if it's private and non-static if it's public for functions.
> >=20
> > Used to do it this way a long ago, perhaps a bit less incompetently -
> > here's an example:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/mach-omap2/omap_hwmod.c?h=3Dv4.1#n383
> >=20
> > I personally prefer the explicit indication that the identifier was
> > scoped file-local in the calling functions.=C2=A0 But am fine changing =
it per
> > your comments, and have done so.
>=20
> Ok. I haven't really seen the underscores, except for in the cases when
> some framework API needs to be split into some backend multi-plexing
> function to handle different options while keeping the original function
> signature around. Put another way, it's not a kernel idiom for driver
> code, but I'm not too worried about it, so go with your own style if it
> makes you happy.

They've been dropped already from this patch based on our earlier=20
discussion, so will just keep them dropped.

> > > And for struct members we have
> > > kernel doc 'private' tag that can tell users to not do something. Or
> > > worst case, an opaque pointer is stored and only defined in the C fil=
e.
> >=20
> >=20
> > In any case, I've changed the identifier names to align to your comment=
s.
>=20
> Ok. Please also use the private tag to indicate that these are internal
> things that shouldn't be used.

Done.

> > >> + */
> > >> +struct analogbits_wrpll_cfg {
> > >> +       u8 divr;
> > >> +       u8 divq;
> > >> +       u8 range;
> > >> +       u8 flags;
> > >> +       u16 divf;
> > >> +       u32 _output_rate_cache[DIVQ_VALUES];
> > >> +       unsigned long _parent_rate;
> > >> +       u8 _max_r;
> > >> +       u8 _init_r;
> > >> +};
> > >> +
> > >> +/*
> > >> + * Function prototypes
> > >> + */
> > > Please don't have these types of comments. They don't help.
> >=20
> > Dropped this one.=C2=A0 Do you want me to nuke the similar comments in
> > wrpll-cln28hpc.c, separating the private function section from the
> > public functions, for example?
>=20
> Yes.

Done.

Thanks for the review,

- Paul
--8323329-1043048292-1543287337=:16271--
