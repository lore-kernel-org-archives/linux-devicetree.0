From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe
 sequence handler on MTP
Date: Sun, 11 Aug 2019 12:01:59 -0700
Message-ID: <20190811190159.GQ26807@tuxbook-pro>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-5-vivek.gautam@codeaurora.org>
 <20190805222627.GA2634@builder>
 <CAFp+6iHGrXAJ2Y1ewxaePGYEcbnprjScUnGyR61qvOv03HVZhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iHGrXAJ2Y1ewxaePGYEcbnprjScUnGyR61qvOv03HVZhQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Sun 11 Aug 09:08 PDT 2019, Vivek Gautam wrote:

> On Tue, Aug 6, 2019 at 3:56 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
> >
> > > Indicate on MTP SDM845 that firmware implements handler to
> > > TLB invalidate erratum SCM call where SAFE sequence is toggled
> > > to achieve optimum performance on real-time clients, such as
> > > display and camera.
> > >
> > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 78ec373a2b18..6a73d9744a71 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -2368,6 +2368,7 @@
> > >                       compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
> > >                       reg = <0 0x15000000 0 0x80000>;
> > >                       #iommu-cells = <2>;
> > > +                     qcom,smmu-500-fw-impl-safe-errata;
> >
> > Looked back at this series and started to wonder if there there is a
> > case where this should not be set? I mean we're after all adding this to
> > the top 845 dtsi...
> 
> My bad.
> This is not valid in case of cheza. Cheza firmware doesn't implement
> the safe errata handling hook.
> On cheza we just have the liberty of accessing the secure registers
> through scm calls - this is what
> we were doing in earlier patch series handling this errata.
> So, a property like this should go to mtp board's dts file.
> 

It would have been nice if the common case was just selected by default,
but afaict no safe workaround is needed on Cheza? You mention here that
it should (could?) use the scm write based approach instead, would an
introduction of that come with another flag?


PS. In it's current form it's correct that this should be moved to the
device dts files - all but one of them...

Regards,
Bjorn
