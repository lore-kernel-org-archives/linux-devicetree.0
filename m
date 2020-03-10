Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7238AC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4397521D7E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583865521;
	bh=sWhVyiDzhH2/LT5EnNWWeerl7XPZ5N7R/DUZZzrWBIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=C9DCuzAIShPh0XqGviKbnRQOV4RkeOzjS+I4IVfNxvs75k6l6hUrPfvlG5l9jDxdx
	 d4zVvpWt0MkBsMRaeTO6kiWS0wjVkNCtkoH3J9u5oBL76FsTBr0yAgwDPdh7VzAMzm
	 Ga/AOmLbQWgisBlVYs4lAFzLvD99H0QfSL17CZBc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgCJSik (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:38:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33661 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgCJSik (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:38:40 -0400
Received: by mail-oi1-f193.google.com with SMTP id r7so1789360oij.0;
        Tue, 10 Mar 2020 11:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rcKiHvyeeVweEFjKVsIEKKh5OdVQ21JonvREl9Oqx8E=;
        b=fLNrpGIZDwnxQinE02d5+06iYlWdgNqK6SeT3ex652Ytja3OJg74RGBVrEWy57JP1Z
         CV3AanNemxBUhPbkAhTrLMIKnQhYCoSFtO0Usey3Pke0NKJWKlVSZltT8Hf3AvG3ExHT
         /VBmLrg0tcyiiYnkA2n+TpEHboZk6gAVyqJnorHhz5Z2XVV5uWo0gh45B2e6TYlvFCRW
         LCVN7cXJYT+mrmYRYheOlRdVakgZ/mTY06nnaRQPv+eNc/K0FYjFLL10IUdmDO8NEsUW
         9G1tYYto1qt/8/5PcFBCBDYcUsZawqJKSt+uzbMdoiJ624t3BnDaQ2nymgc11NCBsbRZ
         fNZQ==
X-Gm-Message-State: ANhLgQ1ebcfiPK5+OixSqll6tBknQPDbDP//HUv8UDTv4rdkwVpjGXsf
        YT8yJLYkHtZXjXtteYeTtw==
X-Google-Smtp-Source: ADFU+vsoV3qqlTEQdCVrmWtlFKB7yKGYbJtvxst09oJE3MqwGuSD0LEr/QkIJob56v6U03bQwXU4Mw==
X-Received: by 2002:aca:4d86:: with SMTP id a128mr1767381oib.96.1583865519689;
        Tue, 10 Mar 2020 11:38:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l10sm4493995oii.29.2020.03.10.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:38:39 -0700 (PDT)
Received: (nullmailer pid 26679 invoked by uid 1000);
        Tue, 10 Mar 2020 18:38:38 -0000
Date:   Tue, 10 Mar 2020 13:38:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Message-ID: <20200310183838.GA25904@bogus>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310152003.2945170-5-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 10 Mar 2020 16:19:59 +0100, Thierry Reding wrote:
> From: Joseph Lo <josephl@nvidia.com>
> 
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and a sub-node of EMC table which under the reserved memory
> node. The EMC table contains the data of the rates that EMC supported.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - convert to dt-schema
> 
>  .../nvidia,tegra210-emc.yaml                  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.example.dts:23.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.example.dts:23.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)

See https://patchwork.ozlabs.org/patch/1252240
Please check and re-submit.
