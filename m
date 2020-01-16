Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD50C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 16:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A233D2077C
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 16:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qdQEY1n8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgAPQMC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 11:12:02 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53519 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgAPQL7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 11:11:59 -0500
Received: by mail-wm1-f67.google.com with SMTP id m24so4343030wmc.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 08:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wq116TZAe0p40heVVDfMLRBuWEj6xKtwx1Np2GXHzlk=;
        b=qdQEY1n8v+dLZaHvHfDyqgC04UQvFEYkL0iVEjWLFmsSkU3RdqM+lv6eJPlKsfZZJo
         V2U5I8ZZfySoMK28rBSpL6Qi9hZ1hBksNdUKrrlpCgVLxMi5EXSi5jSaVoIKprkgosd5
         tsDC/ZoH/IOGHUHa5cOqrpght5pR8sZ8tAU7KkBzmrV/NVIcLC4BYWkLn3qFk7vMY0dG
         3cUuGjOTM7lrJfGCwT9DuQ2es9Hy/CCF+RThAtg047ML104Uh1CTu5cc9rYcPLtsT3GC
         B/ZdafPWXHclyQ++k9xdn+0fxAl7T0KV1vSnNRH8BNknm6iXsf0sfW0O3mzquuFtLaDf
         naeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wq116TZAe0p40heVVDfMLRBuWEj6xKtwx1Np2GXHzlk=;
        b=BvAXzuy/zX1T08i/g5jB7rrFWMP1q9diYsJSzFxBg+rAs8DR+IdzMbY+b3weL0ZeRh
         X4Z4pMlC7Rug5ocy958RTQ548p5fsRxPxQ9iS/5B8yOep88LId7oMmJa+yR6djFXas7F
         GUjftWRvyftG0zh1jJmj1kbosRMAlPXSvdSYapOhe4PnOSBEBJB3cC6/CCVZhVivtxTS
         GQx5Dr+3dUoQwTIOZC3kfc7vtnPLN6qNodMr28DsWH7BxxzVpgLAtmmyBtt2AuWfkKMm
         DWh2ri42aLJX1tElj2bnMa+8MHOs1mSOHHSoNLicQkjt9aH5MYUUDQZ413zzkmPqEkYQ
         VWAQ==
X-Gm-Message-State: APjAAAUb1LMKgpw5oY0l10gmc2Z5Z1Irlg9U7ij5x3rX+50jP1vdh5CL
        D9RJ/tZTaXAqLTykFmItKzZphQ==
X-Google-Smtp-Source: APXvYqxia/hYDamKXklRlZ4uVwwfWKaRzmR3+FORgkBCwOjEeD6jP03Gwc0fSu+Qsj8bDjor8a5sTA==
X-Received: by 2002:a1c:a982:: with SMTP id s124mr6705085wme.132.1579191117317;
        Thu, 16 Jan 2020 08:11:57 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id i5sm30424978wrv.34.2020.01.16.08.11.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 08:11:55 -0800 (PST)
Subject: Re: [PATCH V2 3/7] dt-bindings: imx-ocotp: Add i.MX8MP compatible
To:     Anson Huang <Anson.Huang@nxp.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, vkoul@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        ulf.hansson@linaro.org, broonie@kernel.org,
        manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com,
        rjones@gateworks.com, marcel.ziswiler@toradex.com,
        sebastien.szymanski@armadeus.com, aisheng.dong@nxp.com,
        richard.hu@technexion.com, angus@akkea.ca, cosmin.stoica@nxp.com,
        l.stach@pengutronix.de, rabeeh@solid-run.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     Linux-imx@nxp.com
References: <1578893602-14395-1-git-send-email-Anson.Huang@nxp.com>
 <1578893602-14395-3-git-send-email-Anson.Huang@nxp.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c2c3d925-a69a-d7f8-a58a-5f4abe46960b@linaro.org>
Date:   Thu, 16 Jan 2020 16:11:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1578893602-14395-3-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 13/01/2020 05:33, Anson Huang wrote:
> Add compatible and description for i.MX8MP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied Thanks,

--srini
