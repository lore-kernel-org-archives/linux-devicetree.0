Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF25AC43215
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 17:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABF7B2073B
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575393459;
	bh=vUwtyudTOwTrKfNQ/Xf199jaqLOa0Q5xF/tJSEkFcwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Qt7K+svvYRGD6Z3qNqis7HkoeAVgRwCQq0pggBRCEXc29tCC9ZnXXa+3+8D6w5Hfc
	 k7Kzlq9ms7AFCZ9EQvm/nHfQKItN5c7l+vGP9DjFwvPeDlVExHJlUbdCQlQBeaFrrL
	 dvsqEaaycKz4+teQDeQZ8mTfw8bFzD0s0djLUNGI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfLCRRj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 12:17:39 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37712 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfLCRRi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 12:17:38 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so3620836otn.4;
        Tue, 03 Dec 2019 09:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ArPIadxBEM3m94vyZBP3lWb7orwIJHnZVomLbNctvNE=;
        b=d5cTuJDHF0xHJR+1aMTCANpZ7q2Ub8OpaXQLMdx3R6/t3NLKmjuBNTCc3Z9IazK8pe
         G0t+V+CsWm0Fa730RXedZZltWq2kLF6VEEzQUFy585X/bYU+JiE3zo78RDaY8nBV9BR2
         NuVbikTFAuJ9FUDnFmxHksNAnu81MOV1GW5xrvMuDVaO+/sUUsggqQb3NYzDmNVv8o39
         g4EMKR0viAy/dwcCGcT/Ndbf+xqNCjhQtbA6HvAuxmtGJVD+WfuW4C/JvxMUl0wicr2c
         dktP7WaDJ5Zn5RvhfYJHr1DAeeJQ6/aiqfnoBzwAea6MM8jVstq0PHvZJFUyiLhSmvDV
         AcJA==
X-Gm-Message-State: APjAAAVwbzIEI/UV8gCddTrzDoZ2UnP+VCInhS7iqOYTR+B75ZnavYSm
        dGllhqJ+jmOHWE9Vb+IThQ==
X-Google-Smtp-Source: APXvYqxG2VUWZhaj4nSknQVnpZuIGZe61K8deqyXR6HI2JePzrPG3D0H6+TgcsHHe6ZaHPzb/84J8g==
X-Received: by 2002:a05:6830:579:: with SMTP id f25mr4164157otc.248.1575393457736;
        Tue, 03 Dec 2019 09:17:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x15sm1223872otq.30.2019.12.03.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:17:36 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:17:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 DISPCC clock bindings
Message-ID: <20191203171735.GA11514@bogus>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
 <1573812245-23827-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812245-23827-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 15 Nov 2019 15:34:03 +0530, Taniya Das wrote:
> The DISPCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc.txt      | 19 -------
>  .../devicetree/bindings/clock/qcom,dispcc.yaml     | 66 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
