Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC64C32767
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:33:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B818521835
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578098028;
	bh=jk0Jim+TF2ug1BP0E8YWaOqX2toviYeuYE1BM3Zl7Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=h9Iqt32HAjaWyHaCLUcjjTHMcJehu0XHnZvp8nuSU/+6yO2kKLap9HZ0R8I+hlmDL
	 ywFkuIa3JvdzpynAvLxAqfRJ/h3dabitt8d2PpYa1UZjnBo5rhta8Y6K56tfbOODbK
	 Isgs7vzMQnyI8ShGm5lvKnaV/fPJNTe+zMphUtOg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgADAds (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:33:48 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:35443 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbgADAdp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:33:45 -0500
Received: by mail-io1-f68.google.com with SMTP id v18so43145554iol.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2jtU2GwA92LWxQFkeCrbjyJNc+9eRgZ+rt7rVVu7gPA=;
        b=Y0vOQ/1zt2mpJrzdp4h2U5EOAoZDVP9u8shojKGPof/FoCMh4CJcs+6pDKA9qoD5Ga
         nTmDQZ9kxjJfOd3ZV5TFgG4Mc//94nkPmWkxUtYb3eiTmIROrPPS8ijv2u/bwRX2Gwwk
         vQ045LCS+WpNSpB0whDgrOyv2fmrL0DD1o415l4lI0J0beUF+13fAJQ4QBZEVMd6NEJI
         Tezpl75AlX51JOXb/+iz56Ev/Q5CqPkxBAtyNKLF6A/cPJi0dKaRvimELh5tnYdkkVs/
         5RggxG/XkM188xTvbiB192ub0j8LKJzIJWr2tq3MMX9oVNZ9Y8/S1UH2FPUwoR00AcKB
         7lBA==
X-Gm-Message-State: APjAAAX15pTzHF/8GxhYuqrN7bpoZYvJfoIIxAGfjys16ze6Xy9gwL8a
        x1/FZMclgZKJ5giPRnDmZ4GDUOk=
X-Google-Smtp-Source: APXvYqx4wGCCbD+XzNWSIa+CV5MdgnxF+cX+8P88HEZNunmmtv/9Jo+oEtAXupkj9hJEzUpHmIDlLw==
X-Received: by 2002:a6b:ec08:: with SMTP id c8mr36736412ioh.257.1578098024192;
        Fri, 03 Jan 2020 16:33:44 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z81sm20426674ilc.17.2020.01.03.16.33.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:33:43 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a53
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:33:41 -0700
Date:   Fri, 3 Jan 2020 17:33:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/16] dt-binding: usb: ci-hdrc-usb2: Document NVIDIA
 Tegra support
Message-ID: <20200104003341.GA5889@bogus>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228203358.23490-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 28 Dec 2019 23:33:43 +0300, Dmitry Osipenko wrote:
> NVIDIA Tegra SoCs use ChipIdea silicon IP for the USB controllers.
> 
> Acked-by: Peter Chen <peter.chen@nxp.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
