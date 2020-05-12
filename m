Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60671C54E4A
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 13:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333CA206CC
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 13:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikt+LOB0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELNHM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 09:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725923AbgELNHM (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 09:07:12 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0E7C061A0E
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 06:07:11 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id s9so10508270lfp.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SYjGwEqwJi4TpJx+ELjK3LcgOeRjatzjbSESVJciwRM=;
        b=ikt+LOB0DjgrTfnRpL4B2H5QWFHR2SH8zrWJJEuOs3OvpZJ5CtIyIqyhDIkxgVAzPT
         hR6y7D+ifa6SEIa2dpKznZ6SkxtuSwXCqnIkxPbj7pfACVVvKx9MDjTCRoMhvcTgrUmj
         gCCuqfO4KhpygE+aCGaEUPI90nzxzmqTSz6ot7paRvhESEhZrtjHj+gfekmBZvjCasxC
         vQEA1SJfjCge0QUVukY7MFfSt8KOgZIAm35FryDwf7XS/95nXuKZqgdWUs9DE7i9ab1O
         Mpd+gXHEZKTHktPRVBD+xGi6bjW1tdcmWu7b44IQAP0sVz6650JxnFMIe7p0+tO6dhmk
         GciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SYjGwEqwJi4TpJx+ELjK3LcgOeRjatzjbSESVJciwRM=;
        b=iAasnjXr4YSqJ9HxlYNokn0qo4agJeJaoSTBpLxLDkNyTxKAXKWqzY461ooclfuEWO
         ZROtNT9TYW7mfq9PRMJ/I32ex5Kvzmb/iktBLggKMoXOmBl3P6sJSd772ogABCWV5/OY
         h97SYelN2I99VbdDMFzVefNEhXlMMo9Mk6DTo/2a9XsjRSn2GevgYeEDYA6yNZY0Gn+o
         IiJ/NKg4k2eSHQHrsw0oJrkp39+0WRaHXTSSIL1gjNq4rSh0kpHh9X7CMRf26HWHW1kR
         FgVwnQqVonMIQx8TARso2WmdWSS93H8b4D4LTCn5Li3Mi/0Ui+di2x+9CTpSUg33HWuu
         C0zQ==
X-Gm-Message-State: AOAM530M+wE1miXFGndHOfimtvBznWicxplWAOD+fZgBE8IKsvkVwuz4
        TOpfKWFkc0PzR+MyAahBczZ4578r/a5xRET7h6LbzA==
X-Google-Smtp-Source: ABdhPJx7a9QY2omkKlC/zH0ZVmVYVJmI9DQqmgoG//tzBF2K3jVYW0SFtjof8OK67Ca+0O0KBL6AoUAH3Zy6ftjdu6M=
X-Received: by 2002:ac2:5e70:: with SMTP id a16mr14689641lfr.77.1589288830292;
 Tue, 12 May 2020 06:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200504154757.17519-1-ckeepax@opensource.cirrus.com> <20200504154757.17519-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20200504154757.17519-3-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 15:06:59 +0200
Message-ID: <CACRpkdYSzdUgZgA6jtdP3K9bWTF=-whkQCr=bKkr_Z0VXywdkA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: lochnagar: Move binding over to dtschema
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 4, 2020 at 5:48 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Changes since v1:
>  - Moved sub-node into MFD file leaving just the properties in here
>  - Removed contains on the compatible
>  - Added a required -pins suffix for pinmux/ctrl nodes
>  - Added some extra blank lines for readability

Backed out v1 since I see there is some discussion on these still (sorry for
missing this).

I'll hold this off until there is consensus.

Yours,
Linus Walleij
