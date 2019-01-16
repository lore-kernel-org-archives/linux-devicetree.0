From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v11 0/9] Add power domain driver for corners on msm8996/sdm845
Date: Wed, 16 Jan 2019 16:18:50 +0100
Message-ID: <CAPDyKFqyviQ5aF6EO1Ww8Xegsoe-Jj=UGsU9ZwJkaJ_wPVRViA@mail.gmail.com>
References: <20190110040209.6028-1-rnayak@codeaurora.org> <20190110063323.ltmqkl2xl4nhccvq@vireshk-i7>
 <20190116055238.GD25927@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116055238.GD25927@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Collins <collinsd@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jan 2019 at 06:52, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 09 Jan 22:33 PST 2019, Viresh Kumar wrote:
>
> > +Rafael
> >
> > On 10-01-19, 09:32, Rajendra Nayak wrote:
> > > Changes in v11:
> > > * Updated opp-level binding description based on feedback
> > > from Viresh
> > > * Other minor fixups in 'PATCH 2/9'
> >
> > >  Documentation/devicetree/bindings/opp/opp.txt |   3 +
> > >  .../devicetree/bindings/power/qcom,rpmpd.txt  | 145 +++++++
> > >  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  34 ++
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  51 +++
> > >  drivers/opp/core.c                            |  18 +
> > >  drivers/opp/of.c                              |   2 +
> > >  drivers/opp/opp.h                             |   2 +
> > >  drivers/soc/qcom/Kconfig                      |  18 +
> > >  drivers/soc/qcom/Makefile                     |   2 +
> > >  drivers/soc/qcom/rpmhpd.c                     | 402 ++++++++++++++++++
> > >  drivers/soc/qcom/rpmpd.c                      | 317 ++++++++++++++
> > >  include/dt-bindings/power/qcom-rpmpd.h        |  39 ++
> > >  include/linux/pm_opp.h                        |   7 +
> > >  13 files changed, 1040 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> > >  create mode 100644 drivers/soc/qcom/rpmhpd.c
> > >  create mode 100644 drivers/soc/qcom/rpmpd.c
> > >  create mode 100644 include/dt-bindings/power/qcom-rpmpd.h
> >
> > Rafael/Ulf: Who should pick this series ? Should I take this via OPP
> > tree ?
> >
>
> Given that the weight of the patches lies in arm-soc area it could be
> favourable to just take them that way, with the one opp-patch carrying
> your (Rafael's?) ack.
>
> If you prefer otherwise, I suggest that we take patch 6 and 8 (the two
> dts patches) through arm-soc and you merge the rest in your tree.

It sure sounds easiest to funnel this though the soc maintainer tree,
unless Viresh think there are lots of additional changes to the OPP
core going in this cycle, which thus may conflict.

However, it's not my call.

Kind regards
Uffe
