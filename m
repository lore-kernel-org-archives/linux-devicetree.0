Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DFDC83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 16:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DEBD20B1F
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588091959;
	bh=75mbh1d4d1Ehj+IViOLSh8uESNd1bdR5GrUnGsIVQB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vuWt2l3IdYOwsikL334BrAcVrGFX2NzPjRr//Bi6ON1fGyq2sCj+idgv1k6fmoTlT
	 +p1/RH50DRUIfujVeMKGL/en9SVNvikiHOERM3EEhyCxjhOgs2coen8KokB68YwtFJ
	 WTYZaIG3hNbuBvMMzZmqD4/TsLScn9hAK6qAlzc8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgD1QjS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 12:39:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46930 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbgD1QjS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 12:39:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id z25so33667795otq.13;
        Tue, 28 Apr 2020 09:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Psn5StSW3/AwNuoWctl3xGfoh47xJjTm97rYfc0wLfA=;
        b=HnILptA9WxHQGkPEAIuvAuAj/zqv7SJ3KRYSEzXjGfH9gFQdeweTJX3nVhvbbAQC5A
         x7HRdxiT7q1kvvbWS96hD0838rgulLfIxLVltEu+nJWMUXRv9vju6MW2STuwYGyJHl3d
         P0MlAqCgFWmqr1UmQvL6lTD1HJ14GgDTf28zZwVWU5Sc1E4Wa0iUzz1BN4lZot0nxjpg
         E202aaDaxYtwoiQhTLf0FSfswivAw1KE3D6NJO9CunvPH7yZdNS+2eZh43kYfnG1QM/7
         LqPqo+bXnkp22gA54TePDQH6JwO1yyE2VM8/54mKG9dL7413IBMYMQYYF0+7c+PP3dlr
         8cVw==
X-Gm-Message-State: AGi0Pub1ujll6MIepqvWT26aH+eXusjZaCTQUhkBLndggJnEO5nEnpVo
        LpepyxEHzcYTAC9gYXeg+w==
X-Google-Smtp-Source: APiQypK3Qr2qwAfk5iwllkYqM8CjkZH0gMjqmnJsCUIVs/xb9JKhkKaZWMl/MZS8ovkjBe6a9/gmfA==
X-Received: by 2002:a05:6830:19f7:: with SMTP id t23mr24217664ott.110.1588091957633;
        Tue, 28 Apr 2020 09:39:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b19sm4958640oii.1.2020.04.28.09.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 09:39:17 -0700 (PDT)
Received: (nullmailer pid 26637 invoked by uid 1000);
        Tue, 28 Apr 2020 16:39:16 -0000
Date:   Tue, 28 Apr 2020 11:39:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH V1 1/4] dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB
 controller support
Message-ID: <20200428163916.GA26582@bogus>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587022460-31988-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 16 Apr 2020 13:04:17 +0530, Nagarjuna Kristam wrote:
> Extend the Tegra XUSB controller device tree binding with Tegra194
> support.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
