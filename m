Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2F9C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 22:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3153B206F4
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 22:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hz1JhZJq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgGOWNZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 18:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGOWNZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 18:13:25 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF99C061755
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 15:13:24 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h19so4472893ljg.13
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EIwOcx3xakAQl+aytp6k21WdPOXiW4LKLnvT4rMht3U=;
        b=Hz1JhZJqRnK8pNhlac4KJKaAOrt6GLsozrPP7iGcRXSoePoz+4/oCVBbTuj3gKxy+F
         Iqupe7BXDyuvqUJFq7ux48yxZUXet2l6lCejiDEF5ECWlwRcMN4qBAfk7OUG/2xnGMtY
         ZH/nT62WZGA1pzdItKBop2AoEWnQHrTPncCft30e1/nh6uxRAgqcZODIGUaYQ0g744Uz
         r3G/6+naA1rtni+RG0gW7XB/jVGfSrm+e3VZFviXPRLv6VoBXrRiGq48YKSWTFfLzt8N
         NWUyzV3raOPM5tpvDRk2I4F5RbZS3kii+NhiJuQb8mYBHsHWwYp/6fk1byezdGCJCvn5
         FTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EIwOcx3xakAQl+aytp6k21WdPOXiW4LKLnvT4rMht3U=;
        b=mhBkctYEc1CK6ECrNOqBFFx8JyvAbjejUHluwno26GS6mj2/w1YAdniBJKC6+o3Sbl
         VAMrCRjNMESBpr1HA76NJX3bT5v41SKLVsZpot181W/YqL8IWf09xpqdB/IqBqRc8P2S
         uLgduuNE2t8ZNvo8kCglK818GdE+JWhHKuk3u6DJYmHQfSIjDDSnZI/eId7iZYKDaxrS
         XImQBzpMVwalO1nRnCwxf5reKOxZp54KdwVobUg0+84HNcwAPqkPF/YX3rVPEm9JI5WT
         IvOmsl4cCdW2epueshrvEh7PbSFcUTwOEjuDJ9JSHNwAzGb0otc+lmd/x+FLkWsHdN5T
         53cw==
X-Gm-Message-State: AOAM531cV2xPmArUvSAlkjVd/gBLoTkqE7XbshYJDCAY/PxzVnZAMLlz
        Iscccwx8Gv+ddzhB7okX46BrV6/acqKsGglU7Do=
X-Google-Smtp-Source: ABdhPJwbsLNfkUD4HdIJ6IkkHbrTn5XQ0hwtojNOkp3i+xmDVdQLvJF2Xzpt34dORXBPkeyQoU9vlFrz+IAunQMkhA8=
X-Received: by 2002:a05:651c:544:: with SMTP id q4mr596756ljp.310.1594851203157;
 Wed, 15 Jul 2020 15:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 15 Jul 2020 19:13:11 -0300
Message-ID: <CAOMZO5BYV_3GhcWsaGXnyxT_d86wQ+3wguW3AU+kVfx7bnZUkg@mail.gmail.com>
Subject: Re: [PATCH][resend] ASoC: dt-bindings: ak4613: switch to yaml base Documentation
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Kuninori,

On Mon, Jul 6, 2020 at 8:35 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ak4613: ak4613@10 {

node names should be generic, so:

ak4613: codec@10 {
