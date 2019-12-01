Return-Path: <SRS0=kxJ0=ZX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6CBC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 22:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 297A42146E
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 22:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QPJW8Qxl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfLAWVs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Dec 2019 17:21:48 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45611 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfLAWVs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Dec 2019 17:21:48 -0500
Received: by mail-ot1-f66.google.com with SMTP id r24so29386905otk.12
        for <devicetree@vger.kernel.org>; Sun, 01 Dec 2019 14:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zafjfhO80Bk14ln/ZiuCSbu3mvcfTQlO6J402qXWYSM=;
        b=QPJW8QxlkiJRqiURjSFbtZXMQIUYtJcQpVd7rR1WS7yeSYQRdYBPlzVOIKp3TTcxmM
         /wOR3VnNL2jPWeoGCQAqnDERlw+9cA+5D83WwjkgLukpOolIoss/R+QKawIJGJEMoUe1
         usvzw10AAjQbFUoUrXhbCnApJ4n/CMD6V0+X1PRoTfpPkerzs36tcMyNhEQHN/6dFF2H
         Wk9Dbokz3J0CTS7ak/riGYk/rBtHzGbVC78dM7wXPcBIXibN5kvVAN4Bw+HFj77Mnoc3
         ncpMmp2ce9RdDuJ8e5v7MjWh/mwbSmj/aOaz2Sd/yBV74Ax6pZvpQZRGHNtOnlwG4Ivc
         dvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zafjfhO80Bk14ln/ZiuCSbu3mvcfTQlO6J402qXWYSM=;
        b=PnRrmcBDugslmg7a7sqUcufTeIAuf7EvjK0BfWUyfeL9P6stHO/2yuXULnvpM8MLNa
         CnB3MTtfTi6MHgChk3qPaq7AOVqn43DOpWOTLCMduCtziKF4M5pZ+fNJ4g1KqDbHPcAt
         J15D7kjd43Whpbc2ATftO9aBCveDbdNnMevXv9o2vTwXsxEALsD6CwSIoAmH2ksJZ/WJ
         NknJf3bFC1iV7V1TLEk3gbIXv4bizGBIn2hZvAkbVHklBwa5YVJCTy23l/GUcmXDrBgA
         Cf/cwVqdhjGxv12238EmSDKjlDtF3rUWTuhPY9tloWqDokcQg79Gyh48q7ZwOCjLWe9B
         SizA==
X-Gm-Message-State: APjAAAWTHHmIOhDQ2PA1RbBbQkmrLvjEmPCdNpYC9JODAMtM/S1sBPq6
        qoZ2mtFLEUqNw1//EVvGuHcF2Exzb3Gedqb0Fes=
X-Google-Smtp-Source: APXvYqytCSXqAwv0AIi382XWLFeFbvKAVyYBUZMoUap3BM482uhPvcgevQ0vf4+QmJZU4y6jypKVQosBwOaiUPONDBk=
X-Received: by 2002:a9d:206c:: with SMTP id n99mr18109519ota.42.1575238905593;
 Sun, 01 Dec 2019 14:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com> <20191130195335.17740-4-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130195335.17740-4-mohammad.rasim96@gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 1 Dec 2019 23:21:34 +0100
Message-ID: <CAFBinCCYzThAM_DkQyDZ2LrF-6bJoxeNZDtfADmWOxLH+B3AUw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: meson-gxbb: add support for
 Videostrong KII Pro
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

[...]
> +       leds {
> +               compatible = "gpio-leds";
> +               status {
> +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +                       color = <LED_COLOR_ID_RED>;
> +                       function = LED_FUNCTION_STATUS;
why is LED_FUNCTION_STATUS not enclosed in <> like color above?


Martin
