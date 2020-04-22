Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A340C5518B
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 18:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44C0320706
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 18:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgDVSnw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 14:43:52 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:38078 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgDVSnr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 14:43:47 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 7D3ED120ED563;
        Wed, 22 Apr 2020 11:43:46 -0700 (PDT)
Date:   Wed, 22 Apr 2020 11:43:45 -0700 (PDT)
Message-Id: <20200422.114345.1554399485217894854.davem@davemloft.net>
To:     f.fainelli@gmail.com
Cc:     netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] dt-bindings: net: mdio.yaml fixes
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200420180723.27936-1-f.fainelli@gmail.com>
References: <20200420180723.27936-1-f.fainelli@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 22 Apr 2020 11:43:46 -0700 (PDT)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 20 Apr 2020 11:07:20 -0700

> This patch series documents some common MDIO devices properties such as
> resets (and delays) and broken-turn-around. The second patch also
> rephrases some descriptions to be more general towards MDIO devices and
> not specific towards Ethernet PHYs.
> 
> Changes in v3:
> 
> - corrected wording of 'broken-turn-around' in ethernet-phy.yaml and
>   mdio.yaml, add Andrew's R-b tag to patch #3

Series applied, thanks Florian.
