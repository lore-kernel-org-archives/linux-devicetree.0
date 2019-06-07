From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
Date: Fri, 07 Jun 2019 16:18:41 -0700
Message-ID: <20190607231841.D101120825@mail.kernel.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org> <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org> <20190607203838.1361E208C3@mail.kernel.org> <CAOCk7NrnnUzaXtnRvH0pHyHha4sTQDQCRoVPPatHfgVuEPZr0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOCk7NrnnUzaXtnRvH0pHyHha4sTQDQCRoVPPatHfgVuEPZr0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-06-07 14:31:13)
> On Fri, Jun 7, 2019 at 2:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Jeffrey Hugo (2019-05-21 07:52:28)
> > > On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> > > > The multimedia clock controller (mmcc) is the main clock controller=
 for
> > > > the multimedia subsystem and is required to enable things like disp=
lay and
> > > > camera.
> > >
> > > Stephen, I think this series is good to go, and I have display/gpu st=
uff
> > > I'm polishing that will depend on this.  Would you kindly pickup patc=
hes
> > > 1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 a=
nd 6.
> > >
> >
> > If I apply patch 3 won't it break boot until patch 2 is also in the
> > tree? That seems to imply that I'll break bisection, and we have
> > kernelci boot testing clk-next so this will probably set off alarms
> > somewhere.
>=20
> Yes, it'll break boot.  Maybe you and Bjorn can make a deal?  (more below)
>=20
> Doesn't look like kernelci is running tests on 8998 anymore, so maybe
> no one will complain?  As far as I am aware, Marc, Lee, Bjorn, and I
> are the only ones whom care about 8998 presently, and I think we are
> all good with a temporary breakage in order to get this basic
> functionality in since the platform isn't really well supported yet.

Ok.

>=20
> >
> > I thought we had some code that got removed that was going to make the
> > transition "seamless" in the sense that it would search the tree for an
> > RPM clk controller and then not add the XO fixed factor clk somehow.
> > See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
> > clocks") for the code that we removed. So ideally we do something like
> > this too, but now we search for a property on the calling node to see if
> > the XO clk is there?
> >
>=20
> Trying to remember back a bit.
>=20
> I don't think its possible.  Maybe I'm wrong.  I didn't see a solution
> to the below:
>=20
> How does GCC know the following?
> -RPMCC is compiled in the build (I guess this can be assumed)

This is the IS_ENABLED part.

> -RPMCC has probed
> -RPMCC is not and will not be providing XO

Presumably if it's enabled then it will be providing XO at some point in
the future. I'm not suggesting the probe defer logic is removed, just
that we don't get into a state where clk tree has merged all the patches
for clk driver side and that then relies on DT to provide the clk but it
doesn't do that.

So the idea is to check if RPM is compiled in and also check the GCC DT
node for the clocks property having the xo clk there. Then we assume
that we have the clk patches in place for the RPM clk driver to provide
that clk and we skip inserting the fake clk that RPM is going to
provide.

This is also a "general" solution to GCC not depending on or selecting
the RPM clk driver. It may be better to just have a select statement in
GCC Kconfig so that we can't enable the GCC driver without also enabling
the RPM driver if it's an essential dependency to the clk tree working.
But if we do this design then we can make the clk tree keep working
regardless of RPM being there or not, which may be a good thing.
