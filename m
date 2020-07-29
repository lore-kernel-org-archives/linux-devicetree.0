Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6D1C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 17:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35E482075F
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 17:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2RCz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 13:02:55 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:45451 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RCz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 13:02:55 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BH0Gj51jbz1qt3c;
        Wed, 29 Jul 2020 19:02:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BH0Gj3Df5z1qy6F;
        Wed, 29 Jul 2020 19:02:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id LgZHLijsyOCh; Wed, 29 Jul 2020 19:02:52 +0200 (CEST)
X-Auth-Info: fKZrZcAxHZDYoakWPIeNcOgfsboODDj4+uh2OA5bxto=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 29 Jul 2020 19:02:52 +0200 (CEST)
Subject: Re: [PATCH V2 2/2] drm/bridge: tc358762: Add basic driver for Toshiba
 TC358762 DSI-to-DPI bridge
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20200729164554.114735-1-marex@denx.de>
 <20200729164554.114735-2-marex@denx.de>
 <20200729165604.GA1372716@ravnborg.org>
From:   Marek Vasut <marex@denx.de>
Message-ID: <3f9702f1-062e-a43c-3297-eb5baacaa81c@denx.de>
Date:   Wed, 29 Jul 2020 19:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729165604.GA1372716@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 7/29/20 6:56 PM, Sam Ravnborg wrote:
[...]
>> +static int tc358762_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct tc358762 *ctx;
>> +	int ret;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	mipi_dsi_set_drvdata(dsi, ctx);
> I cannot see why this is needed. If not used then delete it.
> With the above addressed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Let me know if I shall apply - but we have to wait until binding is
> reviewed. And preferably one extra set of eyes on this driver.

[...]

>> +static int tc358762_remove(struct mipi_dsi_device *dsi)
>> +{
>> +	struct tc358762 *ctx = mipi_dsi_get_drvdata(dsi);
>> +
>> +	mipi_dsi_detach(dsi);
>> +	drm_bridge_remove(&ctx->bridge);

Because it's used here in the remove callback.

[...]
