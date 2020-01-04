Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E69C32767
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6F3E20866
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578096057;
	bh=Hwu+QnSdIVdx0UuxPRoPNhfoaYKuuFW50yLkebINuMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=b8Z1HVcTWCGUY9cQv0gVynSFqHhJIKah6IugEms9MrovlLQNdbpuSPJfmFlB+2VKY
	 D9Gn/zAJ/mEV0B22pP1r3gO3Ztt39BwUBEVQHfg8Yry1uf2ansss2/oIQmJjWDFJOy
	 I7WzbV2upr4exQwyp0wXo3uyy70afsBhSGjijde0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgADAAz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:00:55 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:40189 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgADAAz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:00:55 -0500
Received: by mail-il1-f196.google.com with SMTP id c4so37998114ilo.7
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xmFf6L8ePvGKyOz/wpH8wXZ5AKBsBj34hi1vb6ky2dA=;
        b=iyvgIquWZIqfi9ZU+mWPEyP07rDJ6pl/XMM/28S2AXJLAX6+iI4jnbVFyqsToUGElM
         c1/89vEEIpgK5wyFy7ylRgznSvGIUBUql/kpOIg3ZCH5iIctWLfvbPZVr+yid93tBEJp
         156PWSolzfT387fwVhT6Q88I5emOznItg7mYs7QMR7BORR+4zHKW3Ihpw7UHNldC2PRi
         HtDrhpoT5PeD3VAioGOvHqp3dP/3hCb6iph/xlAPu7VWXFfxF1y4zfg/80M0a9hZsCOR
         PlK6fWyNw4oQLkfjEDAf1KkS9bRgzLGKJ3R2SCFBiY1Qg381UZ70G44XUkOUhCxDIeF6
         sfZQ==
X-Gm-Message-State: APjAAAXLpk3zNaPDFQTGtniYBOshUFaySqoHolsZoEjlR0jy2bMJqYNF
        aNPwzTGPHMt6l6kOkmrx8pQrJcY=
X-Google-Smtp-Source: APXvYqyJc4O6s+w8EgMh+yGIw7Tolw5lv98/o/p3H38EPvEAi5G1OvMIPhl7nTmPZ0+CP+m9fd/RIw==
X-Received: by 2002:a92:4616:: with SMTP id t22mr76056095ila.186.1578096054109;
        Fri, 03 Jan 2020 16:00:54 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r18sm21685990ilo.3.2020.01.03.16.00.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:00:53 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:00:52 -0700
Date:   Fri, 3 Jan 2020 17:00:52 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v3 12/12] dt-bindings: media: venus: delete old binding
 document
Message-ID: <20200104000052.GA17596@bogus>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
 <20191223113311.20602-13-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223113311.20602-13-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 23 Dec 2019 13:33:11 +0200, Stanimir Varbanov wrote:
> After transitioning to YAML DT schema we don't need this old-style
> document.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,venus.txt  | 120 ------------------
>  1 file changed, 120 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
