Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8DDC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7411420707
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590534640;
	bh=d3b7eyhLvbsK5uD3Bx8I71G44WWkTLpC/tlzoyUcFuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KwTN/t7VaFW4PdP2TWE2aiGmrF9E0TVO1Luh/xuQwZi0f+wVUbLhV/bf0t1+vzLyM
	 Orj7+T4dvuD/EkMQTRWPSZx2EzTre1nnqDee7MwPRp3ZYRbFziLcATWR+7VejrADB6
	 HPThbaXWokqMuveeiu4liWgWygoJ2onA1ALWrU9k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392326AbgEZXKk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 19:10:40 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33388 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389393AbgEZXKj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 19:10:39 -0400
Received: by mail-il1-f193.google.com with SMTP id y17so20016937ilg.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 16:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HUD3rjABkK3M27L+kA+MnFzFlbgVQzxxYdxT/UpzDIs=;
        b=paa5VkZl2Mcqm6K8MJHjZRMbt+qHAv6QNfM6U5BpqIqo1dLjIT/CIabcEE0SwBqPeL
         rEQr08Fpdo3LU5emFClKeM9SFNHRX230TbzUhNZ1WoOG+KPTDbCwJofhhVf8YpGYP8cl
         gH5AimpMPvPLURc/PwviQkfZ0Hp61VQxcNJeRMCZ19HWLJ93hSiJHzQpFU8BwRLyYv5o
         8YlBbt6EEFGCsKn90rcqBB3J9DANzrk5eMFQGlNVcvzrxeb3tjoqnWi/dMPeG73XsBc3
         5qSQkoDguNE5uvaJmjoC5X6CMQgKE+JJaOjkuR6HxmqsV3CDoc+vOxnaQneVWFmSosHe
         mHWg==
X-Gm-Message-State: AOAM5330XtJ46iBnF1D4JXo066VWt7fHedjqYLLOtmaLnSxZq6SBOod+
        //XZ1ysVW/yWNX3WOfN+xA==
X-Google-Smtp-Source: ABdhPJzl6/femhNIHHcB6mqYv4S6Wy0fd7JX2rGbnyjPMraH4XkZEhvB4z3x9VNEOcYtda/eoLMnIA==
X-Received: by 2002:a92:5b99:: with SMTP id c25mr1401204ilg.42.1590534638721;
        Tue, 26 May 2020 16:10:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j90sm698788ilg.70.2020.05.26.16.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 16:10:38 -0700 (PDT)
Received: (nullmailer pid 569321 invoked by uid 1000);
        Tue, 26 May 2020 23:10:37 -0000
Date:   Tue, 26 May 2020 17:10:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-mtd@lists.infradead.org,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        devicetree@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RESEND v5 14/21] dt-bindings: mtd: Add the nand-ecc-placement
 property
Message-ID: <20200526231037.GA568048@bogus>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-15-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526195633.11543-15-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 26 May 2020 21:56:26 +0200, Miquel Raynal wrote:
> Placement is where the ECC bytes are expected.
> No value means the controller can do whatever it desires (default is
> to put ECC bytes at the end of the OOB area). Alternative placement is
> "interleaved" (also sometimes referred as "syndrome") where data and
> OOB are mixed.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mtd/nand-controller.yaml:  while scanning a plain scalar
  in "<unicode string>", line 64, column 11
found a tab character that violates indentation
  in "<unicode string>", line 65, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/mtd/nand-controller.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/mtd/nand-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1298408

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

