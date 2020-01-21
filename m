Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C20DC33CAA
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 04:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EC2D22522
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 04:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y437XdOv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgAUEh0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 23:37:26 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:37134 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgAUEh0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 23:37:26 -0500
Received: by mail-qv1-f67.google.com with SMTP id f16so859206qvi.4
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tE6t4zYqaVXPST4AhwIQ9GsXTC/ddB8hjT5O44X4X2A=;
        b=Y437XdOv0Hto2lq+dzGstZ/dDsYcyHpK4I+DVf73M1v48j1EjilwkEp0HlSg8Iu9gL
         0tTOS38rUYrM9yCpro7VwAwprgAfaJvNt0icSyt0cimanM+SnEp2Xre2R1C/rtGm8iVZ
         lRVWu7xtrpg+9KP77O5tLZX+QnE1zQQIxeaZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tE6t4zYqaVXPST4AhwIQ9GsXTC/ddB8hjT5O44X4X2A=;
        b=dhzPnaDtGNXQO7NkI3SzomViVmnfIbWIgny1VvsnHmEDYmccxDN9zAZ4Nj1jkj5SaO
         lE5TAbccJw8St9aVhW6n35amyDGc5xg9QvBC6DHgVSw4n7MLnWkFY7ZvyrsLQszGjmjZ
         wURbk9jUqmhPiDzxFd6vjcN9xL7egOLrSmVAv80JWCdW88S5mXzeRrQ9mW5aV8K15GlO
         gsy8KxbWSnsf7xVJwm2gIE2rGeoACTp3UVUHt8OTTwi7d12duLp0nQ3/mdDKpMQfIMg+
         5bEBuMxrTiq39Wo9ctv0AE0S8gqYRnGqA2NO+Dqi+lq9GuFAfqYumMHNmQyLocMsqGm3
         qlkA==
X-Gm-Message-State: APjAAAX8+QnaiuJAgMZYxFXxi7GSs2R+gTSw0GYmBJJTB77FWZ8lVWV8
        YpKk5oGUeGEn+Fjer+MEXk4VHugpIuAIAvCwyX6p7Q==
X-Google-Smtp-Source: APXvYqzdl4VdxIrAynyQuScJnrpT9ZczyRYljUJVkw1OCPfHpQClTp+aKVQtQGPPLLXXuyebvlkJ/h7fxsuCkIoPT4Y=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr3120793qvn.6.1579581445521;
 Mon, 20 Jan 2020 20:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20200114071602.47627-1-drinkcat@chromium.org> <20200114071602.47627-5-drinkcat@chromium.org>
 <20200114151643.GW3897@sirena.org.uk>
In-Reply-To: <20200114151643.GW3897@sirena.org.uk>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 21 Jan 2020 11:37:14 +0700
Message-ID: <CANMq1KC_-g45wdGgGiBmEyVXAJMkKwsJBJXGBHOMJk_=NyfpYw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
To:     Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 14, 2020 at 10:16 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jan 14, 2020 at 03:15:59PM +0800, Nicolas Boichat wrote:
>
> >  - I couldn't find a way to detect the number of regulators in the
> >    device tree, if we wanted to refuse to probe the device if there
> >    are too many regulators, which might be required for safety, see
> >    the thread on v2 [1].
>
> You'd need to enumerate all the properties of the device and look
> for things matching *-supply.

I see ,-) I was hoping for something slightly cleaner, or maybe an
existing function in the core.

Steven: How strongly do you feel about this? If so I can add that
check in the next revision.

Also, just a heads-up, I'm out for the next 2 weeks, I'll send v4 after that.

>
> Reviewed-by: Mark Brown <broonie@kernel.org>
