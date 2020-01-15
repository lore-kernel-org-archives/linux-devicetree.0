Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C3CC33CB2
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 15:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2C842467A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 15:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579102965;
	bh=mwQEY3Ww6br5KNOmSwVS7hUcvqZ+uw0UKLzziu3FWeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xr6wxNxmQmZjPSyG63+PmkzcktdSKc8pO28Ne5jsjocjX/GCNKXYdwOPtb7NhWzsy
	 Lvzn3i+DxEULtCY80OpTkmGrS5OSrCsUjan+9uuXNeIF29XafRliEQICOjXy3LrxbT
	 kGZvhqUOgY0L+vEOXkxbIVhYip0Ua8AoPhXCvLAA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgAOPmo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 10:42:44 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45645 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728915AbgAOPmn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 10:42:43 -0500
Received: by mail-oi1-f195.google.com with SMTP id n16so15751397oie.12
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 07:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XZ89QzBAoQ2DzrvbjynM5ltUEoPFqx0Q/mdX+QC5z3Y=;
        b=uFxYiKNgB6K2uCTfnOZ5XTpSNkaZ863k6EDnV1QoNGaITABNTlBeZmnxFoRkFPgcOp
         5cZw5DFNqZ6YvdFhnvE8Hmi4gHsuEcGizOJQoczt7j7UgAxjfjbLDtDo0IIxhhNSQkZ8
         Wk9/Km33wJCCCfejFV1LXFXV+5fNy/xBm0TmsWdKNwWCt56sfFqvI6NCICuW6SFYEoNp
         16a2behgiNmJXYXKfWVrCMdvK5qzw4arsOzuGgpWWyCviTEbcJNkCdnXzDlJmd7N855S
         hicSUYGeU/QIPRYeF6V6l19VIF4Mpjb9qLUM6XxGA0oI5isgQkAIaTDYikharHT85XzP
         ihZQ==
X-Gm-Message-State: APjAAAVwAv4J4gxV1CngAzL2bLMrB+obT2hYU8j9KiijecOOKQ+zllUt
        lw12gYK3KU9z7V0VQXzhk5tHEMk=
X-Google-Smtp-Source: APXvYqyJ7BivgmTOo+tTMTaN+PNEv3jqjE9j2HRMi0ocpS8mDJE/NjMHv9bEmAv9aoZcglE+3FwavA==
X-Received: by 2002:aca:5795:: with SMTP id l143mr303022oib.27.1579102962651;
        Wed, 15 Jan 2020 07:42:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w8sm6587534ote.80.2020.01.15.07.42.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 07:42:41 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22061a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 09:42:40 -0600
Date:   Wed, 15 Jan 2020 09:42:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, vkoul@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, broonie@kernel.org,
        manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com,
        rjones@gateworks.com, marcel.ziswiler@toradex.com,
        sebastien.szymanski@armadeus.com, aisheng.dong@nxp.com,
        richard.hu@technexion.com, angus@akkea.ca, cosmin.stoica@nxp.com,
        l.stach@pengutronix.de, rabeeh@solid-run.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 2/7] dt-bindings: mmc: fsl-imx-esdhc: add i.MX8MP
 compatible string
Message-ID: <20200115154240.GA15071@bogus>
References: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
 <1578893602-14395-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578893602-14395-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 13 Jan 2020 13:33:17 +0800, Anson Huang wrote:
> Add compatible string for imx8mp
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
