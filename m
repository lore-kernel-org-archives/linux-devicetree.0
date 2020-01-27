Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA87CC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 757A3214D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tronnes.org header.i=@tronnes.org header.b="lBKJCDDe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgA0M47 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 07:56:59 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:35437 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgA0M47 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 07:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZeWR7CViWqnb4CaNMh0vmQplC3X3FUBRb5wLNRMeFFM=; b=lBKJCDDe+mS+si88xuE0CIQgMK
        kMydrvnbUN8i7RU8PMmZMUDds5G3S8T0dAoKqwiHAg4EZ7o39YJacoZdapwZXDJ8Z9qbhMrLGZHFS
        PzWODq0CeTbcTS1Ka6uf2QcHMKS2QRdjgDmjAeAfJApuiwgLdMeGgy+FGELvvOBxzbmOMBIKO/4Z6
        WTYFwWjpoVeVvB43UsgLadCeoY6+dnamOQzLIx7p0qynygGAPYeMwHcDsEWGk3x8MUP/8JNzAE3wu
        6c4hBnS193p4EBp94u6ZyRBluLY5m0g9HYx7s/8yNu1aaqJ3bPskiRiq+6aGpogOr5egSZdAc6LBN
        CzoUxieA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62157 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1iw3wn-0001AP-8J; Mon, 27 Jan 2020 13:56:57 +0100
Subject: Re: [PATCH] dt-bindings: add vendor prefix for OzzMaker and Waveshare
 Electronics
To:     Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org
References: <1580059653-11320-1-git-send-email-kamlesh.gurudasani@gmail.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8318aa0e-e744-f51f-678e-3f5bbf0eac21@tronnes.org>
Date:   Mon, 27 Jan 2020 13:56:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580059653-11320-1-git-send-email-kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



Den 26.01.2020 18.27, skrev Kamlesh Gurudasani:
> Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
> Both are display manufacturers
> 
> [1] https://ozzmaker.com/about/
> [2] https://www.waveshare.com/contact_us
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---

I see I wasn't very clear when I said that this should be a separate
patch. I meant that prefixes shouldn't be part of the bindings patch,
but a separate prefixes patch and still part of the series.
Not a big deal, but it looks like you have to respin this, there's an
automatic check that failed:
https://patchwork.ozlabs.org/patch/1229397/

Noralf.

>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ac4804d..dfb926d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -721,6 +721,8 @@ patternProperties:
>      description: OmniVision Technologies
>    "^oxsemi,.*":
>      description: Oxford Semiconductor, Ltd.
> +  "^ozzmaker,.*":
> +    description: OzzMaker
>    "^panasonic,.*":
>      description: Panasonic Corporation
>    "^parade,.*":
> @@ -1038,6 +1040,8 @@ patternProperties:
>      description: Vision Optical Technology Co., Ltd.
>    "^vxt,.*":
>      description: VXT Ltd
> +  "^waveshare,.*":
> +    description: Waveshare Electronics
>    "^wd,.*":
>      description: Western Digital Corp.
>    "^wetek,.*":
> 
