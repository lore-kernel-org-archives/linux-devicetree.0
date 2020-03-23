Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698C6C4332B
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 12:18:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D71020789
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 12:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HSUd4vdQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgCWMSk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 08:18:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39182 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgCWMSk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 08:18:40 -0400
Received: by mail-ed1-f65.google.com with SMTP id a43so15931462edf.6
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOuNnZgzyqcm8GFQy/Cs3MTKU0ONrbIzdq5zmi+oP6k=;
        b=HSUd4vdQOWkpZOlavXsGiTaSMf+lCfYpsCdFJSbN9eAuxw2kaPfwFbxExOUNmiJINM
         qb51YiC/4XO/9TFlK2gh3latsgjR8hoxSztzkUbqvez1Aadg52NkenrzRj0pCZ7iMDMO
         EePCTMvP8wdYeSdRSSGskUq0p1GfyStpyBmqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOuNnZgzyqcm8GFQy/Cs3MTKU0ONrbIzdq5zmi+oP6k=;
        b=AZRhuiLqSLFWIGl58p5srhgeSKJL2Ya+NGmCFtw98HLqOtZDeTHF/ZIm2Gs7eURU4N
         OFQQI1Hj6KbGOTA1lQjZ8KKS9ROA2CXeV3tg9VkLSQ0K3b8k/X+Vm3e5v7+5KdogrbOn
         wvcjsc/4aVPdiKiLmBn23SO8OIdt6288v78scQgNWHvWHnq2m/I6h6iDssU5fP1+4Xet
         5dPPNMC1h37fgf8ZP2GaHgtM5LNA4cWW6glH79AR8PBX8Hva84MJ1rD2WVGMw8gWDkyL
         WbL0cIEO9MKh08zQIRC8azX+M+Wc93BCsCVdSvizmOYvLBVLz8qVAE1lS9WmCGGcVC5P
         u/Jg==
X-Gm-Message-State: ANhLgQ2BbK763DGBxUUg1MEVdhowtQHo/jySrLssvo5Weghzg8gHMJk/
        J2X9hc2KvWwRPtLE+L8YcpTBLh04v3E=
X-Google-Smtp-Source: ADFU+vsANJCX/y95X41kOnV/UQWVr0fNshsEsdlzNDL2cLSoSHKvXZd8Vb2x5u8eEWfDtIroFd0iWw==
X-Received: by 2002:a17:906:361a:: with SMTP id q26mr9808462ejb.310.1584965918058;
        Mon, 23 Mar 2020 05:18:38 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id h2sm1074826edt.44.2020.03.23.05.18.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 05:18:36 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id d1so14546719wmb.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 05:18:35 -0700 (PDT)
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr1797828wmc.55.1584965915045;
 Mon, 23 Mar 2020 05:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
 <20200306034946.11223-2-bibby.hsieh@mediatek.com> <20200322130710.GA1091@ninjato>
In-Reply-To: <20200322130710.GA1091@ninjato>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 23 Mar 2020 13:18:22 +0100
X-Gmail-Original-Message-ID: <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
Message-ID: <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
Subject: Re: [PATCH v12 1/2] dt-binding: i2c: add bus-supply property
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 22, 2020 at 2:07 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi,
>
> thanks for the patches!
>
> I have a high level question about them, first.
>
> > +- bus-supply
> > +     phandle to the regulator that provides power to i2c.
>
> I think this is not clear enough. I assume it means the regulator for
> driving SCL/SDA? In the coverletter you mention also an EEPROM. In your
> case, this is driven by the same regulator? I am skeptical we can
> abstract it like this because I2C devices could be driven by various
> regulators in the system, so there couldn't be one "bus regulator". The
> regulator for the EEPROM should be described in the EEPROM node. So,
> this "bus supply" is only for driving SCL/SDA?

In our case the bus-supply regulator drives the voltage rail to which
SCL/SDA are pulled up and there is an EEPROM on the bus, powered by
yet another rail. There is also another slave on the bus which uses
the same regulator as the bus-supply for its own power.

In other words, bus-supply only ensures that SCL and SDA are in a
usable state. Other consumers need to refer to the regulator in their
own supplies if they need it for their own power.

Does this answer your questions?

Best regards,
Tomasz
