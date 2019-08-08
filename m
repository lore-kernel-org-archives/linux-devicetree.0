From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of
	qcom_scm_call
Date: Thu, 8 Aug 2019 17:05:21 +0530
Message-ID: <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
	<20190612071554.13573-2-vivek.gautam@codeaurora.org>
	<20190618175536.GI4270@fuggles.cambridge.arm.com>
	<CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
	<20190805222755.GB2634@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190805222755.GB2634@builder>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 3:58 AM Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Wed 19 Jun 04:34 PDT 2019, Vivek Gautam wrote:
>
> > On Tue, Jun 18, 2019 at 11:25 PM Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> > >
> > > On Wed, Jun 12, 2019 at 12:45:51PM +0530, Vivek Gautam wrote:
> > > > There are scnenarios where drivers are required to make a
> > > > scm call in atomic context, such as in one of the qcom's
> > > > arm-smmu-500 errata [1].
> > > >
> > > > [1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/
> > > >       drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/
> > > >       msm-4.9&id=da765c6c75266b38191b38ef086274943f353ea7")
> > > >
> > > > Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > > Reviewed-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > ---
> > > >  drivers/firmware/qcom_scm-64.c | 136 ++++++++++++++++++++++++++++-------------
> > > >  1 file changed, 92 insertions(+), 44 deletions(-)
> > > >
> > > > diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> > > > index 91d5ad7cf58b..b6dca32c5ac4 100644
> > > > --- a/drivers/firmware/qcom_scm-64.c
> > > > +++ b/drivers/firmware/qcom_scm-64.c
> >
> > [snip]
> >
> > > > +
> > > > +static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
> > > > +                          struct arm_smccc_res *res, u32 fn_id,
> > > > +                          u64 x5, bool atomic)
> > > > +{
> > >
> > > Maybe pass in the call type (ARM_SMCCC_FAST_CALL vs ARM_SMCCC_STD_CALL)
> > > instead of "bool atomic"? Would certainly make the callsites easier to
> > > understand.
> >
> > Sure, will do that.
> >
> > >
> > > > +     int retry_count = 0;
> > > > +
> > > > +     if (!atomic) {
> > > > +             do {
> > > > +                     mutex_lock(&qcom_scm_lock);
> > > > +
> > > > +                     __qcom_scm_call_do(desc, res, fn_id, x5,
> > > > +                                        ARM_SMCCC_STD_CALL);
> > > > +
> > > > +                     mutex_unlock(&qcom_scm_lock);
> > > > +
> > > > +                     if (res->a0 == QCOM_SCM_V2_EBUSY) {
> > > > +                             if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
> > > > +                                     break;
> > > > +                             msleep(QCOM_SCM_EBUSY_WAIT_MS);
> > > > +                     }
> > > > +             }  while (res->a0 == QCOM_SCM_V2_EBUSY);
> > > > +     } else {
> > > > +             __qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
> > > > +     }
> > >
> > > Is it safe to make concurrent FAST calls?
> >
> > I better add a spinlock here.
> >
>
> Hi Vivek,
>
> Would you be able to respin this patch, so that we could unblock the
> introduction of the display nodes in the various device?

Will pointed [1] to the restructuring of arm-smmu to support
implementation specific details.
That hasn't been posted yet, and I haven't yet been able to work on that either.
I will be happy to respin this series with the comments addressed if
Will is okay to pull changes to unblock sdm845 devices. :)

[1] https://lore.kernel.org/patchwork/patch/1087457/

Thanks & Regards
Vivek

>
> Regards,
> Bjorn
> _______________________________________________
> iommu mailing list
> iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
