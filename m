Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C651EC33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:44:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F18B20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578501843;
	bh=RVT7twLfMyS3jcLdPqz5xO1Wdld6N3U9wRYxpVpc2qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=F4jx1ILQRN/vdaq/XSw7MxVWaQ/JiYUR2RXjyXSa3ZnZMdIeEILtRIZE11oLjYZVp
	 I8yF0M+rrS+DSveU2qfD4qQNHZfr/qoYfac7KHNImB6N01yj2LWpgQIsZd3rt+nyTN
	 CAQywI8tuuUn1Pr+O8Dhy96YwvnTeDWJnCK/GBaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgAHQoB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:44:01 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37785 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgAHQoB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:44:01 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so4200245otn.4
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7YudrN+HcdAitESoUxkwkQAilxZS2k+YB5rlrRgMBQ0=;
        b=Ch9nEN+SZf4lgCXmlhqLboM4JpCl3Y0ifn5unBqzLc2uazfah4yAI2g3mRtS5hIWs7
         vg5N7uhkZmNmTAsgIBv6/eFg/knbTq0obs4NxAF7TV+f35EiBpKd/f5WbbJH80TGRFBC
         TfDrzHyoVQFo4VLN99YZOjMeUyOU6RErj64p6OiEzvvFO6MCd6J9HFYEE1sAzYfQrYaC
         F/3bDHYDe3n9UwQDFgLt7bgecD00F3z3DeLgzEB93dEiuOib4ZtZYKR4pcM8OmVdiOnR
         BhHG6BAoyCo2niq5E08JJQlnFfatml2+5nlzQI7WJYei3EZZciZfdU1hyk+koaa0ATEO
         t6tQ==
X-Gm-Message-State: APjAAAW6pGc0qKIS28Cp3u77WVNzJg9SQKoxRe3H/c1/uxlalsr+bQ1s
        pVwBtyi3HzxB7glleGXLQm18hI8=
X-Google-Smtp-Source: APXvYqzPHNwXvZxOCBJUPpUXAKQsPd9t1UUZyFuKL5brY/X5Mv3QUmXx3/Hvt8lJuTou6HzIi8Sjqw==
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr4448224otr.305.1578501839412;
        Wed, 08 Jan 2020 08:43:59 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r63sm1218066oib.56.2020.01.08.08.43.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:43:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:43:57 -0600
Date:   Wed, 8 Jan 2020 10:43:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: phy: Fix compile warning about
 of_mdiobus_child_is_phy
Message-ID: <20200108164357.GA17209@bogus>
References: <1577442659-12134-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1577442659-12134-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 27, 2019 at 06:30:59PM +0800, Tiezhu Yang wrote:
> Fix the following compile warning when CONFIG_OF_MDIO is not set:
> 
>   CC      drivers/net/phy/mdio_bus.o
> In file included from drivers/net/phy/mdio_bus.c:23:0:
> ./include/linux/of_mdio.h:58:13: warning: ‘of_mdiobus_child_is_phy’ defined but not used [-Wunused-function]
>  static bool of_mdiobus_child_is_phy(struct device_node *child)
>              ^
> 
> Fixes: 0aa4d016c043 ("of: mdio: export of_mdiobus_child_is_phy")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  include/linux/of_mdio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

A similar patch was already applied.

Rob
