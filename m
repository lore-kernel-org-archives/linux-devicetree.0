Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA621C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 02:34:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1B972084C
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 02:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590633263;
	bh=VBKcSKNLlQ8RiOtEKHbKXSRJbJPLXtQjN9GNVE+ZUjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=h02CkwLJJIRMyGpX/EDKaSonpVaBVkAHEuLUCQ8zODuYisZ8xBJnOnMTPnhRRldoU
	 UthRDF7pLENmgbpF0/j7RplyQoke2CxV8z/8wdCCn28mxNwPZEEhKrNA//nLbIVTtA
	 Mnl7ws/llwSwrixlHmYIRPuGmpTa2HC4rcvS7t54=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgE1CeU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 22:34:20 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40091 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbgE1CeS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 22:34:18 -0400
Received: by mail-io1-f66.google.com with SMTP id q8so26970188iow.7;
        Wed, 27 May 2020 19:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kqF76bpS0hFEAXdkTHSZ3YXr22hZc22+rys0SA3QMPk=;
        b=T9WAATMNqvzJUDs71ZUJE6jHXjuVhiHnawrL5xbD7/THVxD/lxTYqYrjfNHQPeeNdq
         Wzlw8J+Wmu42Egpv+qyOLu3Tv3GAJEGfxWuB2Ghb2qmBZBU7tTqGnGhE98tDu7Srxu3q
         lDZARY/q8BuBJRztxrYjZkLS22eTHY3EPxqEsh2mZHnUt1zw72lRqIX98OBQx+E3SD+q
         eSRBH7YjLjPU2i6qx3DPgogsLI6npj5FtuBtNyKmNysKigZ8tLeUbspeKsTpXYz+lKtE
         bR7TeLlzK1HOgumnrZlAxqyjDxlD7PpnamaMDBqqRpVGhZPFJPjx9TF+81oZkiZVRRuT
         9IaQ==
X-Gm-Message-State: AOAM532fZ2bBFTJKT8JGNH3zQr40TCaIljwql1m2EZhMw0EYv/Sdw+Xw
        ZeDGBVrv8gdgnLC1RQkb/BpYZYs=
X-Google-Smtp-Source: ABdhPJzF++cIcTDH0TOkYkCFPm5c2j8QHiBDHdUfgKNUuUgtAY/Z7RRWm7F8UYPlEkwmgEQHVbZuww==
X-Received: by 2002:a6b:7017:: with SMTP id l23mr718088ioc.140.1590633256643;
        Wed, 27 May 2020 19:34:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y12sm2669938ilk.16.2020.05.27.19.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 19:34:16 -0700 (PDT)
Received: (nullmailer pid 3250304 invoked by uid 1000);
        Thu, 28 May 2020 02:34:14 -0000
Date:   Wed, 27 May 2020 20:34:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     robh+dt@kernel.org, alexandre.torgue@st.com,
        gregkh@linuxfoundation.org, mcoquelin.stm32@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 14/15] dt-bindings: pinctrl: stm32: Add missing
 interrupts property
Message-ID: <20200528023414.GA3250195@bogus>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
 <20200513145935.22493-15-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513145935.22493-15-benjamin.gaignard@st.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 13 May 2020 16:59:34 +0200, Benjamin Gaignard wrote:
> Driver use interrupt-parent field so update the bindings to allow it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
