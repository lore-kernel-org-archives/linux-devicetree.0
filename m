Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B71BC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 22:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 401E520656
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 22:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgHXWhl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 18:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgHXWhl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 18:37:41 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABBFC061574;
        Mon, 24 Aug 2020 15:37:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 7777312909FB2;
        Mon, 24 Aug 2020 15:20:53 -0700 (PDT)
Date:   Mon, 24 Aug 2020 15:37:38 -0700 (PDT)
Message-Id: <20200824.153738.1423061044322742575.davem@davemloft.net>
To:     helmut.grohne@intenta.de
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, woojung.huh@microchip.com,
        UNGLinuxDriver@microchip.com, andrew@lunn.ch,
        vivien.didelot@gmail.com, f.fainelli@gmail.com, kuba@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [RESEND PATCH] net: dsa: microchip: look for phy-mode in port
 nodes
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200820060331.GA23489@laureti-dev>
References: <20200716100743.GA3275@laureti-dev>
        <20200820060331.GA23489@laureti-dev>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 24 Aug 2020 15:20:53 -0700 (PDT)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Helmut Grohne <helmut.grohne@intenta.de>
Date: Thu, 20 Aug 2020 08:03:33 +0200

> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
> index 8d53b12d40a8..d96b7ab6bb15 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
> @@ -389,6 +389,8 @@ int ksz_switch_register(struct ksz_device *dev,
>  {
>  	phy_interface_t interface;
>  	int ret;
> +	struct device_node *port;
> +	unsigned int port_num;
>  
>  	if (dev->pdata)
>  		dev->chip_id = dev->pdata->chip_id;

Please preserve the reverse christmas tree ordering of local variables here.
