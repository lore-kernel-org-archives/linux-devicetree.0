From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
Date: Tue, 22 Jan 2019 16:40:36 -0800
Message-ID: <CAD=FV=Wsk3s2NbX4pR6v9-kK41edLF4hd7B_BanoFkAXyLBwyA@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-4-bjorn.andersson@linaro.org> <CAD=FV=WXind-uk7V_XTDgM83LZbmtKb2Ln6pQjmUkaZMz8SFsA@mail.gmail.com>
 <20190123002610.GE31919@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123002610.GE31919@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jan 22, 2019 at 4:26 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> > > +               clocks = <&xo_board>;
> > > +               clock-names = "xo";
> >
> > I've found that nearly all the places that refer to xo_board are wrong
> > and should actually point to '<&rpmhcc RPMH_CXO_CLK>'.  Maybe yours
> > should too?
> >
>
> Yes, xo_board is a fake clock representing the 19.2MHz clock feeding the
> cxo (or cxo2) pad of the SoC. So you're definitely right in that this
> should be referencing the actual 19.2MHz clock.
>
> We've kept referring to this as xo_board, as we don't handle probe
> deferral when gcc will probe earlier than rpmcc in the boot and for
> other non-clock drivers the fear of actually hitting 0 on the refcounter
> for this (you don't want to disable the cxo while running the system).

Note that, as defined in the device tree, "xo_board" is actually 38.4.
IIUC that is not actually a fake/bogus clock but represents the actual
crystal on the board.  There's a divide by 2 in the CPU though so most
peripherals consider "xo" as 19.2.

...OK, confirmed.  The actual RF_XO_CLK pin on the board is truly
connected to 38.4.

-Doug
