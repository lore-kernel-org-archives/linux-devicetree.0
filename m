Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0B2C11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 20:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8214246A1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582836943;
	bh=uo4pZ8pLnVJHt+X+KMHCkfw/S+qxfnVMzkyq2/sf/Q8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-ID:From;
	b=YmJHz1xa/ubThvrNmKkI3y2ldrNYN2Dt1XZoCbF8p8TYMJQlFFSl9v/a/87AYYymf
	 KfIt3UUFkMarm8NNh6zwbgj4ILNdOAYY2Q3aY99xT+kyzF/4c/vLEe4Ei+gq61cgR7
	 y7rConDlDZhR4iIITOSR29a3ilFAoFvwFHHNhmUA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbgB0Uzn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 15:55:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:41392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728059AbgB0Uzn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Feb 2020 15:55:43 -0500
Received: from localhost (mobile-166-175-186-165.mycingular.net [166.175.186.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A6272468E;
        Thu, 27 Feb 2020 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582836942;
        bh=uo4pZ8pLnVJHt+X+KMHCkfw/S+qxfnVMzkyq2/sf/Q8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=1eIeXpS8HUAIuUBh9/tzJuBcJ+ccfhZwy41bHiqBUgYJacHs6Foi3Fg+K1o0I5KxN
         l5ZbqG+I0Te3bfwhBiAh3/eAUDZf/RsiG2jjBDNWyh3sOrAlZIAHTZEx57qWphCB27
         kuhWQ9DqHskFidgv7Jb6SxLtKoRz7JESO1q4DHg8=
Date:   Thu, 27 Feb 2020 14:55:40 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-mm@kvack.org, joro@8bytes.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        robin.murphy@arm.com, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
        jacob.jun.pan@linux.intel.com, christian.koenig@amd.com,
        yi.l.liu@intel.com, zhangfei.gao@linaro.org
Subject: Re: [PATCH v4 25/26] PCI/ATS: Export symbols of PRI functions
Message-ID: <20200227205540.GA131096@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224182401.353359-26-jean-philippe@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Subject could be simply "PCI/ATS: Export PRI functions"

On Mon, Feb 24, 2020 at 07:24:00PM +0100, Jean-Philippe Brucker wrote:
> The SMMUv3 driver uses pci_{enable,disable}_pri() and related
> functions. Export those functions to allow the driver to be built as a
> module.
> 
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/ats.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index bbfd0d42b8b9..fc8fc6fc8bd5 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -197,6 +197,7 @@ void pci_pri_init(struct pci_dev *pdev)
>  	if (status & PCI_PRI_STATUS_PASID)
>  		pdev->pasid_required = 1;
>  }
> +EXPORT_SYMBOL_GPL(pci_pri_init);
>  
>  /**
>   * pci_enable_pri - Enable PRI capability
> @@ -243,6 +244,7 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(pci_enable_pri);
>  
>  /**
>   * pci_disable_pri - Disable PRI capability
> @@ -322,6 +324,7 @@ int pci_reset_pri(struct pci_dev *pdev)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(pci_reset_pri);
>  
>  /**
>   * pci_prg_resp_pasid_required - Return PRG Response PASID Required bit
> @@ -337,6 +340,7 @@ int pci_prg_resp_pasid_required(struct pci_dev *pdev)
>  
>  	return pdev->pasid_required;
>  }
> +EXPORT_SYMBOL_GPL(pci_prg_resp_pasid_required);
>  #endif /* CONFIG_PCI_PRI */
>  
>  #ifdef CONFIG_PCI_PASID
> -- 
> 2.25.0
> 
