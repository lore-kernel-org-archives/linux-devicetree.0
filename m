Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA7CC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 11:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67DB920704
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 11:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E/m1+GsF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgAWL4l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 06:56:41 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36529 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWL4k (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 06:56:40 -0500
Received: by mail-qk1-f194.google.com with SMTP id c185so1673645qkf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 03:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F/2KPQtSzRotZCU3BsbyYy1dT+kOVxFeIJwpYbN73B8=;
        b=E/m1+GsFQspn4ij7nkTwwBzr6wXwTGgh7m96Zphb0PWWDNl3M56Kjg44CXJy9w4RPr
         uT1FWlRX6Z3wFFJkWIsXswVLyCOrWuyXi4r7+6c5Zum2iXYouF+c2Z7yxEHvqE6/gvsZ
         QkCFlzH05pHmytTKYHM+gPv1/ISo0KNyZxpfV8sxd+3d+lXWmbNQHxpAZzRVKQmvqa5s
         jTEfsBZ8eHLFdFccviv6HU/M8kh2cAcjrpvA2cHr2nFc4UZuG2jAVTzdYQNleJAR2Eh/
         ogLHPIRtYzLMjoV0jnmmFicEZaCKq32FEsrWSjgBBS8JFszWuwlhKo39MbL1dbygUuVB
         LybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F/2KPQtSzRotZCU3BsbyYy1dT+kOVxFeIJwpYbN73B8=;
        b=AgN0uP0iCq5NgCWblAV6HqD+BEfdxQ8DSy7j8A4MuSwZ3jhR0HnSoWHw0tFpwmOsVa
         LM6eEQIYpzOwOvWeFqvPly5l0jns+ZAxCMKE2bVsnvKYPDOMD6xIFHYC0y9M0QSkAAkk
         QL+e1pEJnr79aR/6VsVQPo7RfD3Vpzk18YbV8xtDGd0NBLcJw8zMEZL4F9N/DuBQ2zj5
         Dt69rWVC9ynW+eSar2jJxUkrtGKMwM/u0xIanXb0YNjRyNNZb2nkdWfAztD48sw/vOa4
         9eF+1HVW/2cETfgzSE+SvhHrb4G68g7qCpoXE1DVDv0VY5wXvwaJze+gWvkpLOFG7JVj
         bAuQ==
X-Gm-Message-State: APjAAAUcWCUpuD6Vrubm1Y++4omr7A45XI+64bOHuqpinxPvUo6aLGPo
        ukTrteOyjVkHAXKuCBH8fxGGuNx93XZ4JzRwTWibTg==
X-Google-Smtp-Source: APXvYqztJGL6tq3pImYUBMLNHZIzAMZ2hwl4thd2Gg1yP3KP0rJmmVe5XB5SW2veik39aCl3QCyPc0NbE/qCHlbYg1U=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr14812018qkc.21.1579780599771;
 Thu, 23 Jan 2020 03:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-4-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-4-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 23 Jan 2020 12:56:29 +0100
Message-ID: <CAMpxmJX=qh3oSgOtB6ciKG2tJW5VvYXEqw7ZWPM21_ynaXe++w@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

czw., 16 sty 2020 o 03:56 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> Although in the most platforms, the power of eeprom are alway
> on, some platforms disable the eeprom power in order to meet
> low power request. This patch add the pm_runtime ops to control
> power to support all platforms.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

Patch applied.

Bartosz
