Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112BFC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 13:49:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D49D121739
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 13:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UH5EmQ8x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCBNtZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 08:49:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33679 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgCBNtZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 08:49:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id a25so2597359wmm.0
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=pDQHChPAvHbaHiAh1rx2hc7lXXqfrv2AqyVIgjj3sL4=;
        b=UH5EmQ8xNHA0Plu/McRn1qzyUYWuxXbSKQ2Os9L0yoktOYu7tCx3sdJI7YWZDxYoHd
         +YL3OEUKvM/W7hKB41X+4FFEjSxBJAVk5gdh5ny/LUcvZAIIrr1B3WQhGeUbo8nhyhjJ
         YErz9cLbumJ9EU8Q1wTQxX1Bo4aRM5DcDqFGnmdskcTtTl60EykI71bjpWhvL433KI6k
         1zp5xmHgz0vxdOb2LAhL2niLWDwbVPa+UYR0WaVrxCd+4X1KV0gISqCbaTXsch8ZTvpP
         2pSH5mZIJxey3CFXFP6hifTlnIokOwzOBrOrJD7jVSHNogev7ThF6WI4H0vnNCqvkDfL
         J1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=pDQHChPAvHbaHiAh1rx2hc7lXXqfrv2AqyVIgjj3sL4=;
        b=dqKk4yvFrFSEX4YstNnMpTyxG/FyGViSegrY0PUcd6kUYmXfFnRGUCVGDLNlnr7jT0
         7fHIwRmafW2StVjFgT9TwTUK7VAlcIbAR6rv1Omk9Er4eZ9i1PqsZuKsKpJ/Si1N5c5j
         d3cTGF59JEJvha40izG6omvYMWtqkd0VhOZH6WTqBZoDa0ul4JDeE3qtGhhcyvasHzD9
         xw4oq2tKed/WJUAwtKrU8F9M6tumzCpY4C8t4G9mGxPJWhVxUAuzXMvSODxxZAEwpspw
         9BIa3gh+BVCpWIzJdlF03rcRXr0XWjrt6u3LWaGIhs1KzIAlzKNeCUjObsZUUSIChaEY
         clfA==
X-Gm-Message-State: ANhLgQ3jrnPORuRkF3nxC7vfQ4oZ/ySx/EJ6dXeEJy1ImfgmQbYWdxeT
        u4n2+h86nCyVWsi+zBeG4X9K1g==
X-Google-Smtp-Source: ADFU+vvG6MBPGRkXYyxVAEaRWeNUehBlIcQSHO6fOGOEKIiRp511b6KjpX5fIWmrSFxV9Fue65UAYA==
X-Received: by 2002:a1c:2d88:: with SMTP id t130mr7393177wmt.68.1583156963877;
        Mon, 02 Mar 2020 05:49:23 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10sm16163783wml.18.2020.03.02.05.49.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 05:49:23 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-g12b: fix N2/VIM3 audio card model names
In-Reply-To: <1583135051-95529-1-git-send-email-christianshewitt@gmail.com>
References: <1583135051-95529-1-git-send-email-christianshewitt@gmail.com>
Date:   Mon, 02 Mar 2020 14:49:22 +0100
Message-ID: <7h8skisw7x.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> This is largely cosmetic, but Odroid N2 and Khadas VIM3 are G12B devices so
> correct the card model names to reflect this.
>
> Fixes: aa7d5873bf6e ("arm64: dts: meson-g12b-odroid-n2: add sound card")
> Fixes: c6d29c66e582 ("arm64: dts: meson-g12b-khadas-vim3: add initial device-tree")

nit: no blank lines between Fixes tags and others (cf

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Queued for v5.7,

Thanks for the cleanup,

Kevin
