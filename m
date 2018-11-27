From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add videocc node
Date: Tue, 27 Nov 2018 11:26:30 -0800
Message-ID: <CAD=FV=XoriDM2Dmj0bYwbqZ+ej6Ybf_XX5DOTSW1_X3eGRkohQ@mail.gmail.com>
References: <1541414117-27864-1-git-send-email-tdas@codeaurora.org>
 <CAD=FV=X3C=oKep1kPWjasLDZdFKfhCs0JMWTOensgYDj=apvuQ@mail.gmail.com> <154330186815.88331.12720647562079303842@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154330186815.88331.12720647562079303842@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 26, 2018 at 10:57 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> > > +               videocc: clock-controller@ab00000 {
> > > +                       compatible = "qcom,sdm845-videocc";
> > > +                       reg = <0xab00000 0x10000>;
> > > +                       #clock-cells = <1>;
> > > +                       #power-domain-cells = <1>;
> >
> > Any reason not to include "#reset-cells = <1>;" here?  The bindings
> > list it as optional but I see no reason why we should leave it off.
> > The file "include/dt-bindings/clock/qcom,videocc-sdm845.h" seems to
> > include some #defines for resets.  Even though the driver doesn't seem
> > like it supports it yet, it still should be fine to list it here.
>
> We should update the binding to make it a required property. It doesn't
> make any sense why that property would be optional given that the
> hardware either has support for resets or it doesn't.

Patch sent for the bindings change.

https://lkml.kernel.org/r/20181127192443.136158-1-dianders@chromium.org
