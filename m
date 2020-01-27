Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55C6C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 13:04:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E19B214D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 13:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tronnes.org header.i=@tronnes.org header.b="jSy4VuQ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgA0NEH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 08:04:07 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:55191 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgA0NEH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 08:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ebxf8Ake6E/PMxqisT9f7wglajK8biG5Xfp139wM2aw=; b=jSy4VuQ5DnL3Or2sra4fEuWK55
        xzjNeB3Hzts5PmdHsahAyWJkKCF1eo5OcuLUqXbEEAsF0R+e2GFTqhn6kZvlM4d7tsKIxmAe5CXFJ
        +W/sKDBTcff5uTctqUDLSBNvsfTxDK2iVKm5ca7QqUcmWoGq+t+wWKXnI53WuCxPPVc2wzAH2gApv
        7U1/eF/+V0jiU+E9AVWE9XJt8SjuhTQpN2N+KzBsyZXkJVjFIcY1LxiArNzVbwaBeN3vYIY2Xxibj
        DjOcAJ5wupAlEfFVBgd09OG3wjXkbrwRhLRXfnjgs0E8/75E2IibJmBDy/va1f/UFboclfu4Rlj+T
        uMre75Jg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62163 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iw43h-00057x-1i; Mon, 27 Jan 2020 14:04:05 +0100
Subject: Re: [PATCH v2 2/2] drm/tinydrm: add support for tft displays based on
 ilitek,ili9486
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
 <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580059987.git.kamlesh.gurudasani@gmail.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <54c01afa-f6c6-a367-ef69-0e37343f2a9e@tronnes.org>
Date:   Mon, 27 Jan 2020 14:04:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580059987.git.kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



Den 26.01.2020 18.42, skrev Kamlesh Gurudasani:
> This adds support fot ilitek,ili9486 based displays with shift register
> in front of controller.
> Ozzmaker,Piscreen and Waveshare,rpi-lcd-35 are such displays.
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

I'll apply the series when the binding is accepted.

Noralf.
