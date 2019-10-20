Return-Path: <SRS0=9JgI=YN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28940CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 22:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F17C721928
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 22:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="kbHe5Ovb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfJTWFw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 20 Oct 2019 18:05:52 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43879 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfJTWFw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 20 Oct 2019 18:05:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so11194897ljj.10
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 15:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iUMa5QoMRlHLJqsynLbu/hpJbEC1VIDyLoIQW8s0r9s=;
        b=kbHe5OvbVNtkyq6JSWrrjlbEhmXrUq4zaQBlBOFRjwyxCKK6ARW14hoWM8SarEtNcs
         nRkkwzk/t7Q+wuaUSS9x0v8yg0EhCn6kBH6D4bZ09iXTpEYtHFB3SpGv/nkG71StkcJz
         2O9GbUsV6cZ66kN+Otifgq7EsguR/X2+dnAtV8C2zATib0+qicD4jjqr0BlRYbTrcgYw
         nF9R4Mq2J2KTr9h+/KTGTCG8IW+FoeAwI8eF4eU31xrRWMxlKcDpCvdSc2+R8s0+45Ez
         KWqIB82pkZjvvVsmgN+I24bHZkrqMq1fV206A5UK2Atc/wimC8opCYf9J0Sko3Zo+LmY
         vZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iUMa5QoMRlHLJqsynLbu/hpJbEC1VIDyLoIQW8s0r9s=;
        b=Ynm0S5VEyTTWWk1KlliET5xWvHf3VwnfORoipQtRaHOrk+wg1dDNwDUg1pmjpEUND2
         Kos0aSuGDr7e0VHiK/M1RbSuHzRwTD17fGr+ZRvFkutnY2dAWvJWoAG+LLwFIvATc4aF
         kI8L73apC0ARutRVeje0z8L/MtjPSUgjVQkfAW3MwmTTVgCHc55AJn6MnW0yODpyv1h+
         Rt5QoN714azrrtMVCzpxa6UTGmKHRyYLez91zIhVEAGOfgcJF8F4ShCVy0L2FT/BJq53
         NGLRffecdLN4np6N878iCzUCijlGyJeGzxjNd9HScw+QSeb23X+1T31WWqdhn80/8ARg
         YrqQ==
X-Gm-Message-State: APjAAAVqYRVUtnjEzB5OwsCvCGRrRGaWvkydsCKk3bTfPFy1pt0f4hPn
        7XCCm8PJIgqxq5XNFI23Qjg7rw==
X-Google-Smtp-Source: APXvYqxPyuMIupeV/16Itd+J1ki2mprFeli1CjiyppU2YJniKudicVPAQI8wojvxnpK5GeVvGJnNmw==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr8423266ljk.215.1571609149787;
        Sun, 20 Oct 2019 15:05:49 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id i11sm6465930ljb.74.2019.10.20.15.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 15:05:48 -0700 (PDT)
Date:   Mon, 21 Oct 2019 00:05:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/4] Add VIN/CSI-2 support
Message-ID: <20191020220548.GG13372@bigcity.dyn.berto.se>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Biju,

Thanks for your work.

On 2019-10-15 11:57:54 +0100, Biju Das wrote:
> This patch series add VIN/CSI-2 driver support for RZ/G2N SoC.

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Biju Das (4):
>   media: dt-bindings: rcar-vin: Add R8A774B1 support
>   media: dt-bindings: rcar-csi2: Add R8A774B1 support
>   media: rcar-vin: Enable support for R8A774B1
>   media: rcar-csi2: Enable support for R8A774B1
> 
>  Documentation/devicetree/bindings/media/renesas,csi2.txt | 1 +
>  Documentation/devicetree/bindings/media/renesas,vin.txt  | 1 +
>  drivers/media/platform/rcar-vin/rcar-core.c              | 4 ++++
>  drivers/media/platform/rcar-vin/rcar-csi2.c              | 4 ++++
>  4 files changed, 10 insertions(+)
> 
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
