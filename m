Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84C5C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 18:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 816B62075A
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595873420;
	bh=hXlmpKNXC2EIS+aIl1EFtRnmH4rNFMmU1ztSvq18w0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=T8bUv3EErQDXfXvIq3IcGiXfOAAli5Yk96IQqSpSFo9YbNSGRSs5jRrcMD1q/LX6A
	 +73FWnP3YG1/uJfemfOTukiZ1PK28IqrkJCDsl3uoZoeQUtvcIehcmaQ/9ltq0uSiv
	 nsVtUt3/JvLsS2qL9vnefaoaa8yPiA1msb9JjdbM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgG0SKT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 14:10:19 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37341 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbgG0SKT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 14:10:19 -0400
Received: by mail-il1-f195.google.com with SMTP id r12so13898786ilh.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 11:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AolHbyPhlAWhBYcDRE3hJ7vbSTWfg9WAuD5eMY9YYM8=;
        b=q2FVjratR7r6e0fP4KkgoKXZjiO5YM02q13fYBVCNozjHSeNHZizZ3OGVr/Z/p+qqn
         fHflZhZV9nr0qkrBroQOLAZsWdztGWN9oocU37XipFPCUEADFdOPPvT9s9gSwoouQLA5
         We90XcbjfROd3z3Lds82fLr5Fnf+8UaisrUMyQqlwGGmZmxxlKgHAneAuAWizJx9CG5r
         w6yAlLNNtng46IjtdR1bTdbV1ldAsfBpqYRfqHyhfUBVXgp2kafOhxuQJCJ33xPEeH/I
         Uv7Sg+eFnLAt/i0aBAXZKsfnhHmdiqi7gOEur6RBL1zTdiKqmtmsH+IaKMOy+xJNrKGb
         a3cg==
X-Gm-Message-State: AOAM532fGMXNIYFLMikHfJstHEfDLcVVYg4bp5tuKeXpRLqHw5cu227H
        xRvA9Ne6s4k7al/xOyWH7g==
X-Google-Smtp-Source: ABdhPJxAU0CyMzjJd4gnIUQFQqnSfLPuYlRJ1weSi/Lg2wdatRIDKIHv/hn0Mw39jWkv5FN9Sdwrng==
X-Received: by 2002:a92:c8d1:: with SMTP id c17mr9036441ilq.166.1595873416565;
        Mon, 27 Jul 2020 11:10:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j79sm8889371ilg.42.2020.07.27.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 11:10:16 -0700 (PDT)
Received: (nullmailer pid 633675 invoked by uid 1000);
        Mon, 27 Jul 2020 18:10:15 -0000
Date:   Mon, 27 Jul 2020 12:10:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: Add DT bindings for Powertip
 PH800480T013
Message-ID: <20200727181015.GA633248@bogus>
References: <20200725211335.5717-1-marex@denx.de>
 <20200725211335.5717-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725211335.5717-2-marex@denx.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 25 Jul 2020 23:13:34 +0200, Marek Vasut wrote:
> Add DT bindings for Powertip PH800480T013 800x480 parallel LCD,
> this one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/powertip,ph800480t013-idf02.yaml    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: $id: 'http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02.yaml#
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: ignoring, error in schema: $id
warning: no schema found in file: ./Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml: ignoring, error in schema: $id
warning: no schema found in file: ./Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1336335

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

