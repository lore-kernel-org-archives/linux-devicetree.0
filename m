Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF15C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 14:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4CE820838
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583245694;
	bh=TnywHIcT7Wp+hNsxRBy5i/L1BEL6vcXnQft4S1PP2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QvDj5clsi4TulP7CFXECuT4DbYgqkHyZZwvdPIyZa9olyzD9MqfwEbWEkxN9UhH6H
	 DDYgQqxI53HRg32MG6PShLVRcxSbUEru7TOMNqmClBiCzySldSfRulUhU+ACHxl4rR
	 q1DmC1i0K0sZ7wFyy285Y6c4QImyaeZPWkD35zJE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbgCCO2N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 09:28:13 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46706 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbgCCO2N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 09:28:13 -0500
Received: by mail-ot1-f68.google.com with SMTP id g96so3108527otb.13
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 06:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2FUyhtmi7/WicLCHxysDUaRoeQ/1CVimjJRrNgtBwnA=;
        b=g9Z7+plapT+ameM551/6uFopqiM0WSbcSwEFWUs3tihu/RALez2nCBw7Jc0lfbjALa
         V12//NvX1iIRKalraWPwLnUPUWaC8IUBIPe6ZLKvZDx8OZ9rU9p3nxEsD+sl9zvpyq7L
         CwyqjLQq2toogmFKNRln5wwEW6ZW4ZcoMDqgsuuOl2HsqfUq3Iv7ezyFEJszxsN0Bx4C
         y9if+TsNq4SUtWWAppXGAN3GUqkYM/m3r0NOlQmPeZS4HTFuJpNlUq5EF1tPncYO+qX8
         Jyu4mOy0E9OEntqLV5b+CN6FskO0Hwdt5nF8gUqE1ekm3gJ5YkQXz2q+dDvFcjNZZkAJ
         WpNQ==
X-Gm-Message-State: ANhLgQ20iGQC4drfEVSwvzn3OsmJAHWEi4CmVFShDI/E254WnoL7Nkss
        fhj8LsIB6UzRUJSazFvIEfyd58I=
X-Google-Smtp-Source: ADFU+vvP4PgEv9GSWXDNr2Lj0pCZKvSPLEY2iMJAN0YPIODXwPWRP60sYVdqGqguHHkZqdAgMA1DEQ==
X-Received: by 2002:a9d:6c13:: with SMTP id f19mr3314229otq.175.1583245692376;
        Tue, 03 Mar 2020 06:28:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c21sm1528005oig.41.2020.03.03.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:28:11 -0800 (PST)
Received: (nullmailer pid 20525 invoked by uid 1000);
        Tue, 03 Mar 2020 14:28:10 -0000
Date:   Tue, 3 Mar 2020 08:28:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 4/5 v3] dt-bindings: arm: Add Versatile Express and Juno
 YAML schema
Message-ID: <20200303142810.GA20466@bogus>
References: <20200226110714.134904-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226110714.134904-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 26 Feb 2020 12:07:14 +0100, Linus Walleij wrote:
> This implements the top-level schema for the ARM Versatile
> Express and Juno platforms.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rename the smb@nnnnnnnn node to bus@nnnnnnnn, on a side
>   track in parallel proposed a patch to change this in all
>   device trees so we get coverage as well.
> - Drop an dash in front of maximum as minimum/maximum is a tuple
> - Move the simple-bus reference under the SMB node with an allOf
>   directive so we get the restrictions of simple-bus with the
>   additions of our compatible (etc)
> - Rewrite the compatible schema to use one enum and one const
>   item.
> - Duplicate the compatible schema for motherboard also directly
>   under the smb node with the option of being "simple-bus" only
>   and expand the text description so people understand what is
>   going on.
> - Indent the -if directive for required top-level properties
>   one step (syntactically incorrect but was incidentally working)
> ChangeLog v1->v2:
> - Add missing platforms: VE RTSM, FVP, foundation model
> - Properly define the arm,vexpress,site arm,vexpress,position
>   and arm,vexpress,dcc attributes. Maybe these are not the most
>   elegant bindings but they are used so we need to contain it
>   properly.
> - Add a patternProperty for the SMB (Static Memory Bus) which
>   was only described in text in the Vexpress bindings. It is a
>   "simple-bus" so just reference the existing bindings.
> - Define the layout of the "motherboard" node sometimes but
>   not always found below the SMB node, using two address-cells
>   with one for chipselect.
> - Make the arm,hbi property required on the ARMv7 variants.
> ---
>  .../bindings/arm/arm,vexpress-juno.yaml       | 223 ++++++++++++++++++
>  1 file changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
