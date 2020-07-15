Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99EEC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 21:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B54F62067D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594846920;
	bh=Qmep26acIl1WZ6Czvp6++MrZfH3Z7L1r45VenfTRrjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XmOIw572ksbG8Dplx0tTM9I2TUilGnO+n0oPKiF8nkWdqPWEe/AqzAzjQ5T3zp8M7
	 K8kqdqfFEtiAorZEPo2+gDCzfQT3vZpHcnfTdnlUMqqiq8u719GKpa3OxzSLgjqtt3
	 KCv2MdnLYeaBXzz6MUQjLrOr3E9H9rrES1hVW0uc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgGOVCA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 17:02:00 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34336 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGOVB7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 17:01:59 -0400
Received: by mail-io1-f66.google.com with SMTP id q74so3806402iod.1;
        Wed, 15 Jul 2020 14:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tl/LoJSdH3t7ttKEqz/6MPL6wWrpBrkpzf3QORxog0s=;
        b=OKic5iL5bq5UZt42Lb7vLDmao+XtSDxEIeCIbV108HWU/C/r7BU5f8tX45R2QEwJNJ
         9kTAejUyeGbmBlbj5AC9/qXv/1DWkO3i5zyLPAMvZegtUePrDj9ml0JVJzafvHOxueBV
         X0grmasTZtVUqS8kY+7/J5+Q7UlRVM/bJcuJPlzsrDNIGsGp1Sos7xkSdt5Qs8B9FFkO
         MAoex6r3P34YHDEhxQ3z4Ne0pgAWKkahUDPRb7S4IVFibHUK45BX8TAcdS2YpE21bcUy
         7wv9hV5AxDSSqLmhiqB9Xx8GWcvct6FtTsGvBUnfqDwwxR+y3FdQoBGjVZZrwZXQdbYj
         s1uQ==
X-Gm-Message-State: AOAM532duHzzRTYjyJv2thofLarectoBhCmF+XBVQPE+sQZoS7tKHy7s
        3YVF4Yery/8rER9RoXV5CA==
X-Google-Smtp-Source: ABdhPJykT+41Z6DfMtlkhmJ5RvUlPYF7shfy1TJ/uBCpIrEFYK0Zw0lJg5MCgYGSrBkx0cXVV56/fg==
X-Received: by 2002:a6b:440d:: with SMTP id r13mr1200583ioa.114.1594846916417;
        Wed, 15 Jul 2020 14:01:56 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h11sm1602621ilh.69.2020.07.15.14.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 14:01:55 -0700 (PDT)
Received: (nullmailer pid 809889 invoked by uid 1000);
        Wed, 15 Jul 2020 21:01:54 -0000
Date:   Wed, 15 Jul 2020 15:01:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Brian Norris <computersforpeace@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.or>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom: add drive-open-drain to
 ipq4019
Message-ID: <20200715210154.GA809835@bogus>
References: <20200703080646.23233-1-computersforpeace@gmail.com>
 <20200703080646.23233-2-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703080646.23233-2-computersforpeace@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 03 Jul 2020 01:06:46 -0700, Brian Norris wrote:
> We've added drive-open-drain support, so note it in the DT binding.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
