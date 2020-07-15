Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD23C433E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 18:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C60C2064B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594836898;
	bh=joflnVGiXJ4aExyQB3LgOAW014p5lZYUpf40HZ9R/XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Gvem2YESBCRQUu3szuQ59mw3isCzLsGV6EvdywrTdPSEhbAnKrVDRkMf8vWL5jqjX
	 gewKDG1dADAB3H8/eXgM9UpGOtjf6v5eIV/Ni1DiaTnuzmo1VkfhCGTwLaN8qD3tmM
	 D9tkkmHwY+Hj2CbjqGslbMppq9AWdKKJ2nmqJxqs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgGOSO5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 14:14:57 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34239 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgGOSO5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 14:14:57 -0400
Received: by mail-io1-f65.google.com with SMTP id q74so3289336iod.1;
        Wed, 15 Jul 2020 11:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HioE1Ic2H4+VI2tlTAqjw+Vj/lfG0Xa5PuxbG5eEH+M=;
        b=mFDy/NmeAkg8ZZKoXaYxPrekVLVm8CEqfyjpYebMX44pkKuiYDwLKsYMcCcnvF8gOK
         gHR+xmuLzFDkXkB+n22xPsy15yqQ0ofU1HE7ir3UF4mnnJO8tNcM/I8EuucerHElyY9F
         xGSHfX2Jhh9mtzNp2ZGvZtbGvmPo6n9AgxFRBV/z2UtC3k3237xL+9I/GFH+cFlXyQtV
         OdMENZsQN3JE86jIwGy/79qi2rEzFWZKLH1KYqe4VkqQOFyCaZbUKwG99qJ1K3CcN43u
         r7tp+LMFyt3iVtocNsHUozS/XjmcykeqC780zU1GrQaajEnkN7VVSRIHM4jVOsza9cWk
         G2lw==
X-Gm-Message-State: AOAM533ECamY3nANRETjD5LMukfR5ctun0gb+4CRsv3YCGNl1yOEz3QM
        p5UpU8Ty1Uzrn1TL7hXQsg==
X-Google-Smtp-Source: ABdhPJx3Mb+knVZxjE8+EeyPfsJnbWOXBKCBVw6kJBCYlciHGHqTLkg+OPw9KN3IpL0XN8Ryd15o3g==
X-Received: by 2002:a6b:f012:: with SMTP id w18mr543374ioc.5.1594836896055;
        Wed, 15 Jul 2020 11:14:56 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k24sm1445391ilg.66.2020.07.15.11.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 11:14:55 -0700 (PDT)
Received: (nullmailer pid 549346 invoked by uid 1000);
        Wed, 15 Jul 2020 18:14:54 -0000
Date:   Wed, 15 Jul 2020 12:14:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Noralf Tronnes <noralf@tronnes.org>
Subject: Re: [PATCH 2/3] dt-bindings: add binding for Ilitek ili9488 based
 display panels
Message-ID: <20200715181454.GA549261@bogus>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
 <4fb29a638aac966a0a0413302aab30193c4fb395.1592055494.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fb29a638aac966a0a0413302aab30193c4fb395.1592055494.git.kamlesh.gurudasani@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 13 Jun 2020 19:37:03 +0530, Kamlesh Gurudasani wrote:
> This adds binding for ilitek,ili9488 based display panels
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  .../bindings/display/ilitek,ili9488.yaml           | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
