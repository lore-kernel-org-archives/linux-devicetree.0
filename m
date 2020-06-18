Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B2DC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:38:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4989B206E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592447913;
	bh=Ug0a3DCl82otFSCO5CSKZQAZvIa4YNz0UGpFjGZQZFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2lig6BnawaTM5EiwOb71VwWe6t6fuMS5iPi7zrBnbdh+yPO+uFGeahFn1mjWF1Dpz
	 ac26kzSYNyXYXnaCHk8tT/LrhfJygCCZ5G5g5mq1c8T7sncq4V/GnQBBRID/b9cli/
	 ccYGiVm99yOwpuRC6myvAds8uaaBed75mG2dApPA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733083AbgFRCib (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:38:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39586 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387785AbgFRCi3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 22:38:29 -0400
Received: by mail-io1-f67.google.com with SMTP id c8so5346997iob.6;
        Wed, 17 Jun 2020 19:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wocT9hb5rjpFV+FaWvJBTHDmZ+hLPyEALvZ8AqS2xlM=;
        b=ANuRvBTXF6PF8Qs7FjxssyGY1BHWb/djOjfUUmEoup0+noUlpkJ2WGbvJPD5+WX5N5
         sEd/ynb8drd/vMbQDmiO6s99lJJ16l8IBNI77c5gDj3BRanzNKex3JtynEzSkO6AqupM
         IlppiyYr+ArkHOiNsIG+0YTNiC0k/4xKbtbIBWrG8rZbuFVs/NfiNRygcb2nDvblPM28
         FRc6a6U9eUFEldGqGLcD47Xx2H9/+n9MSD1+A0nZoBzeMRDPWieGlAmPFMys4lfM+1I6
         DlDJCwcG+xQhm7eNWrzxXHlBzq52MumL85hF7mOX0sEaMkD2n+t+LVt56Xj92KVS8wZd
         hsPw==
X-Gm-Message-State: AOAM532K7AcbM0OByrmKer23IdYDV0nINEULt1SJ93ck9As1TrATLXu7
        sUdIpV3O00dLg9REUhLHOA==
X-Google-Smtp-Source: ABdhPJwKXElRw26wcSntPOMhBn3XUNq94TQyw/vRXg7VSPBcUcHDu3ByMYkYaNdfhVLNqowkIfIbtA==
X-Received: by 2002:a05:6602:164f:: with SMTP id y15mr2707850iow.210.1592447907661;
        Wed, 17 Jun 2020 19:38:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q5sm806664ile.37.2020.06.17.19.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:38:27 -0700 (PDT)
Received: (nullmailer pid 3363238 invoked by uid 1000);
        Thu, 18 Jun 2020 02:38:26 -0000
Date:   Wed, 17 Jun 2020 20:38:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 28/38] dt-bindings: phy: tegra-xusb: Convert to
 json-schema
Message-ID: <20200618023826.GB3343853@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-29-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-29-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB pad controller bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../phy/nvidia,tegra124-xusb-padctl.txt       |  778 -----
>  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 2800 +++++++++++++++++
>  2 files changed, 2800 insertions(+), 778 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml

This one I definitely think should be split up into multiple schema 
files. There's very little shared.

Rob
