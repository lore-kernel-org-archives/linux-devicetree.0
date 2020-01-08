Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0081AC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 15:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5AA820673
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578497747;
	bh=a7G8uEc1Z1/LNKw4kHsRxEsIHiRKZ1Q+vDycgAiMD1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=R6fmKi1+oeCQ3DwwMRvxs7knSawdQ9E6+GdyUF+ibGbrR7DC2KQq2SLB3c6WjiTwN
	 aIOZkqCvTbn5r6LHcni3i7eTDEzYA3dP7UYWW4uJpJ5MyLM98Cohfxeu8LS1BtdVy3
	 +Sr68MCSTWJN1VY+WaNx0WIvfxp9zqIv1YyJ5exw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbgAHPfr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 10:35:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:47000 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgAHPfr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 10:35:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id r9so3917555otp.13
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 07:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ueE/KSkeZUf0uuD6X6xsibeFYXRrmenwa9AZKB89yAg=;
        b=lOgCeM/Rwc3hKTe/Jm+jZ4lobA2N03qQJhRVk3LBf3ke/3MIPMHT9CqzPGwO0hLzaC
         CEI3HDnjcGWWNnLVu/Et0Wa3Qo3cFaLTSLz79WXLsG+BWGjUZa9GQdzFoWC3qpU2s44N
         dgTbghdyuag6mkB3C/MoR1XsY0pM7X8inDjoz81AjA9Cl0cBeUMrK1H2Qs1isHWzqdTU
         1c8THkRLIMNcwqh6kWpi3qquB4DbHCusg9TR5oiU0X7G3tzqgvY56tPtyiAknzv2C9X5
         pFgCtCTkLQTyg4MTR7mMHUTnJobILztnweZ36LGKn0/9QGoIVaiiyqXM//eGdDdPOUWt
         KjHg==
X-Gm-Message-State: APjAAAVxW6IvZzKJ6haWZxbv3Q0I5cavwAQzP2SFXYWOAoRTqKzD0BpP
        bKhP6DlRgWE5grYMvXCi6qRVGcY=
X-Google-Smtp-Source: APXvYqyp1QMNSGStnb8spMH0zTftpxW3m4Aecq2CkzeYpXJx7Y6ZEZtIjlYjMsGVqrcy+SCxab56Qw==
X-Received: by 2002:a9d:7618:: with SMTP id k24mr4616838otl.65.1578497746209;
        Wed, 08 Jan 2020 07:35:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c10sm1174658otl.77.2020.01.08.07.35.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:35:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 09:35:44 -0600
Date:   Wed, 8 Jan 2020 09:35:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: memory-controller: Convert Tegra124 EMC
 to json-schema
Message-ID: <20200108153544.GA18410@bogus>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
 <20191222113921.1469372-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191222113921.1469372-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 22 Dec 2019 12:39:16 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the device tree bindings for the Tegra124 EMC controller to the
> DT schema format using json-schema. While at it, clean up the binding a
> little bit by removing any mention of how RAM code and clock frequency
> are represented in unit-addresses (which they aren't) and by adding the
> EMC clock without which the EMC controller can't change the frequency at
> which the external memory is clocked. While this is technically an ABI
> break (the clock was not required before), this should be fine because
> there isn't much that the EMC driver can do without access to the EMC
> clock.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra124-emc.txt                   | 374 -------------
>  .../nvidia,tegra124-emc.yaml                  | 528 ++++++++++++++++++
>  2 files changed, 528 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
