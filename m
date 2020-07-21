Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9850EC433ED
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7954A20720
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595347000;
	bh=aJ4S4Ku4oD+O3UYZEDLoHqIwU4q2/LU+d4e4B0ihZbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iKe3f1N1ADCEONWaQ5X0f+qrQKppVHeN2OYRK0c2pLgZ0zkBn94Z35tfwtyTz4ilo
	 vxUujY3KyUy9ZivMHNfTiMDNJTfBsL+qfp0vTHFCuNUB1JredciGb/3YWkTg42gXn2
	 mdHwkSpbLVmwRO5WgVQFQPKKn4B5ROrsOMvQCFKE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGUP4k (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 11:56:40 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:42449 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgGUP4j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 11:56:39 -0400
Received: by mail-il1-f196.google.com with SMTP id t27so16798513ill.9
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2020 08:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ylU+CpzRTlVJbbtecQfv5+yMNg4XBs56W3Z7SP5ZovI=;
        b=cUTeKDHfzwsfz2WeSbhJJNhCTq27bbmnPp6d38cBJeVwvEgZGYdJmMVoqgoa9UM3UD
         wV2E8PEmWPIckcHrRNOk8S4eaP6oVBLyzU7mR8M8KYmOGicBGu8mpHTLfrfUe0AsCupo
         n+637unk81PAC6rvfhTPkJBt3euhX+w5/DrJpDZ40b9GVBJtqgiNc8DpecNWeO1cXLUY
         7DBysMvABeW/8zC26I5wWwHuvG4FjDAwtGe07QjMy5QbAaTBFmO8NcGTKs8CR+ElLApf
         4sPoyO3wFppfId4u12UE+YBFWKOD/C9/MxNSlCosOoKpD3+qELHZUjKjX5n/EYv6LuJK
         cwDg==
X-Gm-Message-State: AOAM533REoubgJ8+EmQtX6m80fZACh/mBQ6WeJ0V+ij7TXTNuGwHFTwU
        bEptFTJIM0DQNPWKG81TRzwlOWZdMA==
X-Google-Smtp-Source: ABdhPJyitqXDLCSKNzFtA2FijEAz37SlsUfz+UCr+HWnrxRteadTfGwHFPBXWO4Sf7/mn9dRXqz2Kw==
X-Received: by 2002:a92:cd01:: with SMTP id z1mr29291958iln.103.1595346998855;
        Tue, 21 Jul 2020 08:56:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a1sm10563642ilq.50.2020.07.21.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:56:38 -0700 (PDT)
Received: (nullmailer pid 366967 invoked by uid 1000);
        Tue, 21 Jul 2020 15:56:34 -0000
Date:   Tue, 21 Jul 2020 09:56:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: irqchip: Convert ti, sci-inta
 bindings to yaml
Message-ID: <20200721155634.GA366409@bogus>
References: <20200721061007.28324-1-lokeshvutla@ti.com>
 <20200721061007.28324-9-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721061007.28324-9-lokeshvutla@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 21 Jul 2020 11:40:06 +0530, Lokesh Vutla wrote:
> In order to automate the verification of DT nodes convert
> ti,sci-inta.txt ti,sci-inta.yaml.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../interrupt-controller/ti,sci-inta.txt      |  66 -----------
>  .../interrupt-controller/ti,sci-inta.yaml     | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 105 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.example.dt.yaml: example-0: interrupt-controller@33d00000:reg:0: [0, 869269504, 0, 1048576] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.example.dt.yaml: interrupt-controller@33d00000: '#interrupt-cells' is a dependency of 'interrupt-controller'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.example.dt.yaml: interrupt-controller@33d00000: '#interrupt-cells' is a dependency of 'interrupt-controller'


See https://patchwork.ozlabs.org/patch/1332811

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

