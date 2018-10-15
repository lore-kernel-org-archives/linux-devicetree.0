From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: ufs: Fix the compatible string definition
Date: Mon, 15 Oct 2018 20:53:12 +0530
Message-ID: <CAFp+6iFy8V34cs6pEOie_tBX5wJqM7teUnH_XLLZ7cioPrX_hA@mail.gmail.com>
References: <20181012213926.253765-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012213926.253765-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: robh+dt <robh+dt@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Can Guo <cang@codeaurora.org>, evgreen@chromium.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, sayalil@codeaurora.org, asutoshd@codeaurora.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, liwei213@huawei.com, open list <linux-kernel@vger.kernel.org>, malat@debian.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Doug,

On Sat, Oct 13, 2018 at 3:09 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> If you look at the bindings for the UFS Host Controller it says:
>
> - compatible: must contain "jedec,ufs-1.1" or "jedec,ufs-2.0", may
>               also list one or more of the following:
>                  "qcom,msm8994-ufshc"
>                  "qcom,msm8996-ufshc"
>                  "qcom,ufshc"
>
> My reading of that is that it's fine to just have either of these:
> 1. "qcom,msm8996-ufshc", "jedec,ufs-2.0"
> 2. "qcom,ufshc", "jedec,ufs-2.0"
>
> As far as I can tell neither of the above is actually a good idea.
>
> For #1 it turns out that the driver currently only keys off the
> compatible string "qcom,ufshc" so it won't actually probe.
>
> For #2 the driver won't probe but it's not a good idea to keep the SoC
> name out of the compatible string.
>
> Let's update the compatible string to make it really explicit.  We'll
> include a nod to the existing driver and the old binding and say that
> we should always include the "qcom,ufshc" string in addition to the
> SoC compatible string.
>
> While we're at it we'll also include another example SoC known to have
> UFS: sdm845.
>
> Fixes: 47555a5c8a11 ("scsi: ufs: make the UFS variant a platform device")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt       | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index 2df00524bd21..69a06a1b732e 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -4,11 +4,14 @@ UFSHC nodes are defined to describe on-chip UFS host controllers.
>  Each UFS controller instance should have its own node.
>
>  Required properties:
> -- compatible           : must contain "jedec,ufs-1.1" or "jedec,ufs-2.0", may
> -                         also list one or more of the following:
> -                                         "qcom,msm8994-ufshc"
> -                                         "qcom,msm8996-ufshc"
> -                                         "qcom,ufshc"
> +- compatible           : must contain "jedec,ufs-1.1" or "jedec,ufs-2.0"
> +
> +                         For Qualcomm SoCs must contain, as below, an
> +                         SoC-specific compatible along with "qcom,ufshc" and
> +                         the appropriate jedec string:
> +                           "qcom,msm8994-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +                           "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +                           "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"

Thanks for the patch. It looks good to me.
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

P.S.: While you are at it, can you please move 'ufs-qcom.txt'
to Documentation/devicetree/bindings/phy/qcom,ufs-phy.txt.
The current name and file location is misleading.

Thanks & Regards
Vivek

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
