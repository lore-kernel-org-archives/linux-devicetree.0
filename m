From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sdm845: Update PIL region
 memory map
Date: Tue, 22 Jan 2019 11:24:05 -0800
Message-ID: <20190122192404.GB31919@minitux>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-2-bjorn.andersson@linaro.org>
 <154818353130.20280.17905705223316470797@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154818353130.20280.17905705223316470797@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 22 Jan 10:58 PST 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-01-21 21:51:03)
> > @@ -103,10 +138,30 @@
> >                         no-map;
> >                 };
> >  
> > +               venus_mem: memory@95800000 {
> > +                       reg = <0 0x95800000 0 0x500000>;
> > +                       no-map;
> > +               };
> > +
> > +               cdsp_mem: memory@95d00000 {
> > +                       reg = <0 0x95d00000 0 0x800000>;
> > +                       no-map;
> > +               };
> > +
> >                 mba_region: memory@96500000 {
> >                         reg = <0 0x96500000 0 0x200000>;
> >                         no-map;
> >                 };
> > +
> > +               slpi_mem: memory@96700000 {
> > +                       reg = <0 0x96700000 0 0x1400000>;
> > +                       no-map;
> > +               };
> > +
> > +               spss_mem: memory@97b00000 {
> > +                       reg = <0 0x97b00000 0 0x100000>;
> > +                       no-map;
> > +               };
> >         };
> >  
> 
> What's the plan if certain configurations don't use all these carveouts?
> Can we mark the reservation nodes as status = "disabled", or the reverse
> and mark them as status = "ok" in all boards, and then reclaim the
> memory for peripherals we don't care to use?
> 

The code path that picks these up does look for "status", so I suggest
that we leave them all enabled in the platform dtsi and then let the
device's reclaim them as needed.

Regards,
Bjorn
