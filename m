Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276B6C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07E6E2076A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586966431;
	bh=56sT1iHc2rESmqs7uYkeyojUhIDWZOhEvUqmQU4BKjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zvCQpfrCysZSTgXUZCWAno7WlIqSJEEsHi8yOnQd+QvGilCjybl6JZ5eUVdfRNKR5
	 +zpaw5BaRFjb6wqnjQs1lVF7E86Q1feX5SvvE0hk6sDgn5+Ywrc1t0P63MEySEfBTK
	 MtMF661+wy6yxg813xkmPFEOudnz2e8nOhiY5nEQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415066AbgDOQAW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:00:22 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46832 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415033AbgDOP7X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 11:59:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id w12so340272otm.13;
        Wed, 15 Apr 2020 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SAF4YLo18AVSTjr/wfbj6WC+7BWE0mGsD5hCj1/7WQw=;
        b=gT/O38TpATvRrKmqbuHWjlMwwfdjD8KCx3MWLTn7dViF+1Krs8FqK4qTzQhCLtBNRn
         EaXiLU8fv0w+TyKtdbiOy1aT3OnWp2csUrv5/lVSfGumMCT40tE6wwW+qoFOPHdQko8I
         0y1HOOUqx7k3loQ8ayDZ7swbbrd2xK262iuprfZUdxJfaQ/4+4g5oaY2LAjmkWEOfqeL
         kW1RVW17YrE34BEpRvSbTLwO6Hp36V6pkhHV6rX2Ma28OosKfxEqp52qnKZFjnurwOrO
         1t7PvG83eG1TMPimV+XkZmNFF6/We9ub1RS1z9NuwdlNfbOWTt2ApYwtiJAp13wmGNiy
         thVQ==
X-Gm-Message-State: AGi0PuZjTR0Kb5543n4M8zb2WjvfEBlVwZmPNxUa7p2+7js1Y3VTSUQj
        TGyHr2GWLnxNAbhcIc98+vIbTee1NA==
X-Google-Smtp-Source: APiQypKbPqwG5FUIUFJ/dfqhD7t+dJzqhbjje+7XefQT59bwn8uIk9f1Vt+2WZhGWq5VdAvdMs4LYw==
X-Received: by 2002:a4a:b489:: with SMTP id b9mr5715887ooo.71.1586966362475;
        Wed, 15 Apr 2020 08:59:22 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm880414otq.41.2020.04.15.08.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:59:21 -0700 (PDT)
Received: (nullmailer pid 30581 invoked by uid 1000);
        Wed, 15 Apr 2020 15:59:20 -0000
Date:   Wed, 15 Apr 2020 10:59:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] spi: dt-bindings: rspi: Convert to json-schema
Message-ID: <20200415155920.GA30523@bogus>
References: <20200408091129.25429-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408091129.25429-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 11:11:29 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas (Quad) Serial Peripheral Interface (RSPI/QSPI)
> Device Tree binding documentation to json-schema.
> 
> Document missing properties.
> Update the second example to match reality.
> Drop the first example, as it doesn't add much value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/spi/renesas,rspi.yaml | 144 ++++++++++++++++++
>  .../devicetree/bindings/spi/spi-rspi.txt      |  73 ---------
>  2 files changed, 144 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/renesas,rspi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-rspi.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
