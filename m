Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A74C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 09:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B85F20B80
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 09:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="1Cdnlxqy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbgE1Jge (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 05:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgE1Jge (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 05:36:34 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70E5C05BD1E
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 02:36:33 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k5so32494568lji.11
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cGBjK9dCqo4dJlRsAbsmYEmaf4ENvwE2PZqmvJJX8M4=;
        b=1CdnlxqyvBU7dZGaclXOqtXkchUtcx8j+YdkbFP1SpxOQD5+Z0QjNkcog7a7zJAM+X
         6F29RiX4ZfqJqyZ7ODDujaG2SZXMgdQOnoflxf3LY0JLitj8xzT9BrIEyY8ErizM+fnQ
         Vv5WFtvy/m/JBBS53FZaYgyxdFH8d3wLyOKB3wLIxvsZhkuteura0/Gkr5KP1bUMMQCT
         gIfvBvs7cw8YtHFb13TS3sWxZO1S3aDSuNe+xTAqdhT5QM2CX8IsIS1khWRe6zCm+Hss
         IEZx3K4VTofvQYeehMCaAd8Zl4lPgwvV0jYFHwJ0UqxZrqln4l59TSyBp7S7BTBp4rMw
         MGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cGBjK9dCqo4dJlRsAbsmYEmaf4ENvwE2PZqmvJJX8M4=;
        b=FicsDo7w21pTGXSqMZffsDRQM/URFFQdgJ2zu7e9sJ1K8iOtoA2QhRi3LTU6VA5On1
         dKhAt7onBUwh/H3o6eu522NMQEpiRy8TveMU81lBtmkVuqgyhckrFfeSYa6R2IdGJHBH
         L2G3jwixd7v66FZ3lGTZaY2jwXLN2UjJ1uxzmsuvXElARJ+3zMGOLDL8QOqndH+b2yKZ
         tGJiKxjnSdRuevXJ++ZkQnBJOT8ETti5JA5PPKSitqdJ1bFriGMoIqX6loNcgh4XM7Jv
         Bd5hbC5azpwAi5u/AK/eMe/BpX2OvsbEz/iyMD3GjZj7PP5fwxpt9BUhen+8FYI4QxFi
         rQUg==
X-Gm-Message-State: AOAM531BHJCMbSH/iL/As1+Pq+SP+NPJTpn9SUjyxa2uHlsyDKWeszxD
        9Hc6bND+uQBr5NN8AFQr5x0ayA==
X-Google-Smtp-Source: ABdhPJxLh5yqRSdwkZzVilW71YX+8M+avD1C0OgSooGK0fXIccgCzTlLZmQDYcG+oevjO0jEnJ1Ecw==
X-Received: by 2002:a2e:a171:: with SMTP id u17mr1102613ljl.225.1590658592283;
        Thu, 28 May 2020 02:36:32 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:49a:1ab0:1dad:577d:c46b:c479? ([2a00:1fa0:49a:1ab0:1dad:577d:c46b:c479])
        by smtp.gmail.com with ESMTPSA id s2sm1335424ljs.39.2020.05.28.02.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 02:36:31 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0 and
 XHCI
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <1590611013-26029-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590611013-26029-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ecd8d191-6e52-ebae-facb-c4a211dcb1ef@cogentembedded.com>
Date:   Thu, 28 May 2020 12:36:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1590611013-26029-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 27.05.2020 23:23, Lad Prabhakar wrote:

> Enable support for HSUB, USB2.0 and xhci on iWave RZ/G1H carrier board.

    HSUSB, xHCI.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
[...]

MBR, Sergei
