Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D8CC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 22:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64F392071E
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 22:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NSH9ULh/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfLIW0B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 17:26:01 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34123 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbfLIW0A (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 17:26:00 -0500
Received: by mail-pf1-f193.google.com with SMTP id n13so7968948pff.1
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 14:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=e8vzmB2zQOVicf37JYB7f5dUsZ9PAEbPEnqlneCb8hk=;
        b=NSH9ULh/1hAOLuPMNPJfxklHlE41CsUwmWn/AlWHF+NXzPTPqa461LIDyAeuIK1ZkC
         jcvFyZM62M3TyE35p9IkhgrSTYl8uWlVlLUlyqR/zuwW4GTq75XDmk4xOazIivi0fjRQ
         HFStxYtDHWNEI+Hi/mOViXqpYWFULyktYYG0zvxkLbmQRhlWfpW8XO+VfQ0ml1j/lvz0
         OXmR1i8k6mKWWm8qHSSNqiiyPxT2sWUaaBZY7l5mRmphES0IKelAqESY+DkgQA28PRT1
         qvTzEDzU9U9VU7mP4ridDIou1QERo9IFl+safi1TbqdJMwfr07By6LDNeDRrT6sR0EIb
         PNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=e8vzmB2zQOVicf37JYB7f5dUsZ9PAEbPEnqlneCb8hk=;
        b=n8N0P88fWr/FTk29aeWS0N9w9o6eXvv2mysxMS2s7kNojjI3D6NgcSj6U/iDqu+kq0
         /2oZK0ywmW83agLjNSUwKC402ru3e3xLnAmuvIFaJzO60aHAe3KbAFMS754KvxcxZc2H
         yQj/ZBUyikNGZubiOqCb4RoJm50RXycME8QFfx/Kzh5x9+Z8FK/llgiXvQzMNVtYEjW7
         UsWNT72h7sa4kH8EGbp3v9vT7hnsJuj63VOcdUJSvDNAL7QKfqcVrgloo94fGDTbcKGq
         5MSMlR9f0FZVELwtYEq5HlY50YwTaT2uRC6YEy1oKFViyLoZAc6mBzTz7uEs7ynzQt5g
         /R9g==
X-Gm-Message-State: APjAAAV5ShSR2BTaTdNL3lthjuL5qXZKy0vWCJri3CoP1qg9YML0LcWR
        qy1fGEg350fzEXUbW6gFeD+ykw==
X-Google-Smtp-Source: APXvYqywvsTO2z1jHZUpDVc2D7xS1pwfKfSChZ6K2XJIA8v7tS/ZhIBV/gXtqeqzdKHsR1Wdvopmsg==
X-Received: by 2002:a62:3706:: with SMTP id e6mr32484589pfa.31.1575930358173;
        Mon, 09 Dec 2019 14:25:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id g22sm515509pgk.85.2019.12.09.14.25.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 14:25:57 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        p.zabel@pengutronix.de, linux-amlogic@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, narmstrong@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: reset: meson8b: fix duplicate reset IDs
In-Reply-To: <20191130185337.1757000-1-martin.blumenstingl@googlemail.com>
References: <20191130185337.1757000-1-martin.blumenstingl@googlemail.com>
Date:   Mon, 09 Dec 2019 14:25:57 -0800
Message-ID: <7h5ziprv9m.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> According to the public S805 datasheet the RESET2 register uses the
> following bits for the PIC_DC, PSC and NAND reset lines:
> - PIC_DC is at bit 3 (meaning: RESET_VD_RMEM + 3)
> - PSC is at bit 4 (meaning: RESET_VD_RMEM + 4)
> - NAND is at bit 5 (meaning: RESET_VD_RMEM + 4)
>
> Update the reset IDs of these three reset lines so they don't conflict
> with PIC_DC and map to the actual hardware reset lines.
>
> Fixes: 79795e20a184eb ("dt-bindings: reset: Add bindings for the Meson SoC Reset Controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued as a fix for v5.5-rc,

Thanks,

Kevin
