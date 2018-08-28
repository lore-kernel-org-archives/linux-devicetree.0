From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: qcom: Add some missing gcc clks for msm8996
Date: Tue, 28 Aug 2018 15:51:32 -0700
Message-ID: <153549669279.129321.14626645105795361106@swboyd.mtv.corp.google.com>
References: <20180809220119.18932-1-bjorn.andersson@linaro.org>
 <153391387168.37448.10798348572941173469@swboyd.mtv.corp.google.com>
 <20180813184351.GG23866@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180813184351.GG23866@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-08-13 11:43:51)
> On Fri 10 Aug 08:11 PDT 2018, Stephen Boyd wrote:
> =

> > Quoting Bjorn Andersson (2018-08-09 15:01:19)
> > > From: Rajendra Nayak <rnayak@codeaurora.org>
> > > =

> > > Add a few missing gcc clks for msm8996
> > > =

> > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > [bjorn: omit aggre0_noc_qosgen_extref_clk]
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > =

> > This is still going on?! I'm going to ignore Rob's auto email on this
> > patch.
> > =

> =

> There wasn't much "going on" since your last reply, found this on the
> floor between some chairs...
> =

> =

> The issue pointed to you on v1 was that there was another patch that
> already added two of the clocks, so this v2 simply drops the two
> duplicated clocks; i.e. solves the merge conflict.
> =

> What I see now is that I did forget to carry Rob's R-b from v1.
> =


Ok. I see that I had applied it and then held off because of the
duplicate entry error. I'll add Rob's reviewed-by and take this patch
instead of the one I had months ago. Sad that we lose the proper parent
linkage.
