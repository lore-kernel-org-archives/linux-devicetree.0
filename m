Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C67C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 16:08:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEA6624650
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 16:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGdwPfRl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfLRQIn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 11:08:43 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55249 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfLRQIn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 11:08:43 -0500
Received: by mail-wm1-f65.google.com with SMTP id b19so2412673wmj.4
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o5X12+OnlTrR6hQB7btD1TwyQhH770WeXItNc7qt5zA=;
        b=vGdwPfRl1Ha9VhwGDZb29pGKHmrCLBjEh/aU/lWfjiA+Es/jr7ZphzP4HzPPmjTJx+
         JSehVhXPNzXdOHN1KvgmcYfeFj+EOqqLkQfTn7w+aSzsmY9sA/Phabc6P4xORTt9/1CX
         ZeJvajjFb7Aa2pPQS2rmj8CC2WfmH3g8R6Icy6BCtWh0myJTrzSd94GfQGUovkp6jd2B
         rT+HoiZRDI9Poe0mNpRZQO9dQfwLmHSchdxzCs4OzzEO+QNZJtdaxkDjf9S6U0pGGXCC
         uBxrbddT9q0O1xSpIKLYhBMvxSFqGMIVi9YEcXDMHetlYODSFxx8S1+dGvzAMam0zV9q
         MZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o5X12+OnlTrR6hQB7btD1TwyQhH770WeXItNc7qt5zA=;
        b=PQcxuY6dWIZmNNmOhKG1POB1ORI/Qa1Gu1+bT2njtei1v6+kSIpaZV2uJNiy2rXFeS
         aqrR3cqaniXASV4tjQCMhSYuK4gx26v6ONdR78sMubmCf63SbdY/WxqHxQ0WWRDxQ99n
         0pGt6Qrcw2G3jeAvwUHBLQeOCFhLtgPY7WCNgGF9wQKnRgub9EwkRiejV4dqq6fPWqMD
         E38bScD4YT7Zm/GC3C8OLjVaedl1iPr8Fz9A1n1IWYQ8PXbBNwq2ru2cgg7srFLMUzyz
         mX+tBTnd9C034VQBpwZWFyxSMr8dEup6okcA+KwggQFpwZvmkct5k1TXlL9OnMjqxreI
         Lamg==
X-Gm-Message-State: APjAAAUkEMXRUdBoAEFr2cg2KucwjhHAFzF/JenuZNa3UglQmBrO2WN5
        lFDO0CcaCkhVKiDrhk4FiWp9WQ==
X-Google-Smtp-Source: APXvYqzGNVeQ/R7JR9UNdXnpKZSm9sCG7ntxjETJuNIvtVXZ9l8S+gdw6OnN9egWqIdDF5D4ZyEZUA==
X-Received: by 2002:a05:600c:22c8:: with SMTP id 8mr3940980wmg.178.1576685320145;
        Wed, 18 Dec 2019 08:08:40 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
        by smtp.gmail.com with ESMTPSA id c5sm2949884wmb.9.2019.12.18.08.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 08:08:39 -0800 (PST)
Date:   Wed, 18 Dec 2019 17:08:34 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Auger Eric <eric.auger@redhat.com>
Cc:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, joro@8bytes.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        will@kernel.org, robin.murphy@arm.com, bhelgaas@google.com,
        jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
Subject: Re: [PATCH v3 08/13] iommu/arm-smmu-v3: Propate ssid_bits
Message-ID: <20191218160834.GG2371701@myrica>
References: <20191209180514.272727-1-jean-philippe@linaro.org>
 <20191209180514.272727-9-jean-philippe@linaro.org>
 <466bbc57-79d4-274c-67bc-4ed591da9968@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <466bbc57-79d4-274c-67bc-4ed591da9968@redhat.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 17, 2019 at 06:07:26PM +0100, Auger Eric wrote:
> Hi Jean,
> 
> On 12/9/19 7:05 PM, Jean-Philippe Brucker wrote:
> 
> s/Propate/Propagate in the commit title.
> > Now that we support substream IDs, initialize s1cdmax with the number of
> > SSID bits supported by a master and the SMMU.
> > 
> > Context descriptor tables are allocated once for the first master
> > attached to a domain. Therefore attaching multiple devices with
> > different SSID sizes is tricky, and we currently don't support it.
> > 
> > As a future improvement it would be nice to at least support attaching a
> > SSID-capable device to a domain that isn't using SSID, by reallocating
> > the SSID table.
> Isn't that use case relevant (I mean using both devices in a non SSID
> use case). For platform devices you can work this around with FW but for
> PCI devices?

Normally each device gets its own domain. Especially since PASID is a PCI
Express capability, I expect them to be properly isolated with ACS, each
with its own IOMMU group. So I don't think this is too relevant for the
moment, it would be a quirk for a broken system.

Thanks,
Jean
