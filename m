From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] dt-bindings: ufs: Fix the compatible string definition
Date: Tue, 16 Oct 2018 09:59:56 -0700
Message-ID: <CAD=FV=XWC8q4Cx4GF0yXCgj2APwd5ZfccVBC_ORwnJg0vRsS7A@mail.gmail.com>
References: <20181012213926.253765-1-dianders@chromium.org>
 <CAFp+6iFy8V34cs6pEOie_tBX5wJqM7teUnH_XLLZ7cioPrX_hA@mail.gmail.com>
 <CAD=FV=WYM5OOigy+81cVzPtAJXhvrhB1znr9zHzMf3q5iFOtFw@mail.gmail.com> <CAFp+6iGxvDoptnjM18ggnHqX6MV0+HFqsnCMi61b8gquBxaYmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFp+6iGxvDoptnjM18ggnHqX6MV0+HFqsnCMi61b8gquBxaYmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, cang@codeaurora.org, Evan Green <evgreen@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, sayalil@codeaurora.org, Asutosh Das <asutoshd@codeaurora.org>, devicetree@vger.kernel.org, liwei213@huawei.com, LKML <linux-kernel@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Oct 15, 2018 at 10:51 PM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
> > > P.S.: While you are at it, can you please move 'ufs-qcom.txt'
> > > to Documentation/devicetree/bindings/phy/qcom,ufs-phy.txt.
> > > The current name and file location is misleading.
> >
> > I'd rather someone at Qualcomm do this.  Do you have a suggested
> > person?  The reason I feel that Qualcomm needs to get involved is that
> > I see that when I look at the file you refer to says it's for:
> >
> >   "qcom,ufs-phy-qmp-20nm" for 20nm ufs phy,
> >   "qcom,ufs-phy-qmp-14nm" for legacy 14nm ufs phy,
> >   "qcom,msm8996-ufs-phy-qmp-14nm" for 14nm ufs phy
> >   present on MSM8996 chipset.
> >
> > ...but there's another Qualcomm file, 'qcom-qmp-phy.txt'.  That
> > handles the compatible string:
> >
> >        "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> >
> > So I'm a little confused.  Should the SDM845 UFS PHY been handled by
> > the older UFS PHY driver?  ...or should all the older UFS PHYs be
> > moved to be handled by the newer QMP PHY driver?  ...or are they
> > really different hardware blocks, in which case how would you describe
> > the difference (both are described as UFS QMP PHYs I think).
>
> As you rightly said "ufs/ufs-qcom.txt" describes the bindings for
> 14nm, and 20nm ufs phy. These phys are however handled by the older
> ufs phy driver present at:
> drivers/phy/qualcomm/phy-qcom-ufs-qmp-{14nm,20nm}.c
> The sdm845 UFS phy driver is handled by the new consolidated qmp phy
> driver: drivers/phy/qualcomm/phy-qcom-qmp.c whose bindings are
> described by 'qcom-qmp-phy.txt'.
> We didn't attempt to move the 14nm phy to new driver as we already had
> 8996 using the bindings.
>
> So, really these are two separate drivers with different bindings. I
> believe it should be okay to move the file. If you are fine, I can
> attempt to post a small patch to do that.

I guess what I should have said was that the new name you're proposing
"qcom,ufs-phy.txt" is confusing and opening the file doesn't help
clarify things.  The name and the binding make it sound like this is
_the_ file to look at for Qualcomm UFS PHYs.  ...and then you look in
the examples in the file and it seems that this even includes Qualcomm
QMP PHYs for UFS.

...so while I agree that the file "ufs-qcom.txt" needs to be moved to
the "PHY" directory, I think at the same time we need to change the
name of the file and maybe the contents to disambiguate which things
belong in this file vs. the "qcom-qmp-phy.txt".  ...and I feel like
someone at Qualcomm will have the most information to properly do
that.

For instance, you could call the older bindings
"qcom-qmp-phy-14nm-20nm.txt" or something like that.

One point of clarification I'd like to know is if there's really a
good reason to have two drivers here.  Certainly if the hardware is
really different then a new driver can make sense, but if there are
two drivers for arbitrary reasons then maybe they should be combined
into one eventually?


-Doug
