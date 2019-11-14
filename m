Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D4CC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 19:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0BC820723
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573758733;
	bh=h6i+jO4ClmW2IeSbOGO8TMT3lJHc7Vol4IZ0eOI4cEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sOMeelvvYGeHuMbtpk7bEME/fl91PcIikaZglUSxtgPNeh2XJOWJ0vgpvEPkO5sRe
	 2o9wredwC+R3zMqE9+s/EvRmufhN2IkQOa2S7/hkGQOar3X9FmnUFyU5Ax9xbj2CCz
	 uGDRI0XjUBsUzIMy6oul2t6EEUUWyM23TjPW1XjQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKNTMM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 14:12:12 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39423 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfKNTMM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 14:12:12 -0500
Received: by mail-ot1-f67.google.com with SMTP id w24so5364886otk.6;
        Thu, 14 Nov 2019 11:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+C86HU47Ruq8ie43k/9gRtCKU5MxuhIIqhntEz1NPZQ=;
        b=IchMeODD2cvjbbsGoWVhSEaRY8BoqJyxHXaZEGjSCWxIpyRKk7o+wt3T80/l8jAc78
         N9h3WLfhu564opz7wWrotg+ng/a19fofq45i67StXvKXlN0DPEV9XhnGldfyoez5/xnG
         fu7hIZlScvCV0uXAT5WHJBRon4BJo2q6LfPdHd61OJrVsXzHRTSZl9ceGi7sKXMeEP/f
         blztBo3ZDd/wsHyWuWlbjdq+bv+jmqlyUkeueQt1yoi6SqgRuC6+snQIpRt233I1nGKw
         FoUDwryUTgyVSGXcIe9mGReq7Imkdxtks5R+MGFe5tevMcwdJ2AQFp4awqoSJUQQx/2d
         svEg==
X-Gm-Message-State: APjAAAXX/z03tSpiG8CHEbqXqDalgjw7UfT+VV2JtHEMPKIx7eiO9w3w
        bWrd1SCGl91EGfkdENyBdwNBqU8=
X-Google-Smtp-Source: APXvYqyK9IS1/37lWqaHxvuWrpHCJsZDLpbEJyl9jVccb1gWuKI2tXRvRTaUMaR3uOkMFMa/eX1sYQ==
X-Received: by 2002:a9d:5e1a:: with SMTP id d26mr7845139oti.96.1573758731278;
        Thu, 14 Nov 2019 11:12:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s66sm2140530otb.65.2019.11.14.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 11:12:10 -0800 (PST)
Date:   Thu, 14 Nov 2019 13:12:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        andrew.smirnov@gmail.com, manivannan.sadhasivam@linaro.org,
        marcel.ziswiler@toradex.com, sebastien.szymanski@armadeus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2 4/4] dt-bindings: arm: imx: Add the i.MX6SLL-EVK Rev-A
 board
Message-ID: <20191114191210.GA4324@bogus>
References: <1573435732-30361-1-git-send-email-Anson.Huang@nxp.com>
 <1573435732-30361-4-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573435732-30361-4-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 11 Nov 2019 09:28:52 +0800, Anson Huang wrote:
> Add board binding for i.MX6SLL-EVK Rev-A board.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
