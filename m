Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BE7CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 07:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0094621872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 07:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QiMI6e1J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387840AbfJVH1M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 03:27:12 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37447 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387819AbfJVH1M (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 03:27:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id r4so12070894edy.4
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MFBdspS+xXFxCKlkyDP++/fjuIK+Mo0RkCyzgsveOkc=;
        b=QiMI6e1JKV7CbDfGfSqJ4kgFGr4RhfoKQAuFhznIHBVkvsJj8D0I1mO6uvXGwdldfN
         2d6dVyNIhVDBZIf3NVyImcj3owO2CE5hAG7ksGLI7NI3BC9oopz35zMz9SUo9xeNFruZ
         JWnc01pWW1i7L8vBkC7ifwbmt2gRAui8ghU+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MFBdspS+xXFxCKlkyDP++/fjuIK+Mo0RkCyzgsveOkc=;
        b=Mu4GtRtEee6xHa2rCHBUt2oypPsWoXO0vLRHrcowSR/sClq/B+8ilu9qU9GRs2xfyZ
         ShX2lDyetDhbrOSQGgomlWH3unB8ReDBWxbhaiRtOhU9NS9kkcIu3F1f3Lfnc8cQNTFc
         mMF5UJ6YXIP4aHVhUWH/KEfTyBbTN6aGSzUlp2IJBoaW6QCdgc8o5hS5jTISigF0Br3H
         Q3mNt6Q30Jwf97UrHZihALOhcnSGbEzyHSpv62nunCBrsmVmEO5cKGZMKALOmM4XS16+
         dnLixrFC/Rk1v6cW1dfRiiJRo2Lv6ovRhoHpWBwPg15+XkAhphok6SS+Zo53KkeqaCgv
         miig==
X-Gm-Message-State: APjAAAUGxeZPI2onuqTget1gXgqmUXb6xwbrU5gGsZHu15w3h2vZFZI7
        HTPn126AVrK5aGviXGT9WQMR333Jc35qhw==
X-Google-Smtp-Source: APXvYqx7BLjf1+Cx/eii4NHaZQCaD/6qo2m84vAMQCAcQE/Qgnwhl8dBxKbG7HKVENTR0A9PX6dEQw==
X-Received: by 2002:a50:da0f:: with SMTP id z15mr1917511edj.137.1571729229472;
        Tue, 22 Oct 2019 00:27:09 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id p88sm393103edd.22.2019.10.22.00.27.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:27:08 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id a11so664672wra.6
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 00:27:07 -0700 (PDT)
X-Received: by 2002:a5d:4491:: with SMTP id j17mr1985919wrq.46.1571729226926;
 Tue, 22 Oct 2019 00:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
In-Reply-To: <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 22 Oct 2019 16:26:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
Message-ID: <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Oct 22, 2019 at 1:53 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napi=
sa=C5=82(a):
> >
> > Although in the most platforms, the power of eeprom and i2c
> > are alway on, some platforms disable the eeprom and i2c power
> > in order to meet low power request.
> > This patch add the pm_runtime ops to control power to support
> > all platforms.
> >
> > Changes since v3:
> >  - remove redundant calling function
> >  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
> >  - change supply name
> >
> > Changes since v2:
> >  - rebase onto v5.4-rc1
> >  - pm_runtime_disable and regulator_bulk_disable at
> >    err return in probe function
> >
> > Changes since v1:
> >  - remove redundant code
> >  - fixup coding style
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 2cccd82a3106..68ced4f25916 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/nvmem-provider.h>
> >  #include <linux/regmap.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/gpio/consumer.h>
> >
> >  /* Address pointer is 16 bit. */
> > @@ -67,6 +68,12 @@
> >   * which won't work on pure SMBus systems.
> >   */
> >
> > +static const char * const at24_supply_names[] =3D {
> > +       "vcc", "i2c",
> > +};
> > +
> > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > +
> >  struct at24_client {
> >         struct i2c_client *client;
> >         struct regmap *regmap;
> > @@ -91,6 +98,8 @@ struct at24_data {
> >
> >         struct gpio_desc *wp_gpio;
> >
> > +       bool has_supplies;
> > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> >         /*
> >          * Some chips tie up multiple I2C addresses; dummy devices rese=
rve
> >          * them for us, and we'll use them with SMBus calls.
> > @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *client)
> >         at24->client[0].client =3D client;
> >         at24->client[0].regmap =3D regmap;
> >
> > +       regulator_bulk_set_supply_names(at24->supplies,
> > +                                       at24_supply_names, AT24_NUM_SUP=
PLIES);
> > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->dev,
> > +                                      AT24_NUM_SUPPLIES, at24->supplie=
s);
> > +       if (err =3D=3D -ENODEV)
> > +               at24->has_supplies =3D NULL;
>
> I just gave this a spin and noticed that this will never happen - the
> regulator core will use a dummy regulator if none is defined in DT.
> The only way for this to make sense would be to use
> regulator_get_optional() for each supply separately. But actually I
> think we should just leave it this way and remove this if. In the end:
> this chip needs some power supply, so dummy regulator makes sense.

Thanks for testing. I'd still like to make sure what happens on non-DT
platforms.

I can see that the core returns the dummy regulator if
have_full_constraints() [1]. That is always true for DT systems, but
for others it's false by default, unless someone explicitly calls
regulator_has_full_constraints() [2].

[1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/core=
.c#L1787
[2] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/core=
.c#L120

Best regards,
Tomasz
