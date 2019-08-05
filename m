From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of
 qcom_scm_call
Date: Mon, 5 Aug 2019 15:27:55 -0700
Message-ID: <20190805222755.GB2634@builder>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-2-vivek.gautam@codeaurora.org>
 <20190618175536.GI4270@fuggles.cambridge.arm.com>
 <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed 19 Jun 04:34 PDT 2019, Vivek Gautam wrote:

> On Tue, Jun 18, 2019 at 11:25 PM Will Deacon <will.deacon@arm.com> wrote:
> >
> > On Wed, Jun 12, 2019 at 12:45:51PM +0530, Vivek Gautam wrote:
> > > There are scnenarios where drivers are required to make a
> > > scm call in atomic context, such as in one of the qcom's
> > > arm-smmu-500 errata [1].
> > >
> > > [1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/
> > >       drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/
> > >       msm-4.9&id=da765c6c75266b38191b38ef086274943f353ea7")
> > >
> > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/firmware/qcom_scm-64.c | 136 ++++++++++++++++++++++++++++-------------
> > >  1 file changed, 92 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> > > index 91d5ad7cf58b..b6dca32c5ac4 100644
> > > --- a/drivers/firmware/qcom_scm-64.c
> > > +++ b/drivers/firmware/qcom_scm-64.c
> 
> [snip]
> 
> > > +
> > > +static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
> > > +                          struct arm_smccc_res *res, u32 fn_id,
> > > +                          u64 x5, bool atomic)
> > > +{
> >
> > Maybe pass in the call type (ARM_SMCCC_FAST_CALL vs ARM_SMCCC_STD_CALL)
> > instead of "bool atomic"? Would certainly make the callsites easier to
> > understand.
> 
> Sure, will do that.
> 
> >
> > > +     int retry_count = 0;
> > > +
> > > +     if (!atomic) {
> > > +             do {
> > > +                     mutex_lock(&qcom_scm_lock);
> > > +
> > > +                     __qcom_scm_call_do(desc, res, fn_id, x5,
> > > +                                        ARM_SMCCC_STD_CALL);
> > > +
> > > +                     mutex_unlock(&qcom_scm_lock);
> > > +
> > > +                     if (res->a0 == QCOM_SCM_V2_EBUSY) {
> > > +                             if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
> > > +                                     break;
> > > +                             msleep(QCOM_SCM_EBUSY_WAIT_MS);
> > > +                     }
> > > +             }  while (res->a0 == QCOM_SCM_V2_EBUSY);
> > > +     } else {
> > > +             __qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
> > > +     }
> >
> > Is it safe to make concurrent FAST calls?
> 
> I better add a spinlock here.
> 

Hi Vivek,

Would you be able to respin this patch, so that we could unblock the
introduction of the display nodes in the various device?

Regards,
Bjorn
