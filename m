Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F016FC32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:11:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1D6924650
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578172303;
	bh=KAzTx1HoWyH1hLxbp7zwKilyS2Wgf6R1NOwfHPWv/8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=oAyBCCSqtIaEG/rE4zQ/HIysCXHZNSCT/Y457AkhhTErFYzx19ZCibOs2DjWZwIm3
	 qt/5tK+aSpXRIntSm3/y1rjq/NZA0ExQAMJ39gqL7DZD0pP1Bi+nv+ltX28P4GnXlA
	 0mJ+731Kn/2uZQvYvLuJRsJIStP4EfR9VTz2gtfU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgADVLn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:11:43 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40643 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgADVLn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:11:43 -0500
Received: by mail-io1-f67.google.com with SMTP id x1so44727675iop.7
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2DHefjLQc6S51MdSwDdwJfZErHx2CFrIYRVhl6DWIYE=;
        b=DRhOzzEODRwjUtXCm+UAU6/oY1M5M5ItDcexcFAlSUpPytCvGFBvMMm0liXKKaxs/D
         0/vr6/Od4Moyu9VTPnu6LrDYuxAmMC3FAMHvZ1XwkYEgUxPQpWc4lPY0+MyeqWGRpYKA
         UUj4gWT7tVxuoTVuAu1hrm8Q763c2L26qVN7KVxHnM4Jp5Nr7Nwy1eJvjHkRSRyvUWmQ
         Pfop51DNaj92MQMOMnsTjZXkftT6xbfE5gjnCzappvovx5IcMwE/i68a0/MpGi+ZadPW
         IUZZAdmHMAiKGWJRx52+DkQWjuwqigggAYAdxC+8o+LOMFbjtd0hIRBXF6GdtC6QrJhQ
         nb+A==
X-Gm-Message-State: APjAAAXwCeDEFmiA3WjztZAtd3hJWhEWU/8QIxNTqR1HGKm0ySEy0saY
        /Br+g5f2ZHzMdb0qwps8tt0vSLA=
X-Google-Smtp-Source: APXvYqzBlBKIf+OtOib6RLJ3JZMQcL62+ZSwgMZNMgL24QBUWU078wXuc47+XuXEEhY3zx8o+FO1Wg==
X-Received: by 2002:a6b:c8c8:: with SMTP id y191mr64680669iof.104.1578172301855;
        Sat, 04 Jan 2020 13:11:41 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u64sm12001720ilc.78.2020.01.04.13.11.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:11:41 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:11:40 -0700
Date:   Sat, 4 Jan 2020 14:11:40 -0700
From:   Rob Herring <robh@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] dt: bindings: lm3692x: Add
 ti,brightness-mapping-exponential property
Message-ID: <20200104211140.GA20909@bogus>
References: <cover.1578134779.git.agx@sigxcpu.org>
 <7df957d4f7902a5d2a30695ab2a5de19eb7772d3.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7df957d4f7902a5d2a30695ab2a5de19eb7772d3.1578134779.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat,  4 Jan 2020 11:54:19 +0100, =?UTF-8?q?Guido=20G=C3=BCnther?= wrote:
> This allows to select exponential brightness mode instead of the default
> linear mode.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
