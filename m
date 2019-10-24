Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C3ECA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 09:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92B302166E
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 09:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f8xfaILp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390246AbfJXJcz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 05:32:55 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33410 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732686AbfJXJcy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 05:32:54 -0400
Received: by mail-ed1-f66.google.com with SMTP id c4so18127101edl.0
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HlmghVPRqXMDHcFCrytgGe2/PcZ6/wl0Jdf37zxv8NU=;
        b=f8xfaILpiaFdUq6D8A3pkLgL5b7uNqoBpjJdiqWLF1jdE22Zfswa373xjwwewCF80q
         +XXBcmwyQaOZBCH/V6et1zLRiyX9ubQdRERpKzS6sgIQ53tyvC84dT0sYlWp+itahXzq
         CgmLVfucy11zd3XKhypZOkjILl1CpA4cpMXiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HlmghVPRqXMDHcFCrytgGe2/PcZ6/wl0Jdf37zxv8NU=;
        b=e/JqFucrnRGSVEjOR835Ljb/L+uP8maNDGw+I7xgRiMqh4UfyekGjHprEmR+pfmIc3
         kNnLQFOxhObuNRhQN+czI5rgGLAGWcH0zPMB6BtzMGowOMf8W2yACZ5H+q5AjdMxvCEj
         ZgD6X2qQa7i0zad9t0UuclJTXxX1v1k239BbN/7cPmiPQHFSh67BkpH/bmeJdyXBJCRp
         ouFNFedJXxZ4onXYwbKNAAORDmWa1748tr1CTumQoqAO/U/ow5/NUuOVWoWF6gBTPXkB
         /bD8uel2TLAQ9bvBtuSAbT+XjUm/gMPnWTvwe+lohmyzFzCYK/l9vjDW4z/VGqyprNHW
         nxOA==
X-Gm-Message-State: APjAAAVslG4bwLvYl27PEocAxbM7R4tBPnG+MOySSRzj+71i0MisuRGW
        fzc6EtZIBFVwbc22uS6syv5AP2ZT3F2iGQ==
X-Google-Smtp-Source: APXvYqx7cgGYytiwBGDalJkeWAo2e67Gy+ujpXivy/5i3I/AlVDs8dotvzJoFYQ2aAUI8eUFRGk54w==
X-Received: by 2002:a17:906:b347:: with SMTP id cd7mr2018363ejb.105.1571909572779;
        Thu, 24 Oct 2019 02:32:52 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id s8sm408880edj.6.2019.10.24.02.32.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 02:32:51 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id v9so13972739wrq.5
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 02:32:50 -0700 (PDT)
X-Received: by 2002:adf:e446:: with SMTP id t6mr2857004wrm.7.1571909569678;
 Thu, 24 Oct 2019 02:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com> <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
 <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com> <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
In-Reply-To: <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 24 Oct 2019 18:32:38 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com>
Message-ID: <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>
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

On Thu, Oct 24, 2019 at 5:40 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> czw., 24 pa=C5=BA 2019 o 09:02 Tomasz Figa <tfiga@chromium.org> napisa=C5=
=82(a):
> >
> > On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> =
napisa=C5=82(a):
> > > >
> > > > In some platforms, they disable the power-supply of eeprom and i2c =
due
> > > > to power consumption reduction.
> > > >
> > > > This patch add two supply properties: vcc-supply, i2c-supply.
> > > >
> > > > Changes since v1:
> > > >  - change supply name
> > > >  - rebase to next
> > > >
> > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/D=
ocumentation/devicetree/bindings/eeprom/at24.yaml
> > > > index e8778560d966..578487a5d9b7 100644
> > > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > @@ -167,6 +167,14 @@ properties:
> > > >      minimum: 1
> > > >      maximum: 8
> > > >
> > > > +  vcc-supply:
> > > > +    description:
> > > > +      phandle of the regulator that provides the supply voltage.
> > > > +
> > > > +  i2c-sypply:
> > > > +    description:
> > > > +      phandle to the regulator that provides power to i2c.
> > > > +
> > >
> > > Something was bothering me about this patch so I came back to take a
> > > look. Can you explain what i2c actually stands for in this doc? I hop=
e
> > > I'm misinterpreting something and it isn't that the driver disables
> > > the regulator powering the i2c bus controller?
> >
> > In our case it's the regulator that the I2C bus is pulled up to.
> >
>
> Then it has nothing to do with a generic EEPROM driver IMO. I think
> you need to add the control for this regulator to your i2c controller
> driver and create a power domain where the EEPROM would be lower in
> hierarchy.

While I agree that the generic EEPROM driver may not be the best place
to do it, neither is a driver for a specific SoC i2c controller. The
hardware design is not specific to any particular i2c controller.

Perhaps we need the generic i2c core to take into account an
i2c-supply? Wolfram, any thoughts on this?

Best regards,
Tomasz
