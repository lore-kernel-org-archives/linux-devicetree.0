Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000E4C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 11:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCF552065C
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 11:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=km6g.us header.i=@km6g.us header.b="g4Bq9cbE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgFLLsg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 07:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgFLLsg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 07:48:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9A1C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 04:48:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n24so10674960lji.10
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/TjfYUNBP2cW26HkJvVfI0SpqRgYSTehKoOJVukkk8=;
        b=g4Bq9cbEzclMjz5WLywEQTTotOgWBL1TuZxvY8s8NTtX9NhHekjCAEGWRmnI7CJdel
         rL1llVEc0aF3HjR68ob4kb2AvbuLB84EloS9UKzeqgfrD/p8cVwtFcvE/y5MXtsStkiw
         p0qgalMfOoLXxrVyIuyBLGTLO/lg46Na7Z5DEj4cKMaRyB6lQJk4e0aJOuzuX1o+Kmu9
         tjRm6PTkX6pMBgkh8wFOWud3HTJKLivkARIDbXn+uu7Zc4kM+Om7x+oCVHxXhFzwBVAy
         2VBKOWHM83JfECFRy0bp0sCqp5kx/DiOD82tRFpKoI/kSZdZcrOaf90NCIFdn4snPyqC
         HOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/TjfYUNBP2cW26HkJvVfI0SpqRgYSTehKoOJVukkk8=;
        b=o5fI9kCQT4cyfxtSzkihQo7KOUX2CeexgDnu6QduYqmSVS3WsWJyPsZWltTboyHcBO
         +L0fOmvmZ6b9WbOYqMDxetOvldp8XiNeCfF2llpopkOc95y7De317WZtrcseQm3MQyBu
         Cr0SUj+J6Y8/Wb8e5tETqFjxjVAWJpzGbnyNV8LtMs1gy746KDumpXRKkbWclIys1cf0
         zm7glvskDEiQ2O7XHPMv+qTlqrN7/7icXjMVaKpilEqwqXD5iL7jbhyZnHe5C9LDqs04
         hVktUh2NSiwwPyBnNHAMpabR0N/2MhZkRuotGy6+zrz+MWg7jwntrozR5vxWLFutl8/W
         a9PQ==
X-Gm-Message-State: AOAM532K0C8IKG3TikWEVan1dXCTF+7scZIAZwS0ziWVw6NB8Odp0AkF
        nSGBfhETGzCRWN1hJd1kCfTSKMz0szzIXc2+kFXT1w==
X-Google-Smtp-Source: ABdhPJwnbvmf14hLKcPh9xhfT3LGK4uSWsLL6aeTp4pkg6ozrA3vKs6SipXaPF4bNCPSiMJ4KEG9WMcTk678Faudp38=
X-Received: by 2002:a05:651c:1130:: with SMTP id e16mr6750899ljo.10.1591962514142;
 Fri, 12 Jun 2020 04:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200530123222.361104-1-kevin+linux@km6g.us> <20200609221401.GA1492918@bogus>
 <CAE+UdorjD+2GORj3M6abgqTb8QnRZNFiyCX9PJAJc09xUBACqA@mail.gmail.com> <20200610151619.GW3720@piout.net>
In-Reply-To: <20200610151619.GW3720@piout.net>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Fri, 12 Jun 2020 07:48:22 -0400
Message-ID: <CAE+UdooznvJaJsMjrS+MeM6ysii8tR9fuZhjt44sMRF6VjYqPw@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 10, 2020 at 11:16 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> When working with RTCs, there is one issue though: boolean properties
> are not working well because there is no way to express the 3 different
> conditions:
>  1/ the capacitor is present, set the register
>  2/ the capacitor is absent, clear the register
>  3/ the device tree didn't have this property until not and the register
>    may have been set or cleared using another mean, don't touch it.
>
> As your patch is written, it only handles 1 and 3 which is probably the
> safest option but then we will never have a way to clear it from the
> driver. I'd say that this is not an issue but it is also something we
> will never be able to change without breaking some setups.

I agree. I could implement this as an enumerated string option which
accepts 'yes' or 'no'. Those would cover cases 1 and 2, and the
absence of the property would be case 3. I looked through the bindings
that exist and didn't see any examples of properties configured this
way, but I think it would be understandable to users.
