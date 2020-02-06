Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09CFC35247
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 21:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93770214AF
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581026316;
	bh=DIJMIz4b/WVmP/UX/VyRfCoVMvUq23sYLm2ETi3RUu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VJ73J9DfL+9dNn53KJyMCaA4PnGAvF8IH5OhDftcnHIAqbKi2Ez7w4QoLdgeqvijG
	 btk+DQQlAHQvPILrwouVipckG1gZbiQ00uiiuZdRpMwcwPbnRZgsjL+TEi5025tipf
	 Q1YRiAdqx9jViOUXbfWojangORC4+A4jR491X+is=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgBFV6g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 16:58:36 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35199 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbgBFV6g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 16:58:36 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so120438plt.2
        for <devicetree@vger.kernel.org>; Thu, 06 Feb 2020 13:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BStdKAPKolNMZwxrXVPcUbFQXgxnAXRWUYti5a2mUC8=;
        b=lnGVl54dBt/ICHiM5W3qVADltVV5ghj0dvmauRAtOHOEZNGdW7zSIOs2uwe6DwYkAX
         maGVwelMEfbKYpcxuP3CA6lJJ5CZYZH9u+TGzhTdIaKJBFNXK05IulvA7Tw0yS4AJE+I
         miOivLpsGAjjC/e89L2LDAaXP4hq/a1THu7Dj7EVSDpqsnI4fJraMDuJuce3U0XT0r8A
         qCWC5KSWZPQQ1ARnSK9PuU1c+duQalnpVwKi7O1x2+F4Q3ghhgB+Oe7lgeYcGiyCT17W
         SN79+l5kEdtvleVoWJtLGzQNiklrGnoLuhwRptVBhUgJVP1DpCZsIUZBMwO64xzEoKDg
         cAHQ==
X-Gm-Message-State: APjAAAWvs1o7LaMI5OTv43tMR54hwN1wf1z+bqpcJC1+bpyz4j0tELEx
        7f5YdqsX/K0LtjmZ10LD7jiaOK/CQQ==
X-Google-Smtp-Source: APXvYqzBiBbLFostSn1/kLsQsSIGXC3FSgAma6fd+JBSyrdcn3bID2QllKR51tWs9zi+tjz22cDevg==
X-Received: by 2002:a17:90a:c24c:: with SMTP id d12mr7166780pjx.113.1581026315469;
        Thu, 06 Feb 2020 13:58:35 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id z3sm347354pfz.155.2020.02.06.13.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:58:34 -0800 (PST)
Received: (nullmailer pid 21455 invoked by uid 1000);
        Thu, 06 Feb 2020 21:58:33 -0000
Date:   Thu, 6 Feb 2020 14:58:33 -0700
From:   Rob Herring <robh@kernel.org>
To:     bage@linutronix.de
Cc:     devicetree@vger.kernel.org, Bastian Germann <bage@linutronix.de>
Subject: Re: [PATCH 2/5] dt-bindings: arm: sunxi: Add Linutronix Testbox
Message-ID: <20200206215833.GA21375@bogus>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-3-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206113328.7296-3-bage@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  6 Feb 2020 12:33:24 +0100, bage@linutronix.de wrote:
> From: Bastian Germann <bage@linutronix.de>
> 
> Add device tree bindings for the newly added Linutronix Testbox board.
> 
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
