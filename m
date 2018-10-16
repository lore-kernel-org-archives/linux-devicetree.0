From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: ufs: Fix the compatible string definition
Date: Tue, 16 Oct 2018 11:21:30 +0530
Message-ID: <CAFp+6iGxvDoptnjM18ggnHqX6MV0+HFqsnCMi61b8gquBxaYmw@mail.gmail.com>
References: <20181012213926.253765-1-dianders@chromium.org>
 <CAFp+6iFy8V34cs6pEOie_tBX5wJqM7teUnH_XLLZ7cioPrX_hA@mail.gmail.com> <CAD=FV=WYM5OOigy+81cVzPtAJXhvrhB1znr9zHzMf3q5iFOtFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WYM5OOigy+81cVzPtAJXhvrhB1znr9zHzMf3q5iFOtFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: robh+dt <robh+dt@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Can Guo <cang@codeaurora.org>, evgreen@chromium.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, sayalil@codeaurora.org, asutoshd@codeaurora.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, liwei213@huawei.com, open list <linux-kernel@vger.kernel.org>, malat@debian.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 15, 2018 at 10:54 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Vivek,
>
> On Mon, Oct 15, 2018 at 8:23 AM Vivek Gautam
> <vivek.gautam@codeaurora.org> wrote:
> >
> > Hi Doug,
> >
> > On Sat, Oct 13, 2018 at 3:09 AM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > If you look at the bindings for the UFS Host Controller it says:
> > >
> > > - compatible: must contain "jedec,ufs-1.1" or "jedec,ufs-2.0", may
> > >               also list one or more of the following:
> > >                  "qcom,msm8994-ufshc"
> > >                  "qcom,msm8996-ufshc"
> > >                  "qcom,ufshc"
> > >
> > > My reading of that is that it's fine to just have either of these:
> > > 1. "qcom,msm8996-ufshc", "jedec,ufs-2.0"
> > > 2. "qcom,ufshc", "jedec,ufs-2.0"
> > >
> > > As far as I can tell neither of the above is actually a good idea.
> > >
> > > For #1 it turns out that the driver currently only keys off the
> > > compatible string "qcom,ufshc" so it won't actually probe.
> > >
> > > For #2 the driver won't probe but it's not a good idea to keep the SoC
> > > name out of the compatible string.
> > >
> > > Let's update the compatible string to make it really explicit.  We'll
> > > include a nod to the existing driver and the old binding and say that
> > > we should always include the "qcom,ufshc" string in addition to the
> > > SoC compatible string.
> > >
> > > While we're at it we'll also include another example SoC known to have
> > > UFS: sdm845.
> > >
> > > Fixes: 47555a5c8a11 ("scsi: ufs: make the UFS variant a platform device")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt       | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > index 2df00524bd21..69a06a1b732e 100644
> > > --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > @@ -4,11 +4,14 @@ UFSHC nodes are defined to describe on-chip UFS host controllers.
> > >  Each UFS controller instance should have its own node.
> > >
> > >  Required properties:
> > > -- compatible           : must contain "jedec,ufs-1.1" or "jedec,ufs-2.0", may
> > > -                         also list one or more of the following:
> > > -                                         "qcom,msm8994-ufshc"
> > > -                                         "qcom,msm8996-ufshc"
> > > -                                         "qcom,ufshc"
> > > +- compatible           : must contain "jedec,ufs-1.1" or "jedec,ufs-2.0"
> > > +
> > > +                         For Qualcomm SoCs must contain, as below, an
> > > +                         SoC-specific compatible along with "qcom,ufshc" and
> > > +                         the appropriate jedec string:
> > > +                           "qcom,msm8994-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> > > +                           "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> > > +                           "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> >
> > Thanks for the patch. It looks good to me.
> > Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Thanks for the review!
>
>
> > P.S.: While you are at it, can you please move 'ufs-qcom.txt'
> > to Documentation/devicetree/bindings/phy/qcom,ufs-phy.txt.
> > The current name and file location is misleading.
>
> I'd rather someone at Qualcomm do this.  Do you have a suggested
> person?  The reason I feel that Qualcomm needs to get involved is that
> I see that when I look at the file you refer to says it's for:
>
>   "qcom,ufs-phy-qmp-20nm" for 20nm ufs phy,
>   "qcom,ufs-phy-qmp-14nm" for legacy 14nm ufs phy,
>   "qcom,msm8996-ufs-phy-qmp-14nm" for 14nm ufs phy
>   present on MSM8996 chipset.
>
> ...but there's another Qualcomm file, 'qcom-qmp-phy.txt'.  That
> handles the compatible string:
>
>        "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
>
> So I'm a little confused.  Should the SDM845 UFS PHY been handled by
> the older UFS PHY driver?  ...or should all the older UFS PHYs be
> moved to be handled by the newer QMP PHY driver?  ...or are they
> really different hardware blocks, in which case how would you describe
> the difference (both are described as UFS QMP PHYs I think).

As you rightly said "ufs/ufs-qcom.txt" describes the bindings for
14nm, and 20nm ufs phy. These phys are however handled by the older
ufs phy driver present at:
drivers/phy/qualcomm/phy-qcom-ufs-qmp-{14nm,20nm}.c
The sdm845 UFS phy driver is handled by the new consolidated qmp phy
driver: drivers/phy/qualcomm/phy-qcom-qmp.c whose bindings are
described by 'qcom-qmp-phy.txt'.
We didn't attempt to move the 14nm phy to new driver as we already had
8996 using the bindings.

So, really these are two separate drivers with different bindings. I
believe it should be okay to move the file. If you are fine, I can
attempt to post a small patch to do that.
Thanks.

>
> BTW: I have a patch attempting to fixup the QMP PHY bindings at
> <https://lkml.kernel.org/r/20181012213632.252346-1-dianders@chromium.org>.

Sure, I will review this as well. Thanks for reminiding.

Best regards
Vivek


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
