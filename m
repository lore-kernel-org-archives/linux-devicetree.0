Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7822C3524D
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 07:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AED3120674
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 07:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RXnUPNFA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgBDHoy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 02:44:54 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:33427 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgBDHox (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 02:44:53 -0500
Received: by mail-vk1-f196.google.com with SMTP id i78so4915795vke.0
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 23:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrJkaVosHVyDC3fJ7ODIJY8tH2A+lqKAd2gAEcP3LqI=;
        b=RXnUPNFAExJbKvzQbWRSzigj2n5KQbtVWAkmfN5b3Cx7N17s6x6+JFpKQa1oUei03F
         BXlRwmOaBRBls7iCRkBmqhAmPd16T9JcinVAR6gN9hCJE7HXZEMaCuuUUhgdfZPJw2hO
         LSZ+Is1b0UJHU942FfZwiLITm3RsZrzWRHZvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrJkaVosHVyDC3fJ7ODIJY8tH2A+lqKAd2gAEcP3LqI=;
        b=j+w6D/e8cAIK8EPnAIQnW1vefV+yCsmklHo8HPSGZpj7xtrDrF7lYgf7ahzNauo/Py
         JY/19bJj8VAiABWvh7+e1naVg2CcDI2wiPB4HFGa9TfEH4MQPcQ0x/CKGmh4mkXWWuHd
         Q6ib2e/mSd5TIJp66xuCplOOLztwOMUOGy46XJnWl4Oko+v+7SOLo8x5kKAS0tr2R3KB
         ULAmeoi+09ke2C6Y4bX/c0531tehFD+uJWlgAAgLal5t2L3FcdmzDRIXmEX03Wif2IqF
         lKXZpi5mlZCLaKtdmH+yBH9PUd79GR344hsXBpy5UTUTOpXROdeKexAFzSgJw0STciW7
         lGJA==
X-Gm-Message-State: APjAAAXfBkulV4BJhyObdgmNS/J2AByDjJ/1fH53laZnPPk/a+AJwT9l
        EVw39RxT3ovVc4GQBTmD3nsoJVs1p2rofftFB3XWwA==
X-Google-Smtp-Source: APXvYqyIj13EoH0jYPwM1kKCOFX/RV4/LYJXjijNF/m1go8sCfb68u/ehTXS8H/FGQhgexUB6V01thob+q5J+/A/jKg=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr16513637vkm.51.1580802292741;
 Mon, 03 Feb 2020 23:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20200114021934.178057-1-ikjn@chromium.org> <20200121074727.35893-1-ikjn@chromium.org>
 <6739cc32-9beb-ac0a-f500-db2d70bb8e22@collabora.com> <20200127161206.GB30843@bogus>
 <ef653218-4a59-73e1-186e-9b62b8ed6dae@collabora.com>
In-Reply-To: <ef653218-4a59-73e1-186e-9b62b8ed6dae@collabora.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 4 Feb 2020 15:44:41 +0800
Message-ID: <CAATdQgAf8udrhAYt048m5crkDy2sGDu5n6BP0U1v-qgbyjUJrQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Thanks for the reviews,
I will send v4 soon, sorry for the late reply.

On Tue, Jan 28, 2020 at 12:25 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Rob,
>
> On 27/1/20 17:12, Rob Herring wrote:
> > On Mon, Jan 27, 2020 at 04:57:13PM +0100, Enric Balletbo i Serra wrote:
> >> Hi Ikjoon,
> >>
> >> On 21/1/20 8:47, Ikjoon Jang wrote:
> >>> Convert the ChromeOS EC bindings to json-schema.
> >>>
> >>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>> ---
> >>> v3: node name changed in rpmsg example
> >>> v2: cleanup description, fix typos, remove LPC, add add RPMSG example
> >>> ---
> >>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
> >>>  .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
> >>>  2 files changed, 111 insertions(+), 76 deletions(-)
> >>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >>>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
> >>>
> >>
> >> Still in mfd directory, this is not a MFD driver, please move to chrome/cros-ec.yaml
> >
> > Please don't. Looks to me like the chrome EC has multiple functions and
> > is a device.
> >
>
> This binding is part of the Chrome EC core and we explicitly moved all this out
> from mfd subsytem in the past because wasn't really fit as mfd driver.
>
> We still have one device driver (cros_ec_dev) in mfd, this is the one that
> instantiates all the subdevices but the above binding is not related to this
> one. All the core/bus part is in platform/chrome, looks to me more coherent have
> the binding accordingly.
>
> Anyway I'll let you the final decision, nothing that worries me too much.
>
> Thanks,
>  Enric
>
> > Bindings directories are often 1:1 with kernel driver directories, but
> > not always.

Converting the format at this time. I will keep the same directory in v4.
It seems that cros_ec_dev device driver should be changed before moving.

> >
> > Rob
> >
