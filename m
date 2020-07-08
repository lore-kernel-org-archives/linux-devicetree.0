Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D48C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 22:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 047A1206F6
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 22:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgGHWm3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 18:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgGHWmH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 18:42:07 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720C9C08C5CE;
        Wed,  8 Jul 2020 15:42:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 268451277ED6F;
        Wed,  8 Jul 2020 15:42:02 -0700 (PDT)
Date:   Wed, 08 Jul 2020 15:42:01 -0700 (PDT)
Message-Id: <20200708.154201.1555490900589438795.davem@davemloft.net>
To:     festevam@gmail.com
Cc:     dmurphy@ti.com, robh+dt@kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: dp83867: Fix the type of
 device
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200708212422.7599-1-festevam@gmail.com>
References: <20200708212422.7599-1-festevam@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 08 Jul 2020 15:42:02 -0700 (PDT)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  8 Jul 2020 18:24:21 -0300

> DP83867 is an Ethernet PHY, not a charger, so fix the documentation
> accordingly.
> 
> Fixes: 74ac28f16486 ("dt-bindings: dp83867: Convert DP83867 to yaml")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied.
