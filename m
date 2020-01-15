Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8553EC33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 07:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58877214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 07:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i8ACrPmC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgAOH5y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 02:57:54 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40148 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgAOH5x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 02:57:53 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so16661909wmi.5
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 23:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Ia3VncVrF7c3ZybtE0PPF5JK9Ck+5/tRhdE7y0iz1s=;
        b=i8ACrPmCSBs+LYW5GnsySs7+9Wv84u6t9RSSW45kj5ZeFcp32dD8ehSZC7Xt1/5Bqg
         h1DjGveoSyal45wtXHcZT12ieGr2xy/e8wo3G3CDUp4cnmrVk2dBMBHelGHp79Fony6U
         PzxYeHpAPCO7OJlHOgT9kJnoaQxA/TYufvx/R4aFz+DWsO6XAAmRO/6BrT+Ih8WgpQdu
         c6ekNSgZ6GiY2J08rJXJvTGQ1oEZ9kxZNs4IRe/nMDFb9UnQ9GcYUYMB+eaE+qqao7xg
         33CsbG7zAeSpBNRqs3YmXjFWPmjtHKVWEZJY7FefO2sA/OEizZXaufWIgyH59yrGNt8Q
         Yk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Ia3VncVrF7c3ZybtE0PPF5JK9Ck+5/tRhdE7y0iz1s=;
        b=tNjRMMPzft0tY9hhqIWx+i30Y2/YR4TUz5nrtT/pimP3dDlhZFrSPr/2gm6BJHjzOX
         IPiDUa34rOgAkVWTsr0BOlAXVoJKFE5P/YzBBKyYK3Joz47cd734LEp6x7T0FYd8tayo
         x5hq+ZkFHw8Wfm/ZOX1CDORoK2rG+/NE/T5BXmjyl1oGOriZaJma1J59+YRD5f+awaZk
         8qpd/thahL0bPBNhZ17Ohu25pZdxw6/OOaIzKgDa00oDz5XJiqZFIXDGX1QpAJ/tGBgA
         k+NIMzInQErAtXv2YSKOv+sHJ+qwsOLUAzlqmfBag4JYWWHyinP8uG3DccQSHIrGSplT
         //Ow==
X-Gm-Message-State: APjAAAXNxhDGPMsqZwj6Vs7tX3Awhq894qTHcFnlmSqa7Nin8wNlhO4D
        uBjSwF4pwAMlr04u5btnJy4YKg==
X-Google-Smtp-Source: APXvYqyNEYvahUX2hjnKrrpMAXYUfqqL20FGP88ce7WRH3XP7tUR3FPmbPiIfTuZpy5b/JjF1w/zZg==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr30916595wmj.37.1579075071790;
        Tue, 14 Jan 2020 23:57:51 -0800 (PST)
Received: from myrica ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id h2sm23782648wrv.66.2020.01.14.23.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 23:57:51 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:57:46 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, joro@8bytes.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        robin.murphy@arm.com, bhelgaas@google.com, eric.auger@redhat.com,
        jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
Subject: Re: [PATCH v4 13/13] iommu/arm-smmu-v3: Add support for PCI PASID
Message-ID: <20200115075746.GA32782@myrica>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
 <20191219163033.2608177-14-jean-philippe@linaro.org>
 <20200114124541.GE29222@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114124541.GE29222@willie-the-truck>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 14, 2020 at 12:45:42PM +0000, Will Deacon wrote:
> On Thu, Dec 19, 2019 at 05:30:33PM +0100, Jean-Philippe Brucker wrote:
> > Enable PASID for PCI devices that support it. Since the SSID tables are
> > allocated by arm_smmu_attach_dev(), PASID has to be enabled early enough.
> > arm_smmu_dev_feature_enable() would be too late, since by that time the
> 
> What is arm_smmu_dev_feature_enable()?

It's the implementation of the IOMMU op .dev_enable_feat(), which I'll add
later (called by a device driver to enable the SVA feature). I'll reword
this comment, since the only real requirement is enabling PASID before
ATS.

> >  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
> >  {
> >  	unsigned long flags;
> > @@ -2852,13 +2899,16 @@ static int arm_smmu_add_device(struct device *dev)
> >  
> >  	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
> >  
> > +	/* Note that PASID must be enabled before, and disabled after ATS */
> > +	arm_smmu_enable_pasid(master);
> 
> Is that part of the PCIe specs? If so, please can you add a citation to the
> comment?

Yes (PCIe 4.0r1.0 10.5.1.3 ATS Control register).

> Are there any other ordering requirements, i.e. with respect to enabling
> substreams at the SMMU? For example, can a speculative ATS request provide
> a PASID?

You recent fix bfff88ec1afe ("iommu/arm-smmu-v3: Rework enabling/disabling
of ATS for PCI masters") should prevent from speculative ATS requests.
More generally both ATS and SSID are enabled and disabled at the same time
in the SMMU, when toggling STE.V, so any request arriving before STE
enablement will be aborted regardless of SSID.

Thanks,
Jean

