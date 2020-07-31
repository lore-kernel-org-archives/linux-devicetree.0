Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C3AC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 18:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D44E2177B
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596219424;
	bh=yMIMRhby0ENYjblozqJ8zQ1MVvNiMLtNnA0wdEXSdWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tGJqiWXbB0NQdkViBfHu15vHGxAQ6y2WfTOchkXjsU3MvuBnVIUEwzedi54gaQMis
	 DsStTvSWmUsWCBqUPFJTVjdMaSFBwtGivxrdaIKnsQumroMtZqu0jBJ6iiS4iUA91e
	 BlQxgm8L8jWkxnzPWQZzx2QohM7YRDkElqpHAqqY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387664AbgGaSRD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 14:17:03 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46201 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387651AbgGaSRD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 14:17:03 -0400
Received: by mail-il1-f196.google.com with SMTP id l17so15880057ilq.13
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=77WlZQqU3ImQO+xRqrFTFI2yhnAs7gza/QOZvYv5/XI=;
        b=uFcKiYkFkYB36SLg4l2upp3XpHeffbLMvZztDtgU180p171/3onsqxwwk6P0stp1Fv
         7IL1qqFnhfiLLrKgAzmBhh3DboNqUVOXKpCHLUq7j6uHZVb5jDRItORejmeFKtWC9oT1
         eidSn9zTvhLSbBP1VcA2xqGfglquEuGBPyfSw19iJSKX2s7eLmkTHdZmyd9ikeuNg4J+
         9p1pwAZpyFiOjZeraN3OHBMgLPUSfDiEyG51gVHgVJDZw7/loVePpP0bBfwszJ6OnQyZ
         ANg4Uvs7p84QD6ISIhzl2nsJG17FJOo2qY+8FZZ4XquVrHOl9erS3e7/1bfMNVy0bxYq
         C8AA==
X-Gm-Message-State: AOAM5315888nH4GcHlZG1/WXH/d4BrXioTNz4BiKQpOb1Cegj8CoUlNf
        f8tj0R4ECD8LGv70COFwtQ==
X-Google-Smtp-Source: ABdhPJweTNxgrhfP20fbpdroohdhYW6e9WsoyMEXNSw6w5WsFdpUOqN9yTbxOy258PtpAA5t7hgMjA==
X-Received: by 2002:a92:79c4:: with SMTP id u187mr4991075ilc.194.1596219422434;
        Fri, 31 Jul 2020 11:17:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q23sm3575769ior.47.2020.07.31.11.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 11:17:01 -0700 (PDT)
Received: (nullmailer pid 515123 invoked by uid 1000);
        Fri, 31 Jul 2020 18:16:58 -0000
Date:   Fri, 31 Jul 2020 12:16:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
Message-ID: <20200731181658.GA500828@bogus>
References: <20200728051735.6187-1-lokeshvutla@ti.com>
 <d017863c0da4950016f6d4e7fb34d7c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d017863c0da4950016f6d4e7fb34d7c7@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 31, 2020 at 06:01:50PM +0100, Marc Zyngier wrote:
> On 2020-07-28 06:17, Lokesh Vutla wrote:
> > Hi Marc,
> > 	This is continuation of the RFC patches[0] regarding the driver
> > updates to support for following interrupt parent connection:
> > - INTR -> INTR
> > - INTA -> GICv3
> > The current existing driver assumes that INTR is always connected to
> > GICv3 and INTA is always connected to INTR.
> 
> I'm OK to take this if I can get an Ack from RobH on the three
> DT patches that still need it.

Reviewed-by: Rob Herring <robh@kernel.org>

However, there's a dependency on 
bindings/arm/keystone/ti,k3-sci-common.yaml.

That's a dependency on this being merged. I don't care if it breaks in 
your tree, but I care for -next and Linus' tree. There could also be 
other 'make dt_bindings_check' failures/warnings with this as the above 
dependency prevents further testing.

Rob
