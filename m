From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
Date: Wed, 23 Jan 2019 22:22:13 -0800
Message-ID: <154831093382.136743.12475255729244767722@swboyd.mtv.corp.google.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-4-bjorn.andersson@linaro.org> <CAD=FV=WXind-uk7V_XTDgM83LZbmtKb2Ln6pQjmUkaZMz8SFsA@mail.gmail.com> <20190123002610.GE31919@minitux> <CAD=FV=Wsk3s2NbX4pR6v9-kK41edLF4hd7B_BanoFkAXyLBwyA@mail.gmail.com> <20190123010930.GI31919@minitux> <CAD=FV=Vf+3dAo9pZ=AJ6mrMuYL0f=dBNdk3XLV+tORG0c8hbDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=Vf+3dAo9pZ=AJ6mrMuYL0f=dBNdk3XLV+tORG0c8hbDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2019-01-23 15:24:36)
> Hi,
>=20
> On Tue, Jan 22, 2019 at 5:09 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 22 Jan 16:40 PST 2019, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Tue, Jan 22, 2019 at 4:26 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > > > +               clocks =3D <&xo_board>;
> > > > > > +               clock-names =3D "xo";
> > > > >
> > > > > I've found that nearly all the places that refer to xo_board are =
wrong
> > > > > and should actually point to '<&rpmhcc RPMH_CXO_CLK>'.  Maybe you=
rs
> > > > > should too?
> > > > >
> > > >
> > > > Yes, xo_board is a fake clock representing the 19.2MHz clock feedin=
g the
> > > > cxo (or cxo2) pad of the SoC. So you're definitely right in that th=
is
> > > > should be referencing the actual 19.2MHz clock.
> > > >
> > > > We've kept referring to this as xo_board, as we don't handle probe
> > > > deferral when gcc will probe earlier than rpmcc in the boot and for
> > > > other non-clock drivers the fear of actually hitting 0 on the refco=
unter
> > > > for this (you don't want to disable the cxo while running the syste=
m).
> > >
> > > Note that, as defined in the device tree, "xo_board" is actually 38.4.
> > > IIUC that is not actually a fake/bogus clock but represents the actual
> > > crystal on the board.  There's a divide by 2 in the CPU though so most
> > > peripherals consider "xo" as 19.2.
> > >
> >
> > There's the 38.4MHz XO connected to the PMIC, but the signal going into
> > the CXO_IN pad of the SoC is supposed to come from LNBBCLK1 and be
> > 19.2MHz.
>=20
> Ah, thanks for pointing me to the right clock!  :-)
>=20
> OK, so something is definitely wonky then.  "xo_board" is definitely
> 38.4 currently in the device tree.  That's my fault due to commit
> 5ea3939cf51f ("arm64: dts: sdm845: Fix xo_board clock name and
> speed").  ...but, in my defense:
>=20
> A) The hardcoded "divide by 2" for "bi_tcxo" in "clk-rpmh.c" came from Qu=
alcomm.
>=20
> B) The parent of "bi_tcxo" has always been "xo_board"
>=20
> C) Children of "bi_tcxo" have always been only correct if "bi_tcxo" was 1=
9.2
>=20
>=20
> ...so if "cxo" is really 19.2 then we need to update clk-rpmh to get
> rid of the hardcoded divide by 2 I think?
>=20

It looks OK to me the way it is. Here's why. xo_board is the crystal on
the board. That is 38.4 MHz. The lnbbclk1 signal is 19.2MHz (really? I
thought it was still 38.4 and there was a divider on the CXO pin inside
the SoC). The RPMh driver design to do a div-by-2 on the parent clk is
there to model how the PMIC or the SoC is dividing down that crystal
frequency to be 19.2 MHz for the CXO that the rest of the clk tree in
the SoC sees. So if devices still want to use something that isn't the
rpmh 'bi_tcxo' clk, they should be referencing something like lnbbclk1
as their input clk, and that lnbbclk1 should be a new fixed factor clk
specified in DT that takes the xo_board and creates the lnbbclk1
frequency out of it. Or if we want to get really fancy we can populate
that from the PMIC clk div module itself and then show how the PMIC is
doing the division from the buffer. I don't know if anyone really cares
about this level of detail though.

The reason that certain devices may not want to specify the RPMh clk
'bi_tcxo' is because they may not want the RPM to keep the XO buffer
enabled across low power modes. I don't think this is very common, but
it may be that there isn't any need to do anything besides calculate
some frequency based on the CXO frequency at the SoC's pin and thus
specifying the "raw" XO clk works just as well. I have no idea if that's
the case here.
