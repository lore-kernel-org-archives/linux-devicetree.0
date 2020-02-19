Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40B3C3524E
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 21:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAAF824671
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 21:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582148314;
	bh=McV5z3AOKh1DYVx9b2DiQokkQOrYW4AqY96xfMyVuK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kfdImMMNZDJCLXGBV4AzHCWmtrwq5xR16FplDSNauwIfyQR39vXC/5rC+HHog3ZrR
	 ttc0lJxa8UzVar4uTYiDP7oI6RERpoRcn/IorzMUOuLsp7agVHWwH+mKUTTsDmEDBS
	 BVyehoEn4zZFEYfHPlj2t3P44W1ctf1zUoL7TXWU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBSVid (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 16:38:33 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44191 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgBSVid (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 16:38:33 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so25322710oia.11
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 13:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E/e/t/Igu2jhBduZSv2AW4CMedwV0BIQbWhMahuclRw=;
        b=sS8JpPpVUyOkGyfNfgk6OchHTBnpLjj5530G5JqhOQSdHjKkeKzcuW1gW8Qpe9P7ED
         b/nmionByaDqabv74wivzKMp+wznol62oze9vUQdrncpQq9f7yYF5RE9uaAffizHS/B0
         z+3inQ1ywzPzIIky7Sp0Cfg8F8VqLLJEVG3s5Osn7RY+drZM0N+EuM1WLeMITwSlaKFW
         XGrn5Hfr+88lmw5k8S4AR+FzAwR4QppKK3AEV8yJMPBaSCwLbMQgYT6eEGxKawiTxpjf
         ajOBve5gLKaLjRLDL/YLbWfJv8WDdIHgQ/JpD3yD3jAWqTknxSUonHsKCIeu7AntbOOC
         Lkow==
X-Gm-Message-State: APjAAAU/NPrgkbq3lHMzwkWEI+teBXabSxeZAQsmZb7rugHbGp68Jj7C
        Y0be+Fy9mPe5AEVYj48LFw==
X-Google-Smtp-Source: APXvYqzXRQu0rzVdzwAvjm3VOQxfppCool33P+2clSM/5tqQ9a4Gt59ZBgfIOhaxSQcWmeEQr5REYA==
X-Received: by 2002:a54:4791:: with SMTP id o17mr5704299oic.70.1582148312171;
        Wed, 19 Feb 2020 13:38:32 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w72sm378347oie.49.2020.02.19.13.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 13:38:31 -0800 (PST)
Received: (nullmailer pid 15386 invoked by uid 1000);
        Wed, 19 Feb 2020 21:38:30 -0000
Date:   Wed, 19 Feb 2020 15:38:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, heiko@sntech.de,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        pgwipeout@gmail.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Make RK3328 codec GPIO explicit
Message-ID: <20200219213830.GA15330@bogus>
References: <cover.1581376744.git.robin.murphy@arm.com>
 <5f7a399dea8a9dedef57f6f99f0f6ab1c1fdc56a.1581376744.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f7a399dea8a9dedef57f6f99f0f6ab1c1fdc56a.1581376744.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 18 Feb 2020 21:31:58 +0000, Robin Murphy wrote:
> Existing RK3328 codec drivers have overloaded the GRF phandle to assume
> implicit control of the limited-function GPIO_MUTE pin, which is usually
> used to enable an external audio line driver IC. Since this pin has a
> proper binding of its own (see gpio/rockchip,rk3328-grf-gpio.txt), make
> a GPIO explicit in the codec binding too. This will help avoid ambiguity
> on boards that use that pin for some other purpose.
> 
> (and while touching the example, enforce the "don't include status" rule)
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: no change
> 
>  .../devicetree/bindings/sound/rockchip,rk3328-codec.txt    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
