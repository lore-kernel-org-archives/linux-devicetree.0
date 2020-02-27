Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBE7C11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 17:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1208246B0
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582823272;
	bh=nOdea9GO6SIDF5+xCwDsvD54W+6RhOyEdWNETfPHHvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KtGczra6TCjmBV8SoEk8l2ajN4adcuCpn41ixbJiXNc1TqqpC73BmfotY3gz70tmC
	 eVccqKmI05KOTcCufyo5E0B3I9/33W14MvHodFdOi7GoCsp+WOI6c68z9TgRwIOBEc
	 GOu4mT+HDhUfLzQaaIHDmEyryLVqkdQ1av0x2Gjk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgB0RHv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 12:07:51 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39886 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgB0RHv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 12:07:51 -0500
Received: by mail-ot1-f65.google.com with SMTP id x97so1000806ota.6;
        Thu, 27 Feb 2020 09:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=InsmB7K49IbGFoAcpPNcKRxbX33Sq72EBl8TIXI+Jks=;
        b=ubVIOsxZhVGwaC5aCh2Y8zbS5ACaP7Lk4hrWZl73B54DotVYkiyKhGsZQJlAGFYMIS
         hLrfJsIDlRLe7+NmhSqvBcjSH5agDCfcbWskqd/hVSWRDuHOPhdFueNn82x1665ljkQh
         T+YcUEfGWe24ZxAwMwjrUhb2UWtCPyyZxjoXuajmSl99kUsFxyQi4RdKrYOJqWjbISpm
         ZLHA6pCxJOfyDBb5RQ0lQO9maKgCh1AR6xKNDBHgk9qxV2N+X539+u5x6Y6V+qfXuL2w
         +gtERQKXrVhoMVVOfw3zhOiT5BM/KS2Ukqcq+OQfIZJAmKL1hwo/yr+OuNWN2uoRg5/Q
         t/Xw==
X-Gm-Message-State: APjAAAVi0m+XxyRAbA3wkZe6WKb5uYZiaZLRSC7Lz4asvRzihM3/U5EP
        1lPgqb6gLGz/kPErcanlUA==
X-Google-Smtp-Source: APXvYqwReYFW5+9iTptEhtgAEVTUlxTpOhTN5cLvCWwPo3QD9G6weLLuawjcTBQoP7gwUOwpcHjbxw==
X-Received: by 2002:a9d:6544:: with SMTP id q4mr535139otl.269.1582823270477;
        Thu, 27 Feb 2020 09:07:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n8sm2113708otl.11.2020.02.27.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 09:07:49 -0800 (PST)
Received: (nullmailer pid 2184 invoked by uid 1000);
        Thu, 27 Feb 2020 17:07:48 -0000
Date:   Thu, 27 Feb 2020 11:07:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, vigneshr@ti.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, simon.k.r.goldschmidt@gmail.com,
        dinguyen@kernel.org, tien.fong.chee@intel.com, marex@denx.de,
        mark.rutland@arm.com, linux-mtd@lists.infradead.org,
        dwmw2@infradead.org, richard@nod.at, computersforpeace@gmail.com,
        boris.brezillon@free-electrons.com, cyrille.pitchen@atmel.com,
        david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com,
        tudor.ambarus@gmail.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
Message-ID: <20200227170748.GA19661@bogus>
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227062708.21544-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227062708.21544-2-vadivel.muruganx.ramuthevar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 27 Feb 2020 14:27:07 +0800, "Ramuthevar,Vadivel MuruganX" wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add dt-bindings documentation for Cadence-QSPI controller to support
> spi based flash memories.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ----------
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 142 +++++++++++++++++++++
>  2 files changed, 142 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml: ignoring, error in schema: patternProperties: cdns,read-delay
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml: patternProperties:cdns,read-delay: {'description': 'Delay in 4 microseconds, read capture logic, in clock cycles.'} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml: patternProperties:cdns,read-delay: 'not' is a required property

Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/spi/cdns,qspi-nor.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/spi/cdns,qspi-nor.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1245559
Please check and re-submit.
