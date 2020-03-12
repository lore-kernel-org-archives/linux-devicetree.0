Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8995DC1975A
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64E2C2071B
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVlRH3u5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgCLKqE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 06:46:04 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36646 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLKqE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 06:46:04 -0400
Received: by mail-vs1-f65.google.com with SMTP id n6so3361437vsc.3
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N5Ico3C325Jzu9GMlkuRSJ6WG8mBeI+uKqt4Ftv2/+E=;
        b=CVlRH3u5pxFhJo7LphUB6sCSb5/JtxxkvrApzEyOf8KUqKqlnoom9WTV491prc1koN
         CK7FhZCokP5SAn70UhOFimOihssB2VkgsjbMlZW9aNRYQN9hQn10LW92gITMTTkwn6or
         9erlg489gPljGfK4AOIcJDvUFWSKyTwWBljFMlzLlBvL0IQuHwnpTRESRgWMxnw2GXv8
         CrhpaiIRf1d4hJ+Fq4C5EPNVpuSuvN7dP6oIWI1Gyic+5FfO4TbOJez8MZ3szLJPUFFa
         h4mupStGIWHsDWXMVmK8zV2VRV/7afnqQJPDFmUc8J65+xeJmOkPKvumXx34CTPcR4DM
         3NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N5Ico3C325Jzu9GMlkuRSJ6WG8mBeI+uKqt4Ftv2/+E=;
        b=ZjrCPYFj6iQxKGNShDbg9aQ3tARcPqxrIDAEmUUzsr5JTh3t8SG2d8Yw/BivoFOxnJ
         ewO6zJHnnh7I1xgxPyDkv8iSAqpKFaBD5TE938ruRuiUkbzpUH/Ied6zos6JhedNZsKy
         c0c7yN2TzgjdN1kJLfcAyeZm7x/GqPjZmc8j5DA96AW//YNfUYpXLy7HZF+ki6DhwUzJ
         iVYbHnXkWiGR9chmmWycbmmbdoKM/Lj3//mPUodqwjI1hAo33vtUY+mg8IAGDD4PTi4S
         cCSk7tiDJkiOXAOlL2ZXG14yhMMm1jdNvs+SBlpFm7Q/4O+BstRXPxX6XIkuycJdHQHU
         b2+A==
X-Gm-Message-State: ANhLgQ2ep2pRuHJMfOPbjEkKCHDahH+LCtp2BAU7JPW1A7Tv+5M271w/
        mZTTEz/Ix4vbZw8T+G0pLdp70Nr6OK6IoXoLYsgbibFw6WY=
X-Google-Smtp-Source: ADFU+vsgyuIiYgrQcK5GqD6i8p5v5NrSmSlYOaVuy0jz1OpUXHvnWHmyBVSNun22jeADPYYRX9B+IOGkpHggETCQUeE=
X-Received: by 2002:a67:7f04:: with SMTP id a4mr4891507vsd.57.1584009963273;
 Thu, 12 Mar 2020 03:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200308214230.15193-1-j.neuschaefer@gmx.net>
In-Reply-To: <20200308214230.15193-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 11:45:52 +0100
Message-ID: <CACRpkdZuSvojs6i9QTsL4xUd4Xd_YYiuZBBptMYQCwLSUgJ7Ww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: at91: Fix a typo ("descibe")
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 8, 2020 at 10:42 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied with Ludovic's ACK.

Yours,
Linus Walleij
