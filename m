Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71903C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D487206CC
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EZSQQZlI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbgEERiZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 13:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730046AbgEERiX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 13:38:23 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F10C061A10
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 10:38:22 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j14so2049702lfg.9
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nv0AIZrWlMo4m0rNhQ0hmb2K7EScYgYrwU3TenVEmog=;
        b=EZSQQZlIteDqtbEIcl/sEkeBUfzjC+YtuCRNGMwWCq1AIeFJ3n4lyDDj8t67g6lgOv
         vG2erCqH5ghfC7q0wRU3CL4Hc1X83XBVUxV/+FOuE8DVCZL3q7jY7Hj7QYyF0Vc85oqH
         jyFcaDUaWWrs9ZE+JHUIH20XmBu1l0lK2xrnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nv0AIZrWlMo4m0rNhQ0hmb2K7EScYgYrwU3TenVEmog=;
        b=neeSr1Eg9Wn1cLitrGZxAqrmpssbj8oseKcIgFRrxMFknWxlIcjEv3Y4gH4dVnhCQs
         92M+BoD4O7iYqp2aoTfAw5MmbUbKETt5nkH0nPajh5xaZuNd0Tco+bnGwb7erbkHBSVo
         mJN0XuaG8dmE+JGbogENldaA3NzBEKOC1SEDQMpsbVt+ZYqz/ATXscnWmUsnZWZIaSQ8
         QBACrJK4Bx1ZKJ0CirEBStF9Gyu3x8lG/dXQ8Xui04hofVYYnuujzqckhINGJuOKCsiW
         5+Flm0Z69X4tA0uN1eLddRQomZ94DItxxqGJPIBUIcDvYbJTNBWv9733bv8h5XChPuA+
         NQvA==
X-Gm-Message-State: AGi0Pub7TP0ObyQIddmZWXnDrd3fCSb3wOHb2ZzY52Ywc1vKGa4EHazc
        kgbcLAEaF+IPET6KXQPX0jRkW10EY50=
X-Google-Smtp-Source: APiQypJdD9W8WMpJFaiXoBANdBVOl/U7EGrq79SMfRZ7N8f0uKVdlrTNWt3t92dEH9/MFMQl+vK/5w==
X-Received: by 2002:a19:c6c1:: with SMTP id w184mr2401218lff.20.1588700300779;
        Tue, 05 May 2020 10:38:20 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id z8sm2643508lfb.44.2020.05.05.10.38.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 10:38:20 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id x73so2064410lfa.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 10:38:19 -0700 (PDT)
X-Received: by 2002:a19:c394:: with SMTP id t142mr2441981lff.129.1588700298965;
 Tue, 05 May 2020 10:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200505133602.25987-1-geert+renesas@glider.be>
In-Reply-To: <20200505133602.25987-1-geert+renesas@glider.be>
From:   Brian Norris <briannorris@chromium.org>
Date:   Tue, 5 May 2020 10:38:07 -0700
X-Gmail-Original-Message-ID: <CA+ASDXO8TJ09vNQaCyoMgfoFVouNQRw7Evx2Vfko1k_03q8GHA@mail.gmail.com>
Message-ID: <CA+ASDXO8TJ09vNQaCyoMgfoFVouNQRw7Evx2Vfko1k_03q8GHA@mail.gmail.com>
Subject: Re: [PATCH v4 resend 2] dt-bindings: net: btusb: DT fix s/interrupt-name/interrupt-names/
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Rajat Jain <rajatja@google.com>,
        "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 5, 2020 at 6:36 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The standard DT property name is "interrupt-names".
>
> Fixes: fd913ef7ce619467 ("Bluetooth: btusb: Add out-of-band wakeup support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>

If it matters:

Reviewed-by: Brian Norris <briannorris@chromium.org>

We're definitely using the plural ("interrupt-names") not the
singular, so this was just a typo.

Brian
