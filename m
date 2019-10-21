Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE28CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F3B22084C
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571654488;
	bh=qg1bv44/BBAsHXViZgZKTl5QL7oO0d9gtU7JnE0mkP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xjtnutgeCrxyF1Ipbxlsc9rlp/q1EZpHR8Cjb5c0vL1Uzhfr8n4lqDdfX9Vak75do
	 nZjUhFZX1FikrhKe93EjYonZIEiGWIjDf1ftTaoDNjXdm1sZPQOlSngaxCVrcJ7IT9
	 T/9/wPKqHLHXFYsV4Fmd7BaIgFwJCuY+KnpmUSTU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfJUKl2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 06:41:28 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43735 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfJUKl1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 06:41:27 -0400
Received: by mail-ed1-f66.google.com with SMTP id q24so3636377edr.10;
        Mon, 21 Oct 2019 03:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zKCIL9vMB0GzeJ1h6j4DhhKvWIOxuKfkf4/vOSPPhUQ=;
        b=kRu1F9fFclMva/YcIKeWRwlwc1WbUFYi9GrMbltJihL5zjyvaa1bGM/d28PEzVgiBd
         Sa754NRFnakfoMdPdaQ7BcifG0jZL7ivzhJv7vmeHbyXBxngh3bqdbDKvqYKk1zgnkbD
         OfXoBljuSTGiEji4zb2rL3Qu9Jz7C5+3l7uaoqzeA3dc3vBdKWmHF30f/T98HcFD0MGu
         sWQKV9COTlDdWLGWb6qzi8SolIQne3xq+UvPWzdxLTuqhTawQwOSLV9/2h7cd0Sq6ebz
         ZGDXbGNwK8kzHBfGcqNFeq6RzPIwPTQ37anP8EJ5e35cTqQrkYWozDj21eVs9AMViL+C
         GVkg==
X-Gm-Message-State: APjAAAVvgsLgneVhj9X0iVaAXGoTnub5XrgZQhyNE/nS5mE9PhWQSyR4
        Jr/1+Jm3WUusbjNpnIUpn0s=
X-Google-Smtp-Source: APXvYqwTBEqsJ/KMt765U6XJBsWJ/1R/kuB6evEMu10Pig47ODFe7bJYqhu72kOh9dhNWz7Zkzqgjw==
X-Received: by 2002:a17:906:cc87:: with SMTP id oq7mr21692472ejb.123.1571654485717;
        Mon, 21 Oct 2019 03:41:25 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
        by smtp.googlemail.com with ESMTPSA id s16sm542119edd.39.2019.10.21.03.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 03:41:25 -0700 (PDT)
Date:   Mon, 21 Oct 2019 12:41:18 +0200
From:   "krzk@kernel.org" <krzk@kernel.org>
To:     Schrempf Frieder <frieder.schrempf@kontron.de>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] ARM: dts: Add support for two more Kontron evalkit
 boards 'N6311 S' and 'N6411 S'
Message-ID: <20191021104118.GA2012@pi3>
References: <20191016150622.21753-1-frieder.schrempf@kontron.de>
 <20191016150622.21753-5-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191016150622.21753-5-frieder.schrempf@kontron.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 16, 2019 at 03:07:28PM +0000, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The 'N6311 S' and the 'N6411 S' are similar to the Kontron 'N6310 S'
> evaluation kit boards. Instead of the N6310 SoM, they feature a N6311
> or N6411 SoM.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  arch/arm/boot/dts/imx6ul-kontron-n6311-s.dts  | 16 ++++++++++++++++
>  arch/arm/boot/dts/imx6ull-kontron-n6411-s.dts | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6311-s.dts
>  create mode 100644 arch/arm/boot/dts/imx6ull-kontron-n6411-s.dts

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

