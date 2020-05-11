Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F13C54E8D
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10F172075E
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgEKLwD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:52:03 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38094 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729514AbgEKLwD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 07:52:03 -0400
Received: by mail-ot1-f68.google.com with SMTP id m33so7276730otc.5
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QBS6Y+t72e0Ijgdesacjs6aSIRVgqjNju5FgbWy7u4c=;
        b=WMsSNNF452Nry32KPIUkuYGYajyZavuAv/0W2bj3ET7w4k4qFtfnUvWh2Pm8uGFdAe
         KhsiAqJMPznNglfXyccFC0Q26cwTAi+GYmrdivrE/atKP0GTZzwTEDmO4LcT5XLp/wqF
         00xMxyX8oG79O9YcnFl3YL3hrxrHu0rBIpZlYJNtb21tPj025Y2hanK4n6C8gAqBsE8R
         ETNXnYwbzpiHb2gZArLOp1DypC9lxkJ5f+VHRwPjOLj9mggG3Fwt1IFZqxezA2F4RLzq
         5wgfBXaqawDweObLSi3Bq/yZBjVMPI+QU/6H6sihPD+RI38Ghwd/bqzcKYrCel58EmkR
         ZZdA==
X-Gm-Message-State: AGi0PuYVdZM9+pmhXBQRbmiD7VrKft680RVltwpCAhPQ6Runu2qAOf4e
        R0BU0735Z8PuZi+MuCGgpMJiW34cvuYoPZ1XkT8=
X-Google-Smtp-Source: APiQypIROHYLmrNYKuJ5mkgwJXioUskfOWsAa6GSqYc8q46EHLwyAnGStV3XVLa/O66BHh6GwVrKNMIAhYIgBlVn3Eo=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr11517448otl.107.1589197922357;
 Mon, 11 May 2020 04:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com> <20200511110611.3142-3-ricardo.canuelo@collabora.com>
In-Reply-To: <20200511110611.3142-3-ricardo.canuelo@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 13:51:51 +0200
Message-ID: <CAMuHMdVNxueF0=J3nZ788Cax-2WOtaeEtY0S_bDZtDhN=fQG6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ARM: dts: renesas: make hdmi encoder nodes
 compliant with DT bindings
To:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 11, 2020 at 1:06 PM Ricardo Cañuelo
<ricardo.canuelo@collabora.com> wrote:
> Small fixes to make these DTs compliant with the adi,adv7511w and
> adiadv7513 bindings:
>
> r8a7745-iwg22d-sodimm-dbhd-ca.dts
> r8a7790-lager.dts
> r8a7790-stout.dts
> r8a7791-koelsch.dts
> r8a7791-porter.dts
> r8a7792-blanche.dts
> r8a7793-gose.dts
> r8a7794-silk.dts:
> Remove the adi,input-style and adi,input-justification properties
>
> r8a7792-wheat.dts:
> Reorder the I2C slave addresses of hdmi@3d and hdmi@39 and remove the
> adi,input-style and adi,input-justification properties.
>
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
