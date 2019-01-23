From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
Date: Wed, 23 Jan 2019 15:24:36 -0800
Message-ID: <CAD=FV=Vf+3dAo9pZ=AJ6mrMuYL0f=dBNdk3XLV+tORG0c8hbDg@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-4-bjorn.andersson@linaro.org> <CAD=FV=WXind-uk7V_XTDgM83LZbmtKb2Ln6pQjmUkaZMz8SFsA@mail.gmail.com>
 <20190123002610.GE31919@minitux> <CAD=FV=Wsk3s2NbX4pR6v9-kK41edLF4hd7B_BanoFkAXyLBwyA@mail.gmail.com>
 <20190123010930.GI31919@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123010930.GI31919@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Taniya Das <tdas@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jan 22, 2019 at 5:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 22 Jan 16:40 PST 2019, Doug Anderson wrote:
>
> > Hi,
> >
> > On Tue, Jan 22, 2019 at 4:26 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > > > +               clocks = <&xo_board>;
> > > > > +               clock-names = "xo";
> > > >
> > > > I've found that nearly all the places that refer to xo_board are wrong
> > > > and should actually point to '<&rpmhcc RPMH_CXO_CLK>'.  Maybe yours
> > > > should too?
> > > >
> > >
> > > Yes, xo_board is a fake clock representing the 19.2MHz clock feeding the
> > > cxo (or cxo2) pad of the SoC. So you're definitely right in that this
> > > should be referencing the actual 19.2MHz clock.
> > >
> > > We've kept referring to this as xo_board, as we don't handle probe
> > > deferral when gcc will probe earlier than rpmcc in the boot and for
> > > other non-clock drivers the fear of actually hitting 0 on the refcounter
> > > for this (you don't want to disable the cxo while running the system).
> >
> > Note that, as defined in the device tree, "xo_board" is actually 38.4.
> > IIUC that is not actually a fake/bogus clock but represents the actual
> > crystal on the board.  There's a divide by 2 in the CPU though so most
> > peripherals consider "xo" as 19.2.
> >
>
> There's the 38.4MHz XO connected to the PMIC, but the signal going into
> the CXO_IN pad of the SoC is supposed to come from LNBBCLK1 and be
> 19.2MHz.

Ah, thanks for pointing me to the right clock!  :-)

OK, so something is definitely wonky then.  "xo_board" is definitely
38.4 currently in the device tree.  That's my fault due to commit
5ea3939cf51f ("arm64: dts: sdm845: Fix xo_board clock name and
speed").  ...but, in my defense:

A) The hardcoded "divide by 2" for "bi_tcxo" in "clk-rpmh.c" came from Qualcomm.

B) The parent of "bi_tcxo" has always been "xo_board"

C) Children of "bi_tcxo" have always been only correct if "bi_tcxo" was 19.2


...so if "cxo" is really 19.2 then we need to update clk-rpmh to get
rid of the hardcoded divide by 2 I think?


-Doug
