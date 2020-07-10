Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5C1C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 16:39:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C8282078B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594399184;
	bh=jrT+bIHosKw7cOBrdn+/6R1dP6Sejd4LsqgP9T9qjO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KkjxBxgLXVLcxl8okvqIfkrBn6LmSBSLLnutJdh2PGqjN+0qEbhNyU65h7nr5vZZM
	 Gpn66LiMavcMIqbOWZ8nAyEtV6qxcHuHzfWMpkk1W7WA7FCKJJvSXhSixBJ/3ecG21
	 ujT0E8Xojr67tL/DJNqzorOE+Zo8QFHZhqZpsrTo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgGJQjn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 12:39:43 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42709 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgGJQjn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 12:39:43 -0400
Received: by mail-il1-f195.google.com with SMTP id t27so5583682ill.9;
        Fri, 10 Jul 2020 09:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PbdZ4MRWgPRTLXc9OX+frNiKU7Q0wD+VvOim/01go3w=;
        b=OI1egB3x3TciHwh3w/GmEjca3raQbMjlefMA14+PJ6LpinSdsbH658kO6BD1AgVCvo
         ITWXKRg00cnl5lNv4NLheffgQmUynERlL1zc7fDQaKaKGUUP3SLDjomfyQ1wnfKcNfVI
         H1G/PpZmCpxXVCdnjTnP2CbXE9O48MK8LNt3zDBqCKGMpNJnAKbDL6f5GepuANeBcBGt
         b8getMIGkcW6rooSauuZmU3D7Jm/fGA8fUIOIuhHv89otw9UQ27fEW4/p9MkNto7GCga
         eeIMctpO+uQ7MjFr3DH/Vji6zPddIPk4sDfymtMiHbl1d65SrnLBRt/VRUAfkIwn+qFv
         mXSQ==
X-Gm-Message-State: AOAM533zCNA45fzCnWqSiOY2ZIf+0TmKoeWRGHA6eULVT3R+ueZt6z2x
        BupUw7to6AAIky475iWnU3WbMLWKxcPB
X-Google-Smtp-Source: ABdhPJxQhmbMFZ3hkYNcCKa2yWDgTlPwCTZc5raZI6lv5WRcFB9L6NEI8B5WdPqWurpwaypPKt5xNg==
X-Received: by 2002:a92:c213:: with SMTP id j19mr53468433ilo.40.1594399182198;
        Fri, 10 Jul 2020 09:39:42 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id b21sm3980629ioc.36.2020.07.10.09.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 09:39:41 -0700 (PDT)
Received: (nullmailer pid 2775731 invoked by uid 1000);
        Fri, 10 Jul 2020 16:39:40 -0000
Date:   Fri, 10 Jul 2020 10:39:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kurt Kanzenbach <kurt@linutronix.de>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 1/1] dt-bindings: net: dsa: Add DSA yaml binding
Message-ID: <20200710163940.GA2775145@bogus>
References: <20200710090618.28945-1-kurt@linutronix.de>
 <20200710090618.28945-2-kurt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710090618.28945-2-kurt@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jul 2020 11:06:18 +0200, Kurt Kanzenbach wrote:
> For future DSA drivers it makes sense to add a generic DSA yaml binding which
> can be used then. This was created using the properties from dsa.txt. It
> includes the ports and the dsa,member property.
> 
> Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  .../devicetree/bindings/net/dsa/dsa.yaml      | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/dsa.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ti,cpsw-switch.example.dt.yaml: switch@0: 'ports' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.example.dt.yaml: switch@10: 'ports' is a required property


See https://patchwork.ozlabs.org/patch/1326594

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

