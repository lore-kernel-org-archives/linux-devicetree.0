From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: power: Add qcom rpm power domain
 driver bindings
Date: Tue, 25 Sep 2018 14:43:10 -0500
Message-ID: <CAL_JsqJQypZbeZRa2u2+nM96p0ZHMHgDSpMbXqZx6zn+OiZSrw@mail.gmail.com>
References: <20180627045234.27403-1-rnayak@codeaurora.org> <20180627045234.27403-3-rnayak@codeaurora.org>
 <20180703223554.GA32313@rob-hp-laptop> <20180704055757.4li26b6poxllmh2k@vireshk-i7>
 <1463d24b-481d-eecd-9e44-e7a5a993e5fc@codeaurora.org> <CAL_JsqJe+m4hD3nxQDjOT1JzRoSMXppy1r6APV1w=NtgCr-X_A@mail.gmail.com>
 <271db7b1-f65b-f42d-b00b-9362429b3749@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <271db7b1-f65b-f42d-b00b-9362429b3749@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 5:25 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Hi Rob,
>
> []...
> >>>>> +   rpmhpd_opp_table: opp-table {
> >>>>> +           compatible = "operating-points-v2-qcom-level";
> >>>>> +
> >>>>> +           rpmhpd_opp_ret: opp1 {
> >>>>> +                   qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> >>>>> +           };
> >>>>
> >>>> I don't see the point in using the OPP binding here when you aren't
> >>>> using *any* of the properties from it.
> >>>
> >>> Yeah, that's the case for now. But there are cases (as Stephen
> >>> mentioned earlier [1]) where the voltage values (and maybe other
> >>> values like current, etc) would be known and filled in DT. And that's
> >>> why we all agreed to use OPP tables for PM domains as well, as these
> >>> are really "operating performance points" of these PM domains.
> >>
> >> Rob, are you fine with these bindings then?
> >
> > Okay, my only thought is whether we should just use 'reg' here, or do
> > we need 'level' for anything else and should make it common?
>
> I am not quite sure I understood what you are suggesting here :(

You could use the  'reg' property instead of 'qcom,level'. Any reason
not to do that?

Alternatively, would 'level' be something useful in other situations
and should not be QCom specific?

Rob
