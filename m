Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D07C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 16:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEC6A2187F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579104328;
	bh=eBGLvhXJudq8c8ns1iD/SjohF++SLfZwoKDFp3HQgcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=j5zBeGc9T6uMk/M9xG5ljr+h8Wz36TpVd2U304F8Y5XAcEnyMIaC0eeoQa1b+ZW65
	 NrTa/E17PugzQssu5bx32niihbn9J2vLyJ8EbjtBluO4RE1n/uuGagquOEezq3iR8Y
	 raXBOlmIYryWRXvw+FWK1MYvEq8fbxFoHLs5Fpo4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgAOQF2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 11:05:28 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35989 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgAOQF1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 11:05:27 -0500
Received: by mail-oi1-f196.google.com with SMTP id c16so15874031oic.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 08:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RUBHE4XJm85NFA8oPl1FMyCsYkpngZCS0u/hs5fFTfs=;
        b=Ljg7OjjP07ii8BSx3qB30DgjlaojqYboDH3FDOomIfFCjDf3NZ8a5Ge7SToy0cni69
         S8hnIxS1QRNua6Yko38UKUCKFLboYmKSA+xbU8bxxJTnETt/cD3vuoVFaqDr+OOTSHlw
         b980u/4HJ17GNkt02edqsIb2HOHHq1AQ6vMHNbNBxc8OUmvfGMgPr2yQxMVM4c1W0HYe
         8YFJoyFDOwlWBuroIx7Vf513ImVW05tNgst7GItJwdqjebgQZ+N8E1XqITqjBQljVZeb
         zNe4ethVfFayukH3n0s37U3scVGfQuC3jssuOqHqQqCpg5aylNgnIBE00XGnfC6jwEdF
         q9Lw==
X-Gm-Message-State: APjAAAXWfEqsOrZ8UJP4qJhtpEj/q8/KX7xJ42b/+e5xLKf22cOMouL7
        ifd2+P88UmQ89jvHLqpTost5sIA=
X-Google-Smtp-Source: APXvYqzDC4D3kTgOpVOD05jgAUduR7m0uP0jbhPDvhi0JixonN+0XALksIzTGOy6Zd+2T+cPtjhGKQ==
X-Received: by 2002:aca:6545:: with SMTP id j5mr427066oiw.60.1579104326541;
        Wed, 15 Jan 2020 08:05:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm5765807oic.52.2020.01.15.08.05.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 08:05:26 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22093b
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 09:42:50 -0600
Date:   Wed, 15 Jan 2020 09:42:50 -0600
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
Subject: Re: [PATCH V2 3/7] dt-bindings: imx-ocotp: Add i.MX8MP compatible
Message-ID: <20200115154249.GA15419@bogus>
References: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
 <1578893602-14395-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578893602-14395-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 13 Jan 2020 13:33:18 +0800, Anson Huang wrote:
> Add compatible and description for i.MX8MP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
