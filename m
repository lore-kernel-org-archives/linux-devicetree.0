Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B73C5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 14:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE5BD218AE
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 14:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G5FyoZ+e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfKGOcb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 09:32:31 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39189 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbfKGOca (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 09:32:30 -0500
Received: by mail-ed1-f67.google.com with SMTP id l25so2059086edt.6
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 06:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W4CQ5NwScQEOU/acYVzzlYBg+GuX4tskkNcdR3lHOiM=;
        b=G5FyoZ+e37f4ftKXloCIrVGUPaB/F++qIGmCW9A8KlLibq/95DLmhEjO0c20rpU46B
         ZahToXPMaGWCAv77I9dPU9CBl+uXNobAuv6R4u7iihWGGbbpEKiEnbhz4freC6nj8jZ4
         kxX5Wr4UPhCxcua6tk/Pzhkc2kLLpLkmM5ym4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W4CQ5NwScQEOU/acYVzzlYBg+GuX4tskkNcdR3lHOiM=;
        b=QCIRsfZKtHsMG1+OlI6oWqftj0sTG9fKl7PpenJSteRgQLpzYbmQI2RdB1n5ZqhQJz
         BO0xSaI01yDo/7ehK6Iop7kwrJ08xMkWfgVxvNftuxA+dQJyAN429dhMB1m7zsM2sUNZ
         9WPUmwqBf8uh1uzoq8f/fmLjw4skxLcaKzDiAEj+yPtF+4KaSaBsn6M26hRyDQ/UDapA
         HloqIoKiWcTiiwhdWEQii6NczJJIZXdBwQHB9UhPhXk7PpX2X2xcW2OZSBoIWov8JKep
         3kqJN+FJoqtLD6cIO5upHxn6uIQ7I1H9nMvH/jR4djXVLYy8ess+A6QawIFjOMpX7xMW
         XFCg==
X-Gm-Message-State: APjAAAXZZSGfoFDXAYBi7EpqFV5gpC5vojX34o3R+VbHxxp9L/42eqmo
        fDaWpVUOX9Mqk3XV/EDAUEnDB+jgaIFz9Q==
X-Google-Smtp-Source: APXvYqxRvBH/HomQO3CdSpouGmNOtm2Ho/mO0bAhblfafTP9y8HSK1oz3FkacYsAN5No1954CgeD5Q==
X-Received: by 2002:a05:6402:1006:: with SMTP id c6mr3920358edu.2.1573137147629;
        Thu, 07 Nov 2019 06:32:27 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id y91sm54178ede.54.2019.11.07.06.32.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 06:32:25 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id x4so2724497wmi.3
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 06:32:25 -0800 (PST)
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr3431851wmc.113.1573137144491;
 Thu, 07 Nov 2019 06:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com> <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
 <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
 <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
 <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com>
 <20191025211000.GA8235@bogus> <CAMpxmJUygTr2b+q-skb8_m9TfOiEvqoOCSjDQEi+sf9iNN0=BQ@mail.gmail.com>
 <1572230179.9186.2.camel@mtksdaap41>
In-Reply-To: <1572230179.9186.2.camel@mtksdaap41>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 Nov 2019 23:32:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bbpd5pQBCRQTEsDzQ67xxi5h8H3R_Un3fQ9780pCsTKA@mail.gmail.com>
Message-ID: <CAAFQd5Bbpd5pQBCRQTEsDzQ67xxi5h8H3R_Un3fQ9780pCsTKA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Bibby,

On Mon, Oct 28, 2019 at 11:36 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wro=
te:
>
> On Sat, 2019-10-26 at 14:05 +0200, Bartosz Golaszewski wrote:
> > pt., 25 pa=C5=BA 2019 o 23:10 Rob Herring <robh@kernel.org> napisa=C5=
=82(a):
> > >
> > > On Thu, Oct 24, 2019 at 06:32:38PM +0900, Tomasz Figa wrote:
> > > > On Thu, Oct 24, 2019 at 5:40 PM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > > >
> > > > > czw., 24 pa=C5=BA 2019 o 09:02 Tomasz Figa <tfiga@chromium.org> n=
apisa=C5=82(a):
> > > > > >
> > > > > > On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
> > > > > > <bgolaszewski@baylibre.com> wrote:
> > > > > > >
> > > > > > > pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediat=
ek.com> napisa=C5=82(a):
> > > > > > > >
> > > > > > > > In some platforms, they disable the power-supply of eeprom =
and i2c due
> > > > > > > > to power consumption reduction.
> > > > > > > >
> > > > > > > > This patch add two supply properties: vcc-supply, i2c-suppl=
y.
> > > > > > > >
> > > > > > > > Changes since v1:
> > > > > > > >  - change supply name
> > > > > > > >  - rebase to next
> > > > > > > >
> > > > > > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > > > > > > ---
> > > > > > > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 +++=
+++++
> > > > > > > >  1 file changed, 8 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.=
yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > > > index e8778560d966..578487a5d9b7 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > > > @@ -167,6 +167,14 @@ properties:
> > > > > > > >      minimum: 1
> > > > > > > >      maximum: 8
> > > > > > > >
> > > > > > > > +  vcc-supply:
> > > > > > > > +    description:
> > > > > > > > +      phandle of the regulator that provides the supply vo=
ltage.
> > > > > > > > +
> > > > > > > > +  i2c-sypply:
> > > > > > > > +    description:
> > > > > > > > +      phandle to the regulator that provides power to i2c.
> > > > > > > > +
> > > > > > >
> > > > > > > Something was bothering me about this patch so I came back to=
 take a
> > > > > > > look. Can you explain what i2c actually stands for in this do=
c? I hope
> > > > > > > I'm misinterpreting something and it isn't that the driver di=
sables
> > > > > > > the regulator powering the i2c bus controller?
> > > > > >
> > > > > > In our case it's the regulator that the I2C bus is pulled up to=
.
> > > > > >
> > > > >
> > > > > Then it has nothing to do with a generic EEPROM driver IMO. I thi=
nk
> > > > > you need to add the control for this regulator to your i2c contro=
ller
> > > > > driver and create a power domain where the EEPROM would be lower =
in
> > > > > hierarchy.
> > > >
> > > > While I agree that the generic EEPROM driver may not be the best pl=
ace
> > > > to do it, neither is a driver for a specific SoC i2c controller. Th=
e
> > > > hardware design is not specific to any particular i2c controller.
> > > >
> > > > Perhaps we need the generic i2c core to take into account an
> > > > i2c-supply? Wolfram, any thoughts on this?
> > >
> > > Sounds good to me. Maybe 'bus-supply' instead to indicate it's suppos=
ed
> > > to be for the bus and not other things. It should reside in the I2C
> > > controller's node (or mux ports) though.
> > >
> > > Rob
> >
> > Thanks,
> >
> > in that case Bibby: please just use a single regulator for vcc-supply i=
n at24.
>
> To my understanding, there are something I need to do.
> 1. remove i2c-supply property from DT.
> 2. just control vcc-supply in at24 driver.
> 3. add i2c-supply control in i2c and i2c-supply property in DT?
>
> Is there any mistakes?

Sorry for the late reply, just came back from a trip.

With the replacement of i2c-supply to bus-supply in 3), as suggested
by Rob, sounds good to me.

Best regards,
Tomasz
