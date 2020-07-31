Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F55C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 20:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1F1A208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596229197;
	bh=lZpACWR3uXYv6hRHHYgJ/BS0J7Ay7LuTo77YdOoAz4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q15WqceSpp9Mmc4GIT39cmWjONRvCdNYqKk+Gafu9hJkV8kKtspH2sQV5iaPJrgb2
	 eRh/b4ZYtNz4dWznif7TCGxFx1kzUd74ZYLm87RK4HxgoKul6U8SrlAcKBwHFlGnW6
	 WY9Ril8M2iLchNlMOvalwAolRKCvLYFkI4hKVpiI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgGaU74 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 16:59:56 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41511 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgGaU7z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 16:59:55 -0400
Received: by mail-il1-f194.google.com with SMTP id c16so14639865ils.8
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 13:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UYcNl03XooJ83wKwVlukk4UGjBfn5KW8QexrmJDVD10=;
        b=QfsGbIoTAOTStO33nITZpGBbcLrrE9XyYVOtbXcQ7P392FqQ/5gmUNmaY8Udm/4h1h
         O2YVJsYHJYAc4om+OyKiHkqAntR3v6s4zIDQFcYe46EEDeMF7+pfHU8BsAFdebg7bVC2
         qYjwL/ymHGqSHeedQVUjtP0Oc5ZAzsWS6wmpMizi/0cn1SixPiqYY4aBP4dCEX6Do9XM
         TPX0V+9aUnF7kdreHHIJJxEjwBj8KqvpgXfJvnA2cVU5ObJAjwFEVQCzs7KFswRH2r8V
         e12btz59bU5A3epjxfYbrX6rKIaFK6FMTpkRHoByRU6imkpoubB90L+UCoCDP/vm32sm
         I8RA==
X-Gm-Message-State: AOAM530ZUqyjbLneMTjw4igDU8RSGWb3By6mjxQGZ0yqWHMj7GQv+rab
        mLl2tWFhwui6TueIuhPYew==
X-Google-Smtp-Source: ABdhPJykewMkcC30Hs0+WIUeNisNnIjDwBGDQGvpjdW/aPLEpKXE99/aKWnPBIH3NtLFO/eDZ/rg9w==
X-Received: by 2002:a92:dc90:: with SMTP id c16mr5589222iln.202.1596229195088;
        Fri, 31 Jul 2020 13:59:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r12sm4916466iol.5.2020.07.31.13.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:59:54 -0700 (PDT)
Received: (nullmailer pid 776977 invoked by uid 1000);
        Fri, 31 Jul 2020 20:59:53 -0000
Date:   Fri, 31 Jul 2020 14:59:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Marc Zyngier <maz@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
Message-ID: <20200731205953.GA774358@bogus>
References: <20200728051735.6187-1-lokeshvutla@ti.com>
 <d017863c0da4950016f6d4e7fb34d7c7@kernel.org>
 <20200731181658.GA500828@bogus>
 <733bbcdc-8d29-51cc-f16e-7f95abb56ff2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <733bbcdc-8d29-51cc-f16e-7f95abb56ff2@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 31, 2020 at 01:24:17PM -0500, Suman Anna wrote:
> On 7/31/20 1:16 PM, Rob Herring wrote:
> > On Fri, Jul 31, 2020 at 06:01:50PM +0100, Marc Zyngier wrote:
> > > On 2020-07-28 06:17, Lokesh Vutla wrote:
> > > > Hi Marc,
> > > > 	This is continuation of the RFC patches[0] regarding the driver
> > > > updates to support for following interrupt parent connection:
> > > > - INTR -> INTR
> > > > - INTA -> GICv3
> > > > The current existing driver assumes that INTR is always connected to
> > > > GICv3 and INTA is always connected to INTR.
> > > 
> > > I'm OK to take this if I can get an Ack from RobH on the three
> > > DT patches that still need it.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > However, there's a dependency on
> > bindings/arm/keystone/ti,k3-sci-common.yaml.
> > 
> > That's a dependency on this being merged. I don't care if it breaks in
> > your tree, but I care for -next and Linus' tree. There could also be
> > other 'make dt_bindings_check' failures/warnings with this as the above
> > dependency prevents further testing.
> > 
> 
> Bjorn did pick up the above common binding file through the remoteproc tree,
> and it is available in -next. That said, I donno the merge order between
> remoteproc and irq subsystem trees into -next, and if that is a concern.

I'm less concerned about merge order at this point. -rc1 not being 
broken is the low bar I have...

Rob
