Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFDEC47257
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 05:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 973712145D
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 05:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=leon-nu.20150623.gappssmtp.com header.i=@leon-nu.20150623.gappssmtp.com header.b="NtQ9lrEB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgEGFzw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 01:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgEGFzv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 01:55:51 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF6FC061A41
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 22:55:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h4so4957985wmb.4
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=leon-nu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oH3LjbuNvDT9L8S5Sf69u824MeEV5cEtswBnzJfZKgg=;
        b=NtQ9lrEB0RKmvJcKiFzKnz9QfMiUbEXXjSe/p7wlkumIjpn8oRgUaELn6nJE6+2mwu
         eXq4XStBUlPFpoP7TZhinRFDLHkIVkcxHvIXhU/OEMPZK2iLNXl++NcXynu44/BVTlIn
         rVh6p9N05KTDa9Q8ype8NNg2HnUWiPAd3wP3AzpbjjlhbKDy3Xx6bX2MASwUnDq/e9sH
         NpPRGLQdiSfRxfqGDpqARRojvEVXdkbhH8c4G/uNC+4VE+5mkWr1oASrxa68BA9bhq1D
         Ks+uYM4F4sB7PlGSmjPu//nwU8Pla6FjKmc/oxCpG6pwK81I+kxqrhid3dpNLpAPvwsk
         VLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oH3LjbuNvDT9L8S5Sf69u824MeEV5cEtswBnzJfZKgg=;
        b=Oo/xRFgM5eIYGZvAp9yxvxXOJXeEvDevcbyi2RyYLrGGvuPo+TVqi4hVNdTzN5Qmsg
         a912HE3I+7wOIPW7bJ7uzPn7jxG9gnVHKYuvqTwQPF3Ci/Poe/8V2KNUSteAarSYsZiZ
         DNWkoqjYqyUO7lQJJ64njykAtTRwVOXZKaGVhXU54v6/VF6FgphExgcJlRZJgFPO/tVS
         gQT5suvVcIdbQGs3PNNBdkNWlE8I2JXkxxUI1IPzl2lsJeM5aBfVALPeXLYd29u5CVQs
         lzar5Gr5VVONBYHkkBsAB/JDY2Vc9qNNxv3o7ve4lHcdIJ53/9A/pEKdAWO3Ts6Ig/dt
         oTjA==
X-Gm-Message-State: AGi0PuYO9WDnNQEK9lJkTqH73Adujj4ujrxVk5cjE+xmLPabri1hAcor
        bJ5Ro9iqdwcAY97MiwhqyXH9xA==
X-Google-Smtp-Source: APiQypK8a3UU8ELR11PAnuJfpnQYv+HCtC1y98AmPp3kCtHlJNWMr93w7mzfA1WmRqve6h0Pe9LTrg==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr8648512wmj.170.1588830950010;
        Wed, 06 May 2020 22:55:50 -0700 (PDT)
Received: from localhost ([2a00:a040:183:2d::a43])
        by smtp.gmail.com with ESMTPSA id i129sm6614225wmi.20.2020.05.06.22.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 22:55:49 -0700 (PDT)
Date:   Thu, 7 May 2020 08:55:47 +0300
From:   Leon Romanovsky <leon@leon.nu>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-netdev <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
Message-ID: <20200507055547.GB78674@unreal>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
 <CALq1K=Lu0hv9UCgxgrwCVoOe9L7A4sgBEM=RW2d9JkizHmdBPQ@mail.gmail.com>
 <20200506122329.0a6b2ac4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506122329.0a6b2ac4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 06, 2020 at 12:23:29PM -0700, Jakub Kicinski wrote:
> On Wed, 6 May 2020 22:16:11 +0300 Leon Romanovsky wrote:
> > > +#define MTK_MAC_DRVNAME                                "mtk_eth_mac"
> > > +#define MTK_MAC_VERSION                                "1.0"
> >
> > Please don't add driver version to new driver.
>
> It has already been pointed out. Please trim your replies.

Off-topic.

Is there any simple way to trim replies semi-automatically in VIM?

Right now, I'm doing it manually, but maybe there is some better
way to do it.

Thanks
