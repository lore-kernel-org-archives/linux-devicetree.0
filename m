Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB61BC43215
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 17:29:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACA6B206CC
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 17:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iMlPJ+NJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKNR3r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 12:29:47 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41289 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKNR3q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 12:29:46 -0500
Received: by mail-io1-f68.google.com with SMTP id r144so7681306iod.8
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RftPJC/z3aKe9Z2EQoJhnzZgJpMcylstQtfS6pNT5zM=;
        b=iMlPJ+NJiZRBpDqEg1HSfcU3t5/w56CFqZq6rf17WXZtLre8hZjCjdf2fMoa0PRE9R
         /RbNAy4ORogOiWqA8tDWCzhZo1WcPdQi5GyBEhjRPBqylco9vrfdCSM0R0mvB4WpUKZQ
         EK8xlGCBJpsP+VtQqf6/0uzWYpwacWeZji/VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RftPJC/z3aKe9Z2EQoJhnzZgJpMcylstQtfS6pNT5zM=;
        b=cmfPCEJhGaQkJ2BlTHV6p15/lC1jqRwXL+qA6w4jEUPXutY/2Zb94+W612ncGX9qTQ
         GNDrziK2S5uh4lj/w35Qv2QXTUzA6x1og4zuWfd4RELFVDOaw7kpgju1TwvXz5rZ3JYD
         bJvK2hMWwd4IdkoBAUSXOJFjiI8UJqMm2DML4ocqOhLY0G5n6HNb3xEPmB0/NfGVRTwo
         i2EI2ubUfgCnE/okwA++m84OZj6/jc3BrnITy0+C3eHFL+hQNGkwei27ZKKVHs3itrmZ
         5+y8vjXea/Z3khGd95gnyiAE2+uDIUaqDuifB7eikRnZ1DVbdO8jBAC48HYAlPNLSFwd
         rU2A==
X-Gm-Message-State: APjAAAV7AsPEyKmbF8KQU5YEKAARHkeODUOaeQf4iN0naIl6qIqPlRRX
        QwjbWuITBBUbtyMso+bPljcJDS+BLhM=
X-Google-Smtp-Source: APXvYqxBpJxPFL5pQj692sFJa04URc5ZhnGAtKo6llyy9gDtRdKkYgcdb+XDzZ8Ozq6a/IqvdSiimQ==
X-Received: by 2002:a6b:9343:: with SMTP id v64mr8881206iod.247.1573752585556;
        Thu, 14 Nov 2019 09:29:45 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id p8sm294671ilp.24.2019.11.14.09.29.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 09:29:44 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id p6so7697378iod.7
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 09:29:44 -0800 (PST)
X-Received: by 2002:a02:a813:: with SMTP id f19mr8324725jaj.12.1573752583817;
 Thu, 14 Nov 2019 09:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20191112230944.48716-1-abhishekpandit@chromium.org> <20191112230944.48716-5-abhishekpandit@chromium.org>
In-Reply-To: <20191112230944.48716-5-abhishekpandit@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Nov 2019 09:29:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UfGDAtePrDmsEsdCNsHQZwDkU8z6E=qzSu=opht7evpQ@mail.gmail.com>
Message-ID: <CAD=FV=UfGDAtePrDmsEsdCNsHQZwDkU8z6E=qzSu=opht7evpQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: net: broadcom-bluetooth: Add pcm config
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-bluetooth@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Nov 12, 2019 at 3:10 PM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> Add documentation for pcm parameters.
>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> ---
>
> Changes in v4:
> - Fix incorrect function name in hci_bcm
>
> Changes in v3:
> - Change disallow baudrate setting to return -EBUSY if called before
>   ready. bcm_proto is no longer modified and is back to being const.
> - Changed btbcm_set_pcm_params to btbcm_set_pcm_int_params
> - Changed brcm,sco-routing to brcm,bt-sco-routing
>
> Changes in v2:
> - Use match data to disallow baudrate setting
> - Parse pcm parameters by name instead of as a byte string
> - Fix prefix for dt-bindings commit
>
>  .../devicetree/bindings/net/broadcom-bluetooth.txt    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> index c749dc297624..42fb2fa8143d 100644
> --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> @@ -29,6 +29,11 @@ Optional properties:
>     - "lpo": external low power 32.768 kHz clock
>   - vbat-supply: phandle to regulator supply for VBAT
>   - vddio-supply: phandle to regulator supply for VDDIO
> + - brcm,bt-sco-routing: 0-3 (PCM, Transport, Codec, I2S)
> + - brcm,pcm-interface-rate: 0-4 (128KBps, 256KBps, 512KBps, 1024KBps, 2048KBps)
> + - brcm,pcm-frame-type: 0-1 (short, long)
> + - brcm,pcm-sync-mode: 0-1 (slave, master)
> + - brcm,pcm-clock-mode: 0-1 (slave, master)

Since these are optional your patch should describe what happens if
they are not present.  I think in patch #3 of the series you guys are
discussing it, but whatever you end up with should be documented here.

That actually made me realize that this is patch #4 in the series.  To
be pedantic, bindings are supposed to be _earlier_ in the series than
the code that implements them.


>  Example:
> @@ -40,5 +45,11 @@ Example:
>         bluetooth {
>                 compatible = "brcm,bcm43438-bt";
>                 max-speed = <921600>;
> +
> +               brcm,bt-sco-routing = [01];
> +               brcm,pcm-interface-rate = [02];
> +               brcm,pcm-frame-type = [00];
> +               brcm,pcm-sync-mode = [01];
> +               brcm,pcm-clock-mode = [01];

I'm at least marginally curious why your example has a leading 0 for
all numbers.  It makes me think you intend them to be represented in
octal, though I don't know offhand if dtc uses that format for octal.
I guess it doesn't matter since all your numbers are between 0 and 5,
but it does seem strange.

-Doug
