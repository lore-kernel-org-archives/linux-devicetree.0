Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5C5C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 22:16:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 373C0205CB
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591222570;
	bh=r19npDzC+Ssaq2Cs4gM6tuDA7Zx3nL9QN4vmFx17BsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AQvmg3oWY181RIQQDQXEuFtKoON95N5dJRJPOPsjRvc96N5eQxlLq3cHc0yC9dau7
	 ruW12zSpHDqii7wvz/Mc+tT/Z2zo3EqS+Iif20v9g5Ke8eKmpZRhf0ZMP++G4kMxt6
	 MQT6KegDsLtgCr0hjcBwUoGp6HRrDtr+rz4Xxs0w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgFCWQJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 18:16:09 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:44063 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgFCWQJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 18:16:09 -0400
Received: by mail-il1-f194.google.com with SMTP id i1so2939133ils.11
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 15:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rMYc84n19+OGgtVn9II/5P6MMogBkCCeasm/Kp8sey8=;
        b=HIyPONhh228lu6JlOzNPv39/yEj3zT5rtGIchS8TYNOHzBiRbfM8515ffNkapbPFbY
         x1c1pEGv6tyaO8FlIrPLlzvaY4W2rZw+g5PshuElrPIq7vjwCteCPBx0aDAU83Y7AcZG
         NCPMNOZW6p4Wb9/5AFQIITvgjScbHu8TdaXNqecG+7A/5jyKgRNYY6S1TBezkBB8dweK
         4aGfpWXZUw6FXPlFOIpHkaxg5yZRuhtFwksMgAgphJ0NJ40RGr/XK12f9UOZy9EUwKYZ
         f3Eg3uajH/y+/6mtPNqeqXlMYVMNrNpQePU1A75NywdgYclL6jzKEWWf18TJqrC/jfxz
         9GwA==
X-Gm-Message-State: AOAM533Y5j27J9/eub3ZdmKnBbA/2oVMLfwyJzEBMXmx7XmmvfcVvjuK
        6iv/6vYBL7Xw98xAert3SA==
X-Google-Smtp-Source: ABdhPJwHwIAVtxvUaysPu24YULecyerhtKCC4mVOZp+b8rP7kXwCis13n1FDg9z0ORHJNiIUJxrn7Q==
X-Received: by 2002:a92:9ac7:: with SMTP id c68mr1553583ill.53.1591222567528;
        Wed, 03 Jun 2020 15:16:07 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k18sm1406721ioj.54.2020.06.03.15.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 15:16:06 -0700 (PDT)
Received: (nullmailer pid 1973472 invoked by uid 1000);
        Wed, 03 Jun 2020 22:16:05 -0000
Date:   Wed, 3 Jun 2020 16:16:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-mtd@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mason Yang <masonccyang@mxic.com.tw>,
        linux-arm-kernel@lists.infradead.org,
        Richard Weinberger <richard@nod.at>,
        Julien Su <juliensu@mxic.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v10 06/20] dt-bindings: mtd: Document nand-ecc-engine
Message-ID: <20200603221605.GA1973010@bogus>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
 <20200603175759.19948-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603175759.19948-7-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 03 Jun 2020 19:57:45 +0200, Miquel Raynal wrote:
> This property is needed to precisely point to the hardware ECC engine
> to use when there are several of them available. Here, hardware also
> refers to the on-die possibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mtd/nand-controller.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 62, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/mtd/nand-controller.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/mtd/nand-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/mtd/nand-controller.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1303116

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

