Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836EDC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 15:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55D1E20720
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 15:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tronnes.org header.i=@tronnes.org header.b="jmNKNB2j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgA0PNS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 10:13:18 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:54021 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgA0PNR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 10:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AvcaQHsGf9q8P8sr76j5zYnoRvlA6Weltg5yBROc9io=; b=jmNKNB2jUmpStk2+x6J2mw3h3z
        ifM19Ka74VaAik4/+Bm71A0xaC7h06D4VcvrdDd9HJzKc8/KsLaMV7ajTTQsViXBb3Juab5+vZ6LP
        y+tlRh+2GBofOMtOrQ56Jc7y0BmqyQCi2pi9tgIkS07ek3CC6a3+NWdgZoQUt8ubwVbJ6RM5EW1AZ
        MetEEI9wWbYDvgY3hWRcb59oX3rg0JeBKtcKLMpK3qV0sYOcax0mxX/Y+Uy45+pG9K+0yyg6VQ0JQ
        yvuYi0khvPgxi+ECTbmACGc3fjYonc5m0CCQEGDIPmSsltDv2iupDRXdqGXgFlWS0M/awPBwNT1ZV
        m2qQ1eEA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62464 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iw64h-0004LR-Ao; Mon, 27 Jan 2020 16:13:15 +0100
Subject: Re: [PATCH v4 3/3] drm/tinydrm: add support for tft displays based on
 ilitek,ili9486
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580134320.git.kamlesh.gurudasani@gmail.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <79733e99-2c47-05e2-dbe8-5116001f44b4@tronnes.org>
Date:   Mon, 27 Jan 2020 16:13:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580134320.git.kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



Den 27.01.2020 15.26, skrev Kamlesh Gurudasani:
> This adds support fot ilitek,ili9486 based displays with shift register
> in front of controller.
> Ozzmaker,Piscreen and Waveshare,rpi-lcd-35 are such displays.
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

When you resend it's important that you add any r-b's or ack's you've
already received. This prevents double work (some review a load of
patches and can't be expected to remember them all) and it helps the
maintainer getting confidence that the patch is solid when others have
looked at it.

No need to resend again just for this, but if you need another respin,
remember to add my r-b.

Noralf.
