From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] clk: Provide always-on clock support
Date: Mon, 2 Mar 2015 10:18:59 +0000
Message-ID: <20150302101859.GB32347@x1>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
 <1425071674-16995-4-git-send-email-lee.jones@linaro.org>
 <CAJe_Zhf=GBb8AfnTLaGxGcZkVSm9TtdnTsmpH_MBmbMT8ViMDg@mail.gmail.com>
 <20150302083652.GE31325@x1>
 <CABb+yY07woiiG8e2kff_AsiFCHNP+TKYyNm_o6=f5WmFsLi8gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY07woiiG8e2kff_AsiFCHNP+TKYyNm_o6=f5WmFsLi8gQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, kernel@stlinux.com, Stephen Boyd <sboyd@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 02 Mar 2015, Jassi Brar wrote:

> On Mon, Mar 2, 2015 at 2:06 PM, Lee Jones <lee.jones@linaro.org> wrot=
e:
> > On Sat, 28 Feb 2015, Jassi Brar wrote:
> >
> >> On 28 February 2015 at 02:44, Lee Jones <lee.jones@linaro.org> wro=
te:
> >> > Lots of platforms contain clocks which if turned off would prove=
 fatal.
> >> > The only way to recover from these catastrophic failures is to r=
estart
> >> > the board(s).  Now, when a clock is registered with the framewor=
k it is
> >> > compared against a list of provided always-on clock names which =
must be
> >> > kept ungated.  If it matches, we enable the existing CLK_IGNORE_=
UNUSED
> >> > flag, which will prevent the common clk framework from attemptin=
g to
> >> > gate it during the clk_disable_unused() procedure.
> >> >
> >> If a clock is critical on a certain board, it could be got+enabled
> >> during early boot so there is always a user.
> >
> > I tried this.  There was push-back from the DT maintainers.
> >
> >   http://lists.infradead.org/pipermail/linux-arm-kernel/2015-Februa=
ry/324417.html
> >
> Thanks, I wasn't aware of the history.
>=20
> >> To be able to do that from DT, maybe add a new, say, CLK_ALWAYS_ON
> >> flag could be made to initialize the clock with one phantom user
> >> already. Or just reuse the CLK_IGNORE_UNUSED?
> >
> > How is that different to what this set is doing?
> >
> The phantom user - that's there but none can see it.
>=20
> How about?
>=20
> +       of_property_for_each_string(np, "clock-always-on", prop, clkn=
ame) {
> +               clk =3D __clk_lookup(clkname);
> +               if (!clk)
> +                       continue;
> +
> +               clk->core->enable_count =3D 1;
> +               clk->core->prepare_count =3D 1;
> +       }

This is only fractionally different from the current implementation.=20

I believe the current way it slightly nicer, as we don't have to fake
the user count.  This solution is saying "one of the drivers is still
consuming this clock", instead, in the original implementation we're
saying "we know there are no consumers of this clock, but keep it on
anyway due to [insert reason here]".

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
