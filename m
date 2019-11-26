Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B23C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 01:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C05B2071E
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 01:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZsjGN9G3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfKZBW1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 20:22:27 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:34654 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfKZBW1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 20:22:27 -0500
Received: by mail-pg1-f173.google.com with SMTP id z188so8119759pgb.1
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 17:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=AtPRMYJsiWkwHiFFHZwBcUcKfK6FWEVPRzt0kULjoMk=;
        b=ZsjGN9G3y6QPq/SuMUBdQdPjWMaaqGTsg369cIOxGzFWf76C6KhXoa28fC3PDPNsv+
         7QWs10eF6lz9is8be53GzoigIeoomf7xOruNp1Y/bJBePCpSOXYLOA4H2/KJ77cRhk05
         x0KvyJoRGbdZ9bbhy/XpP674iOcUGGYfS/H2W20tUStvBWi2ytsJmsFm0cuVxx0LrVhE
         fJVgEsvqgV4FirojN5oa+BaOcKBvYRvapbjhDDbYa7cJEo8dtqNlxLA6y+V/jXxspakD
         Spg4rGfGWHPFYnszQbpNq8GQ03LpilTeTOS2V8qw2dZ1gjduJRffPZoij6u5G0iQYIDa
         y3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=AtPRMYJsiWkwHiFFHZwBcUcKfK6FWEVPRzt0kULjoMk=;
        b=gSpILkkRTdq8SAudLNOjA+mvtzf6FlIcj6IRiu7KU4fUb9k1Ddunog227ywjsCcaXW
         vj27BIGFgGrgwcd1iNI6JnZwM82mCDeSeOWMW3cWp+dV14TDDjR35L/Fx72I6z8vk4n7
         AT5ypvcGtc3D6oGPDSwyY9tv9tZAz2WNsuBY0WKjL+TdXA80+ZOFeszJFubOLOU15KEX
         lUfGZqjQPSMy/2DmkKjBmK3UF5LqAdpNA1l8TGLD3xHK5ZEDTIayz/If/XrYXpCzj5PO
         hkVxOFcfiHN70Uyeu6mINA6ndhSNsALhyB2LFVHfc8vEFu6bRe3Y6YW12L52GANOtLyU
         i6Vw==
X-Gm-Message-State: APjAAAWwOmZHMxXCrQs63odLPdqOAtHmVuT9wN5mhJZMAmEa7oQcW3TD
        VRkR6oNPfpcYHVJpzI0VMRL4Kg==
X-Google-Smtp-Source: APXvYqzCduZpVjmTaqiZExnNw3OMBfwJqTBjnW12KeeSXsvhWXRVkr9xrQzORP/oWCYG2oNVoKbw8g==
X-Received: by 2002:a63:6a47:: with SMTP id f68mr35998951pgc.35.1574731346647;
        Mon, 25 Nov 2019 17:22:26 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r15sm9985094pfh.81.2019.11.25.17.22.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 17:22:25 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Cc:     jianxin.pan@amlogic.com, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        lnykww@gmail.com, yinxin_1989@aliyun.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: Amlogic 32-bit Meson SoC SDHC MMC controller driver
In-Reply-To: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
References: <20191117142716.154764-1-martin.blumenstingl@googlemail.com>
Date:   Mon, 25 Nov 2019 17:22:25 -0800
Message-ID: <7htv6rh1ny.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Martin,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> this is the first non-RFC version of the driver for the Amlogic "SDHC"
> MMC controller found on Meson6, Meson8, Meson8b and Meson8m2 SoCs.

This will need to be reviewed/merged by the MMC maintainers, but to get
some broader testing (including in KernelCI) I've added this series to
the 'testing' branch of my tree so it will be included in my 'integ'
branch.

Kevin
