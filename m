Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFFACA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 10:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C65E621872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 10:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lv76N7Fo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388283AbfJVKeM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 06:34:12 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37059 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388251AbfJVKeM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 06:34:12 -0400
Received: by mail-ed1-f65.google.com with SMTP id r4so12478852edy.4
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 03:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e68YLYvcFbaqOJn4XNlThbOgu3ucI6lxgXX12qn4Gzk=;
        b=Lv76N7FolD/PooIHeSV5UCr3GbiI+68yzlIptjne99kvjVfVaaCnVSLNdcSd9GYw2b
         3jHqdSiggQyK767cWlGQTbdOPkbhAW6ZkrVLwgJoPGyKs0lDh6JP+1nIi4HFtHyp5HZm
         KJf0XTmhHlDeqQ1MMXjMRizE1bEyEFJBfzWAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e68YLYvcFbaqOJn4XNlThbOgu3ucI6lxgXX12qn4Gzk=;
        b=XaHUpLdHiCBTuli31sRlDwru88Eiqijray+P+GEDrO+8Z5KpydboJtgCxHZgl7tfK9
         f/libGNb4sjZvaOz/VQzWySZz904fQf9smOs+JE9+3nbFDAdL3LJbo0uy2CSIGC3E+Ju
         emz2j2QmgFFpkykjqnOuj8E6A8ysoZWDd/CTguGSk70B2Rhw1ziwvJMPNHy3ZYapSMfb
         I4m2/9E1+Q79JJUQ+pp/komZrZD5AFjWxxJHw2EJkbcf4DKgBbA5UYLsvKTeZuxhLp81
         wmHDZ66UbS7gJ5cRI4mu7V/vajJwugVCerHW8uGQr36GK11JVUoIza9fWAmFhVcb1r6z
         zTfQ==
X-Gm-Message-State: APjAAAXyUqXr57eY0PNhPUseH7QWcYyyqdHV5Kza9kzFYnD0O7v3Awob
        c4+u+7jWsNxnX4k3W8My+Su/TyXn7ZkUUg==
X-Google-Smtp-Source: APXvYqyjMNWknsTvO2lzlHO7V3sUbIvMHxD8SJex7d31X1jIsLKxxfeXoFmIso/hZrScbvFqmZKfvg==
X-Received: by 2002:a17:906:6087:: with SMTP id t7mr26861169ejj.58.1571740448918;
        Tue, 22 Oct 2019 03:34:08 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id h10sm726891edf.81.2019.10.22.03.34.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2019 03:34:07 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id t16so12306150wrr.1
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 03:34:07 -0700 (PDT)
X-Received: by 2002:a5d:4491:: with SMTP id j17mr2758012wrq.46.1571740446976;
 Tue, 22 Oct 2019 03:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
 <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com> <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
In-Reply-To: <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 22 Oct 2019 19:33:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
Message-ID: <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
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

On Tue, Oct 22, 2019 at 6:00 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> wt., 22 pa=C5=BA 2019 o 09:27 Tomasz Figa <tfiga@chromium.org> napisa=C5=
=82(a):
> >
> > On Tue, Oct 22, 2019 at 1:53 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> =
napisa=C5=82(a):
> > > >
> > > > Although in the most platforms, the power of eeprom and i2c
> > > > are alway on, some platforms disable the eeprom and i2c power
> > > > in order to meet low power request.
> > > > This patch add the pm_runtime ops to control power to support
> > > > all platforms.
> > > >
> > > > Changes since v3:
> > > >  - remove redundant calling function
> > > >  - change SIMPLE_DEV_PM_OPS to SET_RUNTIME_PM_OPS
> > > >  - change supply name
> > > >
> > > > Changes since v2:
> > > >  - rebase onto v5.4-rc1
> > > >  - pm_runtime_disable and regulator_bulk_disable at
> > > >    err return in probe function
> > > >
> > > > Changes since v1:
> > > >  - remove redundant code
> > > >  - fixup coding style
> > > >
> > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > > ---
> > > >  drivers/misc/eeprom/at24.c | 64 ++++++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 64 insertions(+)
> > > >
> > > > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.=
c
> > > > index 2cccd82a3106..68ced4f25916 100644
> > > > --- a/drivers/misc/eeprom/at24.c
> > > > +++ b/drivers/misc/eeprom/at24.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include <linux/nvmem-provider.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >  #include <linux/gpio/consumer.h>
> > > >
> > > >  /* Address pointer is 16 bit. */
> > > > @@ -67,6 +68,12 @@
> > > >   * which won't work on pure SMBus systems.
> > > >   */
> > > >
> > > > +static const char * const at24_supply_names[] =3D {
> > > > +       "vcc", "i2c",
> > > > +};
> > > > +
> > > > +#define AT24_NUM_SUPPLIES ARRAY_SIZE(at24_supply_names)
> > > > +
> > > >  struct at24_client {
> > > >         struct i2c_client *client;
> > > >         struct regmap *regmap;
> > > > @@ -91,6 +98,8 @@ struct at24_data {
> > > >
> > > >         struct gpio_desc *wp_gpio;
> > > >
> > > > +       bool has_supplies;
> > > > +       struct regulator_bulk_data supplies[AT24_NUM_SUPPLIES];
> > > >         /*
> > > >          * Some chips tie up multiple I2C addresses; dummy devices =
reserve
> > > >          * them for us, and we'll use them with SMBus calls.
> > > > @@ -662,6 +671,17 @@ static int at24_probe(struct i2c_client *clien=
t)
> > > >         at24->client[0].client =3D client;
> > > >         at24->client[0].regmap =3D regmap;
> > > >
> > > > +       regulator_bulk_set_supply_names(at24->supplies,
> > > > +                                       at24_supply_names, AT24_NUM=
_SUPPLIES);
> > > > +       err =3D  devm_regulator_bulk_get(&at24->client[0].client->d=
ev,
> > > > +                                      AT24_NUM_SUPPLIES, at24->sup=
plies);
> > > > +       if (err =3D=3D -ENODEV)
> > > > +               at24->has_supplies =3D NULL;
> > >
> > > I just gave this a spin and noticed that this will never happen - the
> > > regulator core will use a dummy regulator if none is defined in DT.
> > > The only way for this to make sense would be to use
> > > regulator_get_optional() for each supply separately. But actually I
> > > think we should just leave it this way and remove this if. In the end=
:
> > > this chip needs some power supply, so dummy regulator makes sense.
> >
> > Thanks for testing. I'd still like to make sure what happens on non-DT
> > platforms.
> >
> > I can see that the core returns the dummy regulator if
> > have_full_constraints() [1]. That is always true for DT systems, but
> > for others it's false by default, unless someone explicitly calls
> > regulator_has_full_constraints() [2].
> >
>
> Not tested yet, but from the code it looks like it will then keep
> returning EPROBE_DEFER which doesn't sound right really, especially
> since we're printing an error message too. Shouldn't it be -ENODEV?

That's an interesting finding. Liam, Mark, what's the proper way to
bulk get optional regulators?

Best regards,
Tomasz

>
> Bart
>
> > [1] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/=
core.c#L1787
> > [2] https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/regulator/=
core.c#L120
> >
> > Best regards,
> > Tomasz
