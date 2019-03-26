From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Date: Tue, 26 Mar 2019 11:47:58 +0530
Message-ID: <CAFp+6iFTb2BeZqXfLXD+R7uo+r1oAYBHMrAWKOugtn91KwhwNg@mail.gmail.com>
References: <20190206051335.23799-1-bjorn.andersson@linaro.org>
 <20190206051335.23799-9-bjorn.andersson@linaro.org> <CAD=FV=UQwsKq1TujmmmR-OiSpMvUp_0b4Vi4Rh9TMGoKgkkkCQ@mail.gmail.com>
 <CAD=FV=Wr7nHWdQFC_+vs5-r_cBGKCsUNZ0mOMMTxdKPe56GUuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=Wr7nHWdQFC_+vs5-r_cBGKCsUNZ0mOMMTxdKPe56GUuQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Doug,


On Thu, Feb 28, 2019 at 2:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Feb 26, 2019 at 3:54 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Feb 5, 2019 at 9:13 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > From: Sibi Sankar <sibis@codeaurora.org>
> > >
> > > This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.
> > >
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Changes since v5:
> > > - None
> > >
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 58 ++++++++++++++++++++++++++++
> > >  1 file changed, 58 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 560c16616ee6..5c41f6fe3e1b 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -1612,6 +1612,64 @@
> > >                         };
> > >                 };
> > >
> > > +               mss_pil: remoteproc@4080000 {
> > > +                       compatible = "qcom,sdm845-mss-pil";
> > > +                       reg = <0 0x04080000 0 0x408>, <0 0x04180000 0 0x48>;
> > > +                       reg-names = "qdsp6", "rmb";
> >
> > I found that when I disabled IOMMU bypass by booting with
> > "arm-smmu.disable_bypass=y" that I'd get this failure:
> >
> > ---
> >
> > [   13.633776] qcom-q6v5-mss 4080000.remoteproc: MBA booted, loading mpss
> > [   13.647694] arm-smmu 15000000.iommu: Unexpected global fault, this
> > could be serious
> > [   13.660278] arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0
> > 0x00000000, GFSYNR1 0x00000781, GFSYNR2 0x00000000
> > ...
> > [   14.648830] qcom-q6v5-mss 4080000.remoteproc: MPSS header
> > authentication timed out
> > [   14.657141] qcom-q6v5-mss 4080000.remoteproc: port failed halt
> > [   14.664983] remoteproc remoteproc0: can't start rproc
> > 4080000.remoteproc: -110
> >
> > ---
> >
> > Adding "iommus = <&apps_smmu 0x781 0>;" here fixed my problem.  NOTE
> > that I'm no expert on IOMMUs so you should confirm that this is right,
> > but if it is then maybe you could include it in the next spin of the
> > series?  I got the "0x781" just by looking at the value of the GFSYNR1
> > in the above splat.  I wasn't sure what to put for the mask so I put
> > 0x0.
>
> Upon more testing the "iommus" line that I came up with avoids the
> global fault but doesn't actually work.  I just get:
>
> qcom-q6v5-mss 4080000.remoteproc: failed to allocate mdt buffer
>
> I'm hoping someone from Qualcomm can help out here and say how this
> should be solved.  Thanks!

I and Sibi had a chance to look at this, and we could compare things
with MTP sdm845
device as well.

>From the 845 block diagram it's clear that one of the MPSS paths goes
through SMMU
and therefore we have the SIDs 0x780 - 0x783 reserved for these streams.
However, it is recommended to use them in a bypass mode (S2CR_TYPE_BYPASS).

On MTP devices, the secure code programs these SIDs in SMMU and, as these
SMRs are marked secure they are not visible to the kernel. Thus kernel wouldn't
overwrite anything.
However, in your case there's no such reservation by the secure code.
In such a case,
we may need to make SMMU aware of these SIDs in the kernel.

And please note that adding "iommus = <&apps_smmu 0x781 0>" to the PIL
device may not
be the correct thing to do, since actual MPSS data streams don't use the SMMU.
So, configuring DMA path via SMMU isn't right.

Thanks & regards
Vivek

>
>
> -Doug



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
