Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D07C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 19:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 241702080C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597260100;
	bh=WDRRD/foVbviUf+2xCEH/R6BWczhXuKJrSR3tQZPsFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=exV2PvcAiaXWcpf8UQP/ec6SFzau4D3+8TwWVWuNMNsXA9FcHH0ow5tuZpEnM0DoN
	 utI83F48E5LLs0af5JiJ8dJSiXHAA9cuSL2YzDFLUNtEjw6at4i4Ll04JgiYGJe++k
	 1tsF5/8PdK2f/oNlsIjOTFlc3FGemzdYu9/zKBwI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgHLTVj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 15:21:39 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41155 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgHLTVj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 15:21:39 -0400
Received: by mail-il1-f196.google.com with SMTP id q14so3016038ilj.8;
        Wed, 12 Aug 2020 12:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lrFi5UUsx7Z7b7tkGVje9KNF6Ch0mT52ynZKiKuVK+U=;
        b=AgJvdfNQuN2M45a5oKFMgtzcDnZAxDz9AeWQtRWWRfkuGclLPYpexSDbLkbxloa9KB
         MqS6NoAqI6b87qjLJGBms2rKYS1vz7Nbe7ijU8kDLvEdouYFfmaUfS9lhKcOML0imTlP
         BX/5wfx7IgGZzM85OzADQAcb+hHfMaWi5fbinX0+TP4S64lA2nXiSvp7HixPD+iLQ5kb
         Lps1dhwZeU77ufRMQOtNdsyr48nOJfoWMCfr8ujeBbdY9p7rGYPM5xB8WFI31m3Y0XeV
         +32z9PDz8ispaQffrDiPwvfAYEECAPzIT+JVc20DVL5+rRga806RmUECyJ5XrG8YnYWF
         Vsiw==
X-Gm-Message-State: AOAM5334teG/gGvDl3XiVyK+lgD/sATxqJ67bnsyy5MWsI60ncT1C9Jq
        Ofn65AWMWAKs7qJsYKI/2A==
X-Google-Smtp-Source: ABdhPJykPZj78iUAp6YsuQlqpTP0k0Ddxs1kxAkGLFZni5Q/fLkJt2crn0iPw2GXVYUWPlfS2fwbAA==
X-Received: by 2002:a05:6e02:de4:: with SMTP id m4mr1071933ilj.156.1597260097540;
        Wed, 12 Aug 2020 12:21:37 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b23sm1411574iof.29.2020.08.12.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:21:36 -0700 (PDT)
Received: (nullmailer pid 2557433 invoked by uid 1000);
        Wed, 12 Aug 2020 19:21:35 -0000
Date:   Wed, 12 Aug 2020 13:21:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: adv7604: Convert bindings to
 json-schema
Message-ID: <20200812192135.GA2557381@bogus>
References: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
 <20200801161825.96837-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200801161825.96837-3-niklas.soderlund+renesas@ragnatech.se>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 01 Aug 2020 18:18:24 +0200, Niklas Söderlund wrote:
> Convert ADV7604 video decoder documentation to json-schema.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Ensure main comes first in reg-names.
> - Add additionalProperties false.
> 
> * Changes since v1
> - Simplify enum for reg-names.
> ---
>  .../devicetree/bindings/media/i2c/adv7604.txt |  87 ---------
>  .../bindings/media/i2c/adv7604.yaml           | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
