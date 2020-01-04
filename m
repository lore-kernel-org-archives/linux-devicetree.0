Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0C3C32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 22:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5571222C4
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578175488;
	bh=xLWIRtjmxp/tP7BvARL0Dsa7HkYHZbJ/bl4xZCyKvU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=F4I7w3f41falUpludQZk42ihTrorOV4AnL4/4vn4UTsFhf0312XOgfKdssu9fcEpo
	 lB4fdNn6TefiK4662Slnfwo/uBYx7tmIF3sCOGB6T+G4qi7Mfcczva9zBSd0VVhlAb
	 htYuBl8/1Q0nlIzMTvo9Og7yxz4PBBcfIqwqcvTc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgADWEs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 17:04:48 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34457 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgADWEs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 17:04:48 -0500
Received: by mail-io1-f67.google.com with SMTP id z193so44785778iof.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 14:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P9KYy5rXT1YHxu2ntjIRtLSaQMqlhK4uAwxwZ9CTSeA=;
        b=gVh2vyZk5O9Y9/o0elHAMACpCzN9KYcTwGCrG1qax8/V2KhOegVkv1A7i4mn3HG89f
         jbW2cmxT9UyPKBSwJjddl1F9ntY7DguQM+zdgVvz9sZ2vinDf6fpbtLCDSXuo1xaFM4l
         ONb00Z4uIhkjjjtAIeAlpip23cn/uA1PGkV6z/6Ie6wwwB7MWJxTLtEQywXGxBOjt8aY
         k5/FrvbqWkhLyc3p+3HV5lqb8lkE1yD0l/s+N9a994quZZEwo+dgEzH5Z92Y2aGc0jHE
         WKuCNa79qYv9czRsPVdN9XzxDZgZZw+9iV1c+Xj6hjY/Ry2Ps23mb3UR8ltVD5XQwZv7
         ZIXA==
X-Gm-Message-State: APjAAAUlK7Eo+XtrlPgz1Uau8nwOaGhkzBvBC8BT1SNJdscykgvCDL2a
        2Wj4jwoCWhg436oW3AbuGK7aQ7U=
X-Google-Smtp-Source: APXvYqwnakSHtZ1YgHYHoDLyLfVEBTsOxnt50+H8Jp4LvLtYg9CS6/pUn8veKKZmOKFKPyyvglm4NQ==
X-Received: by 2002:a5d:814f:: with SMTP id f15mr63022599ioo.275.1578175487022;
        Sat, 04 Jan 2020 14:04:47 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c8sm22500615ilh.58.2020.01.04.14.04.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 14:04:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 15:04:42 -0700
Date:   Sat, 4 Jan 2020 15:04:42 -0700
From:   Rob Herring <robh@kernel.org>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        andrew.murray@arm.com, kishon@ti.com,
        gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com,
        sagar.tv@gmail.com
Subject: Re: [PATCH V2 2/5] dt-bindings: PCI: tegra: Add DT support for PCIe
 EP nodes in Tegra194
Message-ID: <20200104220442.GA11478@bogus>
References: <20200103124404.20662-1-vidyas@nvidia.com>
 <20200103124404.20662-3-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103124404.20662-3-vidyas@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 3 Jan 2020 18:14:01 +0530, Vidya Sagar wrote:
> Add support for PCIe controllers that can operate in endpoint mode
> in Tegra194.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V2:
> * Addressed Thierry's review comments
> * Merged EP specific information from tegra194-pcie-ep.txt to tegra194-pcie.txt itself
> * Started using the standard 'reset-gpios' for PERST GPIO
> * Added 'nvidia,refclk-select-gpios' to enable REFCLK signals
> 
>  .../bindings/pci/nvidia,tegra194-pcie.txt     | 125 ++++++++++++++----
>  1 file changed, 99 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
