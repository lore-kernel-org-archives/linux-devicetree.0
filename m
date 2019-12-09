Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16293C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 15:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAE9A2077B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 15:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jCwHdkzj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfLIPKB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 10:10:01 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:38506 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfLIPKB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 10:10:01 -0500
Received: by mail-io1-f65.google.com with SMTP id u7so15100288iop.5
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 07:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xcWrJCCDV9FLXdr0ZUztddjQSSx3x7+pXvp+/EC4d4s=;
        b=jCwHdkzjuZXdAkFGt53WBUw98CEGScyc/VWwjQ7pxH+VWdtrquDNMCbo59WLI4gWmZ
         FLY7q481NWsVYTxuLmnRDrwcP9ZTE64og3Ks1EYf96dttxJ8/fV+ab2gimu4+16zUtRn
         FjTGKEqm7de1F01zLV4vmAsXOJm+fXN+FNgyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcWrJCCDV9FLXdr0ZUztddjQSSx3x7+pXvp+/EC4d4s=;
        b=WWOUqeCeM2fQmm1H9LRosQQjn8s0aCMPlH5HqfVjd7WLFfP2pvT8b9HG/wPE19UIJ6
         QocDENF4DTTRbdnbAt/Fp2y19P6xknL5coiH19fdaXKgKyIJcz8f/gpepjZr+ucthq0Y
         zje+W+LfhHAJQbJcCaidx03p5Z1e9b+Zzw9u1LogvDHC3VvM8tTU8x1lshw27Ylus9K/
         ugMnGEdCfyOFjDxinpLvjNoCvR1i2iOClixJZ28TDeRxCawiYpWNwx+LfYPjT4uink+d
         X+xQI3lEpeAMA6qhd0IMyFe2HQw3KmgBy0IAMfon4oGDTAQGorm8rpt5bREj6n4MzRTO
         0RRA==
X-Gm-Message-State: APjAAAVmkmyBVmZpRWLwQ4eNvARtqt2oNREVOMkWdAI5Dh/U3hEXLW3J
        iYSZtL0xYJblJDSLTNEG/oJwb6ofcTrHDHEmJK2zzw==
X-Google-Smtp-Source: APXvYqzg3szTNJsFOs7seXieuvnWRJ9uISz+Z/GGKMgmwYIKFt9RhcKAORgRuxrGJQAz5EnB4PhlNDhQ7834VEmeZRc=
X-Received: by 2002:a5e:c204:: with SMTP id v4mr21682825iop.106.1575904200419;
 Mon, 09 Dec 2019 07:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20191209145016.227784-1-hsinyi@chromium.org> <20191209145016.227784-4-hsinyi@chromium.org>
 <20191209145552.GD12841@pendragon.ideasonboard.com>
In-Reply-To: <20191209145552.GD12841@pendragon.ideasonboard.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Mon, 9 Dec 2019 23:09:34 +0800
Message-ID: <CAJMQK-hNSF-Vu4CfTKiCUdBRmaONf=Lp3NN0-nFor6mxY1seJg@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx:
 support bypass GPIO
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Archit Taneja <architt@codeaurora.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 9, 2019 at 10:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for the patch.
>
> On Mon, Dec 09, 2019 at 10:50:15PM +0800, Hsin-Yi Wang wrote:
> > Support optional feature: bypass GPIO.
> >
> > Some SoC (eg. mt8173) have a hardware mux that connects to 2 ports:
> > anx7688 and hdmi. When the GPIO is active, the bridge is bypassed.
>
> This doesn't look like the right place to fix this, as the mux is
> unrelated to the bridge. You would have to duplicate this logic in every
> bridge driver otherwise.
>
> Could you describe the hardware topology in a bit more details ? I can
> then try to advise on how to best support it.
>
Hi Laurent,

The mt8173 layout is:

MT8173 HDMI bridge-- hardware mux --- HDMI
                                                   |
                                                    ------------ anx7688
There's a hardware mux that takes mt8173 hdmi as input and has 2
output port: native hdmi and anx7688 bridge.
If gpio is active, we would like it to go to HDMI.

Previous approach is to make hardware mux a generic gpio mux bridge,
but this is probably a very rare use case that is only for
mt8173.(https://lore.kernel.org/lkml/57723AD2.8020806@codeaurora.org/)
We merge the mux and anx7688 to a single bridge and leave this as an
optional feature in this time.

Thanks.
