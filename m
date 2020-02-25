Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D80C35E01
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 19:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 327772176D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582657248;
	bh=BOQo5OrQ/z/825x/NTU1kFI69At85Lorq5xHu0Rm9+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ANl6xHELXLrgPI6g3nwA93cpvNjMPXvZel7H8aVLJAEs7k+ECPxjYoDgeLlzRoEoN
	 +LMg7zWVZY3PJ+g6m1ykoK9g9Y40ntWN47oZah91iNEvmLfUSjok6wgIggnHunXFrW
	 8UJt1FECVU2smrMMXWC9csxA4gQ0elCY3UYQdOsg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbgBYTAr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 14:00:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34132 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728787AbgBYTAr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 14:00:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id j16so569464otl.1
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 11:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1P9Yso5Vb5UKxpvMNmGS2V+IOHCpyt5b9VLkhPIxN7E=;
        b=dwcxychExkjn+rvMtatPPoSnvPo0U/8vf7GpH7qEAIvKDgpBUR5pjSvcbNoB5uOpJ6
         0wkLc39wsM4L4OtJaHnM2V/OabuA5m0LSHrOGlogziLaSeipF/QmPDquABvyVvmzWOjZ
         7FLlYjKbnsMTdEwPu0wyYjtkKkRluAGPDHu+hxntkjgWvge7Zer9nrrxxpHA/ZoswMJn
         WzpJcTrGmzpds0A1W90uI44XhYzYF0gqbzLq51bfBAJ5NXhVtfp1awGunUiKhpPYXq3W
         NAGCR/wcidla60QGszO/XSdCrDT/8WZWusT4UhCAZVY47EshlL7dqNVDcsitrXHL+Tcf
         m0mQ==
X-Gm-Message-State: APjAAAUcmgeFciSWxgSyG6ZCSElLsM9C47DHD5aCxx1iW0jsmbOQ0ubE
        cSsh1Qr/Zfus6fKe8g5ylK9HB9U=
X-Google-Smtp-Source: APXvYqxiHG0UPocpZw9If5DlL9JboqJVuK68KZ4rncHtmoPexpmqSR8EMGl9Oop4I5g2kwHh0tIb7w==
X-Received: by 2002:a05:6830:1498:: with SMTP id s24mr33773otq.79.1582657246623;
        Tue, 25 Feb 2020 11:00:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w197sm5526241oia.12.2020.02.25.11.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 11:00:45 -0800 (PST)
Received: (nullmailer pid 1593 invoked by uid 1000);
        Tue, 25 Feb 2020 19:00:45 -0000
Date:   Tue, 25 Feb 2020 13:00:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: ARM: Add recent Cortex/Neoverse CPUs
Message-ID: <20200225190045.GA1553@bogus>
References: <cover.1582312530.git.robin.murphy@arm.com>
 <79ef74956befe089d7994ad24ab25132e95e9ac9.1582312530.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ef74956befe089d7994ad24ab25132e95e9ac9.1582312530.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 21 Feb 2020 19:35:28 +0000, Robin Murphy wrote:
> The CPU group has been busy since we last updated these bindings...
> Add definitions for all the new Cortex-A and Neoverse cores now
> available.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: no change, just resending for completeness
> 
>  Documentation/devicetree/bindings/arm/cpus.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Applied, thanks.

Rob
