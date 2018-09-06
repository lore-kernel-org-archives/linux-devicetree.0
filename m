From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: pm8998 and pmi8998
 regulators
Date: Thu, 6 Sep 2018 13:12:06 -0700
Message-ID: <20180906201206.GX2523@minitux>
References: <20180901221953.21666-1-bjorn.andersson@linaro.org>
 <CAD=FV=VE5gYyivgy=OrZV6g0UrtYfZZ+CGv7DV+v5be3teVSdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VE5gYyivgy=OrZV6g0UrtYfZZ+CGv7DV+v5be3teVSdw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 06 Sep 10:52 PDT 2018, Doug Anderson wrote:

> Bjorn,
> 
> On Sat, Sep 1, 2018 at 3:19 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > Add regulator definitions for pm8998 and pmi8998 regulators on the MTP.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 216 ++++++++++++++++++++++++
> >  1 file changed, 216 insertions(+)
> 
> I'm curious why you chose to post this instead of reviewing and/or
> building upon the patch I sent up at
> <https://lkml.kernel.org/r/20180822173629.202885-3-dianders@chromium.org>.

Sorry about that, my search skills failed me.

> Compared to mine, yours:
> 
> * Seems to have a few rails named differently LDO22 is named
> "vreg_l22a_2p95" in your DTS but "vreg_l22a_2p85" in mine as one
> example.  The schematics I have (from Dec 5, 2017) show it as 2p85.
> 

Looks like a typo on my part, yours matches the schematics I have as
well.

> * Is missing "regulator-initial-mode".  We can debate this if you want.
> 

Either we start by making them all HPM or we tune as we debug, I'm fine
with your suggestion.

> * Is lacking many alternate names for rails.  We can debate this also
> if you want.
> 

Afaict names such as "vdda_pcie_1p2" is the name of the pin on the
SDM845, while the thing that comes out of the regulator is named
vreg_l26a_1p2.

So I believe this name should be used in the pcie node as:

  vdda_pcie_1p2-supply = <&vreg_l26a_1p2>;

> * Have a few voltage values different.  If you have better info than
> me we should update to yours.  Diffing against yours does make me
> believe that perhaps LDO14 should be listed as 1.88 V in my patch.
> 

Downstream it's listed as min: 1.8V max: 1.88V init: 1.8V.

> * Is lacking pm8005.
> 

I didn't need this, yet...

> Anyway, let me know.  If you provide a review of my patch I'm happy to
> spin it with your feedback.
> 

I will review your patches.

Regards,
Bjorn
