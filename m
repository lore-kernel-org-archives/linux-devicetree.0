From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe
	sequence handler on MTP
Date: Sun, 11 Aug 2019 21:38:24 +0530
Message-ID: <CAFp+6iHGrXAJ2Y1ewxaePGYEcbnprjScUnGyR61qvOv03HVZhQ@mail.gmail.com>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
	<20190612071554.13573-5-vivek.gautam@codeaurora.org>
	<20190805222627.GA2634@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190805222627.GA2634@builder>
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

On Tue, Aug 6, 2019 at 3:56 AM Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
>
> > Indicate on MTP SDM845 that firmware implements handler to
> > TLB invalidate erratum SCM call where SAFE sequence is toggled
> > to achieve optimum performance on real-time clients, such as
> > display and camera.
> >
> > Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 78ec373a2b18..6a73d9744a71 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2368,6 +2368,7 @@
> >                       compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
> >                       reg = <0 0x15000000 0 0x80000>;
> >                       #iommu-cells = <2>;
> > +                     qcom,smmu-500-fw-impl-safe-errata;
>
> Looked back at this series and started to wonder if there there is a
> case where this should not be set? I mean we're after all adding this to
> the top 845 dtsi...

My bad.
This is not valid in case of cheza. Cheza firmware doesn't implement
the safe errata handling hook.
On cheza we just have the liberty of accessing the secure registers
through scm calls - this is what
we were doing in earlier patch series handling this errata.
So, a property like this should go to mtp board's dts file.

Thanks

Vivek

>
> How about making it the default in the driver and opt out of the errata
> once there is a need?
>
> Regards,
> Bjorn
>
> >                       #global-interrupts = <1>;
> >                       interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> >                                    <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> >
> _______________________________________________
> iommu mailing list
> iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
