Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A436CC43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 12:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A26020715
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 12:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y43nUX9f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfKVMrS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 07:47:18 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33623 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbfKVMrR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 07:47:17 -0500
Received: by mail-oi1-f193.google.com with SMTP id m193so6404951oig.0
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u5HN2aZVdj7m+hEI/tOay7oYBKK4V1c4Qj4MJYDq/G8=;
        b=y43nUX9f2O6pPgD2zT2J76e5OrIx6dYRFy/3LTBk/WB5BUPyt5Tw9+g349oglCGlpc
         S7PtdBt9Bhyo4VczYhRGS72HwuwJWIhNbUpNqO1xxjcNMF/pd3d6bCjqUDt2FjuXgpx4
         H6RR2+YNKVH9W6DgH5Rg1+Si8iE6MOvVwW5eVga9QVLjZY67y/mqbQs7CoJHy/AxXsdY
         o9M+cpQJO+3WCBE6a9ylZPf0Y3+ILeYjYyankYt0PeP3F6eODLhifc90Mq0uOSL95ij3
         yrrZDRKqDelRApbxvKFD6mIDbqBSUWLXTc2DEJSWsZT49fVT1Sme4YtNpeaS537MhXfU
         aVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u5HN2aZVdj7m+hEI/tOay7oYBKK4V1c4Qj4MJYDq/G8=;
        b=TIzcrN+E4BWknboqhqmDiNtmeLGtk0rCkM0d3fCEvjBGuKi/ARstjol0f8/1FLaftu
         mA52rVTJuAtPUsevAkgHdtMTy0h/y8QC+mu4NgD1ZQbktVgKqXuiF2KvNHcNJP3UzERx
         ptaHW554981Ea2qydYyNz5l4JLMNwEA63N1g68eCgIR8v8gV4xNbXnBo+8odX6T3JEW+
         loZTtyhICXjK0UUBOVLkVuTqYsLaQVcZ1HcUEvPrxA32glzqiZGpX9O1n69ShipCYIFc
         X9WDzdoirCYrLmkgWNefO3yxKDp23V3zgkZkaNOAElSRC3d95pK4r2IO8TLaaUvbwHGW
         NPCg==
X-Gm-Message-State: APjAAAW8KAMKaDvtdQ1LvXbancCsy/d0AAUszzlY/VY3C0BdhD4locP0
        UAlPNnva6BAuJNnxV4dyZWjGzHynGbQeOSL0sFmNzw==
X-Google-Smtp-Source: APXvYqxdARFB1pPQ8THn95OiREH9UoH/eBJsQ+rkNZxsd+lQ6YYGrLy7l38RStqRCSsPvKjSawxBrhh8+xlo54P8RSA=
X-Received: by 2002:aca:d904:: with SMTP id q4mr12198515oig.21.1574426835323;
 Fri, 22 Nov 2019 04:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20191120142038.30746-1-ktouil@baylibre.com> <20191120142038.30746-2-ktouil@baylibre.com>
 <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
In-Reply-To: <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Nov 2019 13:47:04 +0100
Message-ID: <CAMpxmJWSgYjcGdR7Zrj-=nA+H8cYfZUriHQPxN=8zgPDvD-wTA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Khouloud Touil <ktouil@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

pt., 22 lis 2019 o 13:41 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> Hi Khouloud,
>
> thanks for your patch!
>
> I just have a semantic comment:
>
> On Wed, Nov 20, 2019 at 3:21 PM Khouloud Touil <ktouil@baylibre.com> wrot=
e:
>
> > Instead of modifying all the memory drivers to check this pin, make
> > the NVMEM subsystem check if the write-protect GPIO being passed
> > through the nvmem_config or defined in the device tree and pull it
> > low whenever writing to the memory.
>
> It is claimed that this should be pulled low to assert it so by
> definition it is active low.
>
> > +  wp-gpios:
> > +    description:
> > +      GPIO to which the write-protect pin of the chip is connected.
> > +    maxItems: 1
>
> Mandate that the flag in the second cell should be GPIO_ACTIVE_LOW
>
> >  patternProperties:
> >    "^.*@[0-9a-f]+$":
> >      type: object
> > @@ -66,6 +71,7 @@ examples:
> >        qfprom: eeprom@700000 {
> >            #address-cells =3D <1>;
> >            #size-cells =3D <1>;
> > +          wp-gpios =3D <&gpio1 3 0>;
>
> #include <dt-bindings/gpio/gpio.h>
> wp-gpios =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
>
> This will in Linux have the semantic effect that you need to
> set the output high with gpio_set_val(d, 1) to assert it
> (drive it low) but that really doesn't matter to the device tree
> bindings, those are OS-agnostic: if the line is active low then
> it should use this flag.
>
> It has the upside that the day you need a write-protect that
> is active high, it is simple to support that use case too.
>

Linus,

what about the existing bindings for at24 that don't mandate the
active-low flag? I'm afraid this would break the support for this
specific chip or lead to code duplication if we had this in both nvmem
and at24 with different logic.

Bartosz

> Yours,
> Linus Walleij
