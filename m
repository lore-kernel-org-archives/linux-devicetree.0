From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of
 qcom_scm_call
Date: Thu, 8 Aug 2019 17:30:14 +0100
Message-ID: <20190808163013.u5qbke54kj555oxn@willie-the-truck>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-2-vivek.gautam@codeaurora.org>
 <20190618175536.GI4270@fuggles.cambridge.arm.com>
 <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
 <20190805222755.GB2634@builder>
 <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, robh+dt <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 08, 2019 at 05:05:21PM +0530, Vivek Gautam wrote:
> On Tue, Aug 6, 2019 at 3:58 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > Would you be able to respin this patch, so that we could unblock the
> > introduction of the display nodes in the various device?
> 
> Will pointed [1] to the restructuring of arm-smmu to support
> implementation specific details.
> That hasn't been posted yet, and I haven't yet been able to work on that either.
> I will be happy to respin this series with the comments addressed if
> Will is okay to pull changes to unblock sdm845 devices. :)
> 
> [1] https://lore.kernel.org/patchwork/patch/1087457/

Just checked with Robin, and he's planning to post something tomorrow.

Will
