From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sdm845: Update PIL region
 memory map
Date: Tue, 22 Jan 2019 15:10:49 -0800
Message-ID: <CAD=FV=UgQtPZj-EWCzqGqgAbfijjd+j7kO8XsXttJKfejEzBzg@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-2-bjorn.andersson@linaro.org> <154818353130.20280.17905705223316470797@swboyd.mtv.corp.google.com>
 <20190122192404.GB31919@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122192404.GB31919@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jan 22, 2019 at 11:24 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 22 Jan 10:58 PST 2019, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2019-01-21 21:51:03)
> > > @@ -103,10 +138,30 @@
> > >                         no-map;
> > >                 };
> > >
> > > +               venus_mem: memory@95800000 {
> > > +                       reg = <0 0x95800000 0 0x500000>;
> > > +                       no-map;
> > > +               };
> > > +
> > > +               cdsp_mem: memory@95d00000 {
> > > +                       reg = <0 0x95d00000 0 0x800000>;
> > > +                       no-map;
> > > +               };
> > > +
> > >                 mba_region: memory@96500000 {
> > >                         reg = <0 0x96500000 0 0x200000>;
> > >                         no-map;
> > >                 };
> > > +
> > > +               slpi_mem: memory@96700000 {
> > > +                       reg = <0 0x96700000 0 0x1400000>;
> > > +                       no-map;
> > > +               };
> > > +
> > > +               spss_mem: memory@97b00000 {
> > > +                       reg = <0 0x97b00000 0 0x100000>;
> > > +                       no-map;
> > > +               };
> > >         };
> > >
> >
> > What's the plan if certain configurations don't use all these carveouts?
> > Can we mark the reservation nodes as status = "disabled", or the reverse
> > and mark them as status = "ok" in all boards, and then reclaim the
> > memory for peripherals we don't care to use?
> >
>
> The code path that picks these up does look for "status", so I suggest
> that we leave them all enabled in the platform dtsi and then let the
> device's reclaim them as needed.

Does that mean we should add labels for all of the sub-nodes so that
boards can easily mark them "disabled"?

-Doug
