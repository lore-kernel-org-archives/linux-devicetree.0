Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9687AC3524D
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E34320CC7
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MT4xaDHT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbgBCRjs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 12:39:48 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39809 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgBCRjs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 12:39:48 -0500
Received: by mail-pf1-f193.google.com with SMTP id 84so7935230pfy.6
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 09:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8SjBXOY3uRTCT+6FTjNe2mLIwSVfUBt+yhLDpMSoa5s=;
        b=MT4xaDHTHHeUJv4+jorm+uJwLxl940jHZoT2OkFYfdt7ulAON26PYdfCOGw8np5NK9
         FzTVmxiegYkbp/9FE7VCDr5qjg4VDSaiy0Y33T9dqPyqwoO0ffogvcO5fhG8QNzjK6Pf
         YaI1O/A2d10lNU5BP+Yvj34UL754jPPLHbK1e5QZbTXt+/BjT9QFLCmA/EygymH6bCRu
         ZsbK+WEMcDJByo6j6NzjkUoTIwUGVGo6WID70v61ruNUGwP7pQm6bCTNBGzvWZ4FSJWb
         hL11nogwXAPtkSKWLK5DQIBDUBose7qu+zd3FISwpDpTPjvrdaXh4INHCJxDXI/C/JZA
         tlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8SjBXOY3uRTCT+6FTjNe2mLIwSVfUBt+yhLDpMSoa5s=;
        b=APWvX2VIEqtHGah2ZQe/n5/0a/YmCIepF4ZNYLxJz3mwL9O7/JcJr5+tP7Ps/oohZS
         x4r9IqFE4t++8+dXudCeJrouinWVXQrmPBCqAPIhMl6bRzCH5JBxyHSCgyzUd6cX7Y2b
         qBYl5bhz07lBnJMhP/d487EGGXX4uTR13I7PWL/kHEb/bVnKAFaUAT20KYokrwtvajgu
         haNlmBLDZHJ5a1Kbnln8MQgy2OQ3zBUpHf0ZtC9svH1Mse6Iw/Lu10bv0dLkjj6YhoPj
         jzSfux+2a9iaOj+HrrCDyPR9GhkWlHL1MMSuIW5u+4Z+zdE4jruROkrU39Cm72dr/Hcr
         onTw==
X-Gm-Message-State: APjAAAV6fETMRRVw0cIBduIbHV/zdlb42WUAfrys3C3w2KF+T6C0U6ZF
        CsVKi5k37lCyfLwCHi44zPf22Q==
X-Google-Smtp-Source: APXvYqxGnYxuouypVln+vg5BXOsYjLKrNBTfeSXnORiI7w0QsthwJNyZxsFD2nFXEZ+tj3XVGfalFQ==
X-Received: by 2002:a62:e815:: with SMTP id c21mr12851690pfi.209.1580751587566;
        Mon, 03 Feb 2020 09:39:47 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m71sm552415pje.0.2020.02.03.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 09:39:46 -0800 (PST)
Date:   Mon, 3 Feb 2020 09:39:43 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: Re: [PATCH 0/3] ARM: qcom: add Nexus 5 bluetooth support
Message-ID: <20200203173943.GC3948@builder>
References: <20200129232031.34538-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129232031.34538-1-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 29 Jan 15:20 PST 2020, Brian Masney wrote:

> Here's a small patch series that gets the bluetooth working on the Nexus
> 5 phone.
> 
> For a summary of what currently works upstream on the Nexus 5, see my
> status page at https://masneyb.github.io/nexus-5-upstream/.
> 

Nice, picked up for v5.7.

Regards,
Bjorn

> Brian Masney (1):
>   ARM: qcom_defconfig: add Broadcom bluetooth options
> 
> Jonathan Marek (2):
>   ARM: dts: qcom: msm8974: add blsp2_uart10
>   ARM: dts: qcom: msm8974-hammerhead: add support for bluetooth
> 
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 71 +++++++++++++++++++
>  arch/arm/boot/dts/qcom-msm8974.dtsi           |  9 +++
>  arch/arm/configs/qcom_defconfig               |  4 ++
>  3 files changed, 84 insertions(+)
> 
> -- 
> 2.24.1
> 
