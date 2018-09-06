From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: pm8998 and pmi8998 regulators
Date: Thu, 6 Sep 2018 10:52:06 -0700
Message-ID: <CAD=FV=VE5gYyivgy=OrZV6g0UrtYfZZ+CGv7DV+v5be3teVSdw@mail.gmail.com>
References: <20180901221953.21666-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901221953.21666-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Bjorn,

On Sat, Sep 1, 2018 at 3:19 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> Add regulator definitions for pm8998 and pmi8998 regulators on the MTP.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 216 ++++++++++++++++++++++++
>  1 file changed, 216 insertions(+)

I'm curious why you chose to post this instead of reviewing and/or
building upon the patch I sent up at
<https://lkml.kernel.org/r/20180822173629.202885-3-dianders@chromium.org>.
Compared to mine, yours:

* Seems to have a few rails named differently LDO22 is named
"vreg_l22a_2p95" in your DTS but "vreg_l22a_2p85" in mine as one
example.  The schematics I have (from Dec 5, 2017) show it as 2p85.

* Is missing "regulator-initial-mode".  We can debate this if you want.

* Is lacking many alternate names for rails.  We can debate this also
if you want.

* Have a few voltage values different.  If you have better info than
me we should update to yours.  Diffing against yours does make me
believe that perhaps LDO14 should be listed as 1.88 V in my patch.

* Is lacking pm8005.

Anyway, let me know.  If you provide a review of my patch I'm happy to
spin it with your feedback.


Thanks!

-Doug
