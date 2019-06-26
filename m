From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
Date: Wed, 26 Jun 2019 15:48:45 +0100
Message-ID: <20190626144844.key3n6ueb6skgkp4@willie-the-truck>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org>
 <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
 <20190618175218.GH4270@fuggles.cambridge.arm.com>
 <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
 <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
 <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
 <20190625133924.fqq3y7p3i3fqem5p@willie-the-truck>
 <CAFp+6iH-KzX7x1j8AAuKJcOP6v=fyP-yLvaeeE_Ly3oueu_ngg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iH-KzX7x1j8AAuKJcOP6v=fyP-yLvaeeE_Ly3oueu_ngg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, robh+dt <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 12:03:02PM +0530, Vivek Gautam wrote:
> On Tue, Jun 25, 2019 at 7:09 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Jun 25, 2019 at 12:34:56PM +0530, Vivek Gautam wrote:
> > > On Mon, Jun 24, 2019 at 10:33 PM Will Deacon <will@kernel.org> wrote:
> > > > Instead, I think this needs to be part of a separate file that is maintained
> > > > by you, which follows on from the work that Krishna is doing for nvidia
> > > > built on top of Robin's prototype patches:
> > > >
> > > > http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl
> > >
> > > Looking at this branch quickly, it seem there can be separate implementation
> > > level configuration file that can be added.
> > > But will this also handle separate page table ops when required in future.
> >
> > Nothing's set in stone, but having the implementation-specific code
> > constrain the page-table format (especially wrt quirks) sounds reasonable to
> > me. I'm currently waiting for Krishna to respin the nvidia changes [1] on
> > top of this so that we can see how well the abstractions are holding up.
> 
> Sure. Would you want me to try Robin's branch and take out the qualcomm
> related stuff to its own implementation? Or, would you like me to respin this
> series so that you can take it in to enable SDM845 boards such as, MTP
> and dragonboard to have a sane build - debian, etc. so people benefit
> out of it.

I can't take this series without Acks on the firmware calling changes, and I
plan to send my 5.3 patches to Joerg at the end of the week so they get some
time in -next. In which case, I think it may be worth you having a play with
the branch above so we can get a better idea of any additional smmu_impl hooks
you may need.

> Qualcomm stuff is lying in qcom-smmu and arm-smmu and may take some
> time to stub out the implementation related details.

Not sure I follow you here. Are you talking about qcom_iommu.c?

Will
