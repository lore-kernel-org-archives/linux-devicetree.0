From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS
 nodes
Date: Tue, 22 Jan 2019 16:26:10 -0800
Message-ID: <20190123002610.GE31919@minitux>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-4-bjorn.andersson@linaro.org>
 <CAD=FV=WXind-uk7V_XTDgM83LZbmtKb2Ln6pQjmUkaZMz8SFsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WXind-uk7V_XTDgM83LZbmtKb2Ln6pQjmUkaZMz8SFsA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 22 Jan 15:46 PST 2019, Doug Anderson wrote:

> Hi,
> 
> On Mon, Jan 21, 2019 at 9:52 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Add the ADSP and CDSP nodes for PAS-based remoteproc, supporting booting
> > these cores on e.g. the MTP, and enable the same for the MTP.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v2:
> > - New patch
> >
> >  arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  8 ++++
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 58 +++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> 
> It's a bit of a nit of mine that if it's not totally obvious what
> acronyms mean that they should be spelled out in places that use them.
> 
> In this case I believe ADSP is the Audio DSP.  Is CDSP the Camera DSP?  ...or ?
> 

C as in Compute. I'll spell these out as I respin the series.

> 
> > +       adsp_pas: remoteproc-adsp {
> > +               compatible = "qcom,sdm845-adsp-pas";
> > +
> > +               interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> > +                                     <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +                                     <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +                                     <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +                                     <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > +               interrupt-names = "wdog", "fatal", "ready",
> > +                                 "handover", "stop-ack";
> > +
> > +               clocks = <&xo_board>;
> > +               clock-names = "xo";
> 
> I've found that nearly all the places that refer to xo_board are wrong
> and should actually point to '<&rpmhcc RPMH_CXO_CLK>'.  Maybe yours
> should too?
> 

Yes, xo_board is a fake clock representing the 19.2MHz clock feeding the
cxo (or cxo2) pad of the SoC. So you're definitely right in that this
should be referencing the actual 19.2MHz clock.

We've kept referring to this as xo_board, as we don't handle probe
deferral when gcc will probe earlier than rpmcc in the boot and for
other non-clock drivers the fear of actually hitting 0 on the refcounter
for this (you don't want to disable the cxo while running the system).

I'll give it a spin with appropriate reference and see what happens, I
think this should either be changed or documented in the commit message.

Thanks,
Bjorn
