Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DDEC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 15:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E9D5205C9
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 15:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfdrhxvL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfLPP25 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 10:28:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35445 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbfLPP24 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 10:28:56 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so7789917wro.2
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 07:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fAdhkG2e5jez4uCUP2cd8gWid6BcZh3e46uIq4uaFno=;
        b=dfdrhxvLs+qkSYfGV25KfTDTG9pOec+MCOCWCfVxsU9Lt2vVQgPyPSq4L+q19dA3cs
         /zqvASvK3n6Yu/cGiqhjKtFNVAtwflGUm4DK45R7rClCFgidL85k5SZzx5mkvHUPGKGM
         CM1s+tVvZoVEP4aueikXRru3RO4gbq0arI7CWneBF4JfWcXtaK8vdDTZbcxXq/sfkhz9
         V/pwJhdpsO+IJLegguMC/Lk9RhWmUKNKPWS14PV3ENMVkk31ftHIqmuZOwd/tcapC+LG
         zqaMkh5NfDLFviy8pDMVehVN9zuw1yNqX1Rs7hEcbuH9FBz6Kz62im1BTZc3WOLhgdOz
         JipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fAdhkG2e5jez4uCUP2cd8gWid6BcZh3e46uIq4uaFno=;
        b=KR63WIX7OmNjYQCF0/AMq7+l8Zoxk3+lCFMNrWj6X4gCP254IgqeOPLfF7VkA9FUXf
         HC2vBCXpmDGlZEXuLHA/zKE7wDYg8HUIfUs3D8bXPwpgt3C9D2r6pQ4pirpxE7JIGk1m
         nHSiL+o7hbLkBllw6LXclPngm0vtXXxMc3WNfNHZ/ufLiriTUIDlAEkZnDB5Jduow1eP
         KZzJbHF7/HeztZL+HRUNg2mQjtmJh/iDdmD+S5Df58wLivCozizCwlpJAuEYVizxz97w
         4Nn4GmomFrsR2gA8cIqAgup0ZDlLcXoyN7bdq76uFxBzh4e1SqABcWih+Nvzf/1qjl9e
         eZaw==
X-Gm-Message-State: APjAAAVcOxXjaCkV5EoGMLuYyRUvhHrxiNWCw4gcmO+Zb6Eyo7D2rPN3
        Oda206nWx4JF8xkMuJkbCNtlCA==
X-Google-Smtp-Source: APXvYqz8QkLm1tBQdJ5TBnQi20sHKdJO2QnHprE3jkORnRm65QppibHKCSyO8Izjl2dcJjeKoRAuSA==
X-Received: by 2002:adf:81e3:: with SMTP id 90mr30636842wra.23.1576510134854;
        Mon, 16 Dec 2019 07:28:54 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id 4sm20980480wmg.22.2019.12.16.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 07:28:54 -0800 (PST)
Date:   Mon, 16 Dec 2019 15:28:53 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 3/5] mfd: rn5t618: add RTC related registers
Message-ID: <20191216152853.GJ2369@dell>
References: <20191211215409.32764-1-andreas@kemnade.info>
 <20191211215409.32764-4-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211215409.32764-4-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 11 Dec 2019, Andreas Kemnade wrote:

> Defines for some RTC related registers were missing, also
> they were not included in the volatile register list
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> 
>  drivers/mfd/rn5t618.c       |  2 ++
>  include/linux/mfd/rn5t618.h | 11 +++++++++++
>  2 files changed, 13 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
