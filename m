Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDEAC43215
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 17:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 994BE2070E
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 17:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eBH4zUyt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbfKNRSh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 12:18:37 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:43480 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfKNRSg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 12:18:36 -0500
Received: by mail-io1-f67.google.com with SMTP id r2so2521239iot.10
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7reOlZqp6iwOkryxtYw5chswKvS9lLb7R9DbAzTcdk=;
        b=eBH4zUytcqB2NJQGehzzUs2Rd8EkW1/vxYlqC2L1UhI9UXREEztWk4LW3tOac5cCul
         VkgqPmE8y3rgdKmYdRu2B+ZExAu1qQI0a7dfWcrG3T6FDR2B1jWFizO5cJKEGw6SwRCF
         8gbh/Iapie7nE1gbggHz9xRcC1TibRz8Bkyb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7reOlZqp6iwOkryxtYw5chswKvS9lLb7R9DbAzTcdk=;
        b=JmAYH0YCGy15MTnu/rv83aSJa4Uk6/Ksf3khRUrBJZLhW4uFUnC3+QCf0iTl6lRl3b
         dTpgACvH0dZ5rqmxwcoTV0kY5V41WgfgYJRUDSMoGOHGViRdY3p8Ny/Ru/+RGT/vc72e
         B2d3nQLNLIbhIOXEd53Ywk2qnGOxoBhZSvQPui8k/GMjK/6i3omv/pjQ1d67PP0u0Yfa
         MHoii24V5YsScIeHpkRoXZdc6tUHFVWS7d5vJl/QFYYRqFQGmtPr3FstjDpistCprJTR
         kA57VcRbBgu7ZNIPtAFgQfWv9qKuTQsovL8f4djpPoPF36PbkLijdxitJuz5AdlyD4XI
         r7XA==
X-Gm-Message-State: APjAAAXeDaSaiBiwamFHVqgoPRP+EHCEvyhjilE69vvJDn3/w6Jh1QIf
        wCn3ypywXIkJnsN2shibD7iyKTUxTzs=
X-Google-Smtp-Source: APXvYqzRLt/pS32EZ+Lej3qJYYseERX0xtH1t/G4d2P1zqqzLPbriti1bt0te68pMnFPz4GczT5RaQ==
X-Received: by 2002:a02:ad14:: with SMTP id s20mr9143576jan.132.1573751914298;
        Thu, 14 Nov 2019 09:18:34 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id w2sm907244ilg.51.2019.11.14.09.18.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 09:18:33 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id s3so7674429ioe.3
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 09:18:33 -0800 (PST)
X-Received: by 2002:a6b:a0c:: with SMTP id z12mr124697ioi.142.1573751912819;
 Thu, 14 Nov 2019 09:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20191112004700.185304-1-abhishekpandit@chromium.org> <3639233.d3cbfcQTlM@phil>
In-Reply-To: <3639233.d3cbfcQTlM@phil>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Nov 2019 09:18:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vkto_n2sBSJSvDhoA3scdeW+OROP4geyUrhjnvn6meMQ@mail.gmail.com>
Message-ID: <CAD=FV=Vkto_n2sBSJSvDhoA3scdeW+OROP4geyUrhjnvn6meMQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rockchip: Add brcm bluetooth for rk3288-veyron
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-bluetooth@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Nov 14, 2019 at 5:45 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi,
>
> Am Dienstag, 12. November 2019, 01:47:00 CET schrieb Abhishek Pandit-Subedi:
> > This enables the Broadcom uart bluetooth driver on uart0 and gives it
> > ownership of its gpios. In order to use this, you must enable the
> > following kconfig options:
> > - CONFIG_BT_HCIUART_BCM
> > - CONFIG_SERIAL_DEV
> >
> > This is applicable to rk3288-veyron series boards that use the bcm43540
> > wifi+bt chips.
> >
> > As part of this change, also refactor the pinctrl across the various
> > boards. All the boards using broadcom bluetooth shouldn't touch the
> > bt_dev_wake pin.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> looks good to me
> @dianders: does this look ok to you too?

Yes, but it's not ready to land yet.  Specifically the bindings are
still being discussed [1].  Abhishek: you should probably add
information about the fact that the bindings need to land first to
your Commit-notes.  When the bindings land I'm happy to add my
Reviewed-by.

For history, +Matthias and I both did an early review of this [2].
Compared to that version the only diffs here (other than merge
conflicts) are:

-               pcm-parameters          = [01 02 00 01 01 00 00 00 00 00];

+
+               brcm,bt-sco-routing     = [01];
+               brcm,pcm-interface-rate = [02];
+               brcm,pcm-sync-mode      = [01];
+               brcm,pcm-clock-mode     = [01];


> Just to confirm, I guess mickey and brain do not have the suspend_l pin
> settings? [They only seem to get the default pinctrl state but not the
> sleep state in @pinctrl]

The suspend_l pin just goes to the EC and lets the EC know that we're
in suspend.  I know for sure mickey has no EC.  I'd believe the same
to be true of brain, though perhaps you and +Alexandru are the only
two people with working brains?  I know I don't have one, as can be
evidenced by some of the stupid things I do.  :-P  I would also note
that this CL doesn't change whether or not mickey/brain control
suspend_l.  They used to inherit from 'rk3288-veyron.dtsi' which
didn't define it.

[1] https://lore.kernel.org/r/20191112230944.48716-5-abhishekpandit@chromium.org
[2] https://crrev.com/c/1772261

-Doug
