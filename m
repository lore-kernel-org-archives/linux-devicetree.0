Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94C4C2D0C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 18:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8814F20665
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576521633;
	bh=/qaf6Uh/1ZyJF0Hw75+xksqxkhKZSbTe8TCbRUfiF4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LiEwJizPGkUgId/RYLE6U9dQN8cvSBV9JmE0yNRioHInuca7AXuE7B5y4LuBqn2H2
	 BZNU9UIRGw9FDY3Ot4KW3BapQq6roaYxzX4fHYVBWRcC5b0rfxWM/LaM4/H5Dj+uI3
	 YdYw5nLpnOuyIGkA/iJvjPc6AGTSNbknwugupDIU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbfLPSkY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 13:40:24 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44936 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729077AbfLPSCV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 13:02:21 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so3998451oia.11;
        Mon, 16 Dec 2019 10:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J0Ye3heezTLCH4+67gtqBGARVM5JPXQ6ZAyCvxeGrk0=;
        b=Zo2A5TSfWISX2Qba8wRAbkeq2hHOLGInBAN79sbFsyrwVhzQ8cgMVAFm9x/Nx0C/CK
         PVsrBeSMiUMzqpDjtgdHpOefqDCnId3UazNNqzh+JRXuzqtxeoQFBz5Obt9kQUVaZ738
         NEvF8YlwgrFReHEWMlgvNSy4ODkltZcZZciDeE9jWU/NI0ikPFlVMsLxp21aBgslO30k
         lUgtlEGsa2ZdGzqH6guac3MDs71AfTpa4rJy+5yWdBFxnPOHPEm57sRg2h2uZgYmzSeM
         KYFu9qcEssgXeAZc67yWfO3TqNJmSD+uLjlLEaL7v78oHVYIo+PKyMSNDnR+K9AArAQS
         Qkpw==
X-Gm-Message-State: APjAAAV8tjJflkoHTUcDqTxg5VSYS7mhmQnp3bkH5UUM4bzdo1D0twli
        1wIdKMCXisUir4BoUgX+2g==
X-Google-Smtp-Source: APXvYqx8PFxe+WYzPYFarvmtkpwauTlh4e8QaG3TMcwH4A0Yno5Ur0RNASmV37L9QyPeAT0ozN1ngg==
X-Received: by 2002:aca:ec45:: with SMTP id k66mr139352oih.179.1576519340758;
        Mon, 16 Dec 2019 10:02:20 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n19sm5828686oig.57.2019.12.16.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 10:02:20 -0800 (PST)
Date:   Mon, 16 Dec 2019 12:02:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, robh+dt@kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: Introduce QCOM Modem clock
  bindings
Message-ID: <20191216180219.GA32620@bogus>
References: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
 <0101016ed0008a4d-e7c6d3fc-1020-48e6-a515-762c71bcedff-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ed0008a4d-e7c6d3fc-1020-48e6-a515-762c71bcedff-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 4 Dec 2019 08:22:06 +0000, Taniya Das wrote:
> Add device tree bindings for modem clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc7180.h |  5 +++++
>  include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
