Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F0BC33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CECBE20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578516869;
	bh=Cfb9Uzn9xY4OAixivbNqg1oIOhfzgcr0f5sZItaRd60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=k7FzUHICmFrxmvLzq4bXqPw3W23hlpQ2QogBTGH/Z7hdfoLleAaeRa2Z8CTbxJOhD
	 WBHXkgwTYMBPYerMEkpiRdmfSutSQE8UrU7LwQwe3E3qjBNQhA1RBLvzTttZQ8G9L6
	 c99mCDGfeBtNmKcrNCVw/Sd3UhAnkCgN8Ypp/D9k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbgAHUyX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:54:23 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37326 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbgAHUyX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:54:23 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so4976967otn.4
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=irwHBzNJL11iS3DIpsshB1iOiTtfFrxmr67ljB2o42w=;
        b=RvxbMknusHO4tg0vxOZP0/oJl6mhPccMw5GHggjSdK/q0nf0q0ptYDP6dguZhEWYhd
         zUOB1sn01kWr/9vW2M/UolxM+I7wV5t2sBqY7jBz1vYx9x6bo7O/khxYLLR7RWHpWrh7
         GQsZDIMbimImHTZPakr3e18odY9i4eYpvdTHuLU7lDBTktwp53ohepzAZD6u6wtPO913
         ex+eGkur4OcFX7EgVXrEkDBIF7Fv9viNOkuLrEKBx6/M8sKVjYzKR6xOiqfq5olqX0om
         EEMz27YfKWH5aZAxk0OMN+HbMd1asX30LtWyiw2GaSVKwRuzskH8oejau7FImsarklym
         IiEw==
X-Gm-Message-State: APjAAAXnIE34i1guZssjzwBFoVbMtdgWasHhay+a+Y/IKZTWg94UxD94
        mFjBYWFvQ1JitC7/JbaWVcFY4/Q=
X-Google-Smtp-Source: APXvYqylUekhNBuRsxQAUJK95JHQj89usO0AoI9UE14nJJNsNl0Ug9CwVRoQeB4sZeScgpNL4zmBSw==
X-Received: by 2002:a9d:6045:: with SMTP id v5mr5335000otj.252.1578516862270;
        Wed, 08 Jan 2020 12:54:22 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v4sm1552605otf.7.2020.01.08.12.54.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:54:21 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:54:19 -0600
Date:   Wed, 8 Jan 2020 14:54:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linus.walleij@linaro.org, Khouloud Touil <ktouil@baylibre.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: at24: make wp-gpios a reference to
 the property defined by nvmem
Message-ID: <20200108205419.GA16184@bogus>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-4-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107092922.18408-4-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue,  7 Jan 2020 10:29:20 +0100, Khouloud Touil wrote:
> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
> 
> Making wp-gpios a reference to the property defined by nvmem.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
