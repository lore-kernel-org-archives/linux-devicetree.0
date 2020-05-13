Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D70EC2D0FA
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 08:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E97420740
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 08:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="I333cevq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgEMIJv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 04:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729872AbgEMIJv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 04:09:51 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D8BC061A0C
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 01:09:49 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id d7so17108600ioq.5
        for <devicetree@vger.kernel.org>; Wed, 13 May 2020 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9UilNQk9S4BvXv27MvSXEo2VXDVsyD3FnEfjySXek3Q=;
        b=I333cevq/ZiYLBB2UEqQvcKtAGvuyLJZxdyLz+dw9rtzdUG3Rn5bsG6b+cpl7WJ7be
         gTKIH/JsA1vPwstSt1K87Da84h3nS6SdQlUWK+QTnSAYwi+CjJ/aL+J8zawKW++FhJMQ
         aAWwxITol5cIJWKXZHPmGp5Bv26XE5m8HS8GVMXZPkz9eAufEiFF137yzG71eVK31Y0h
         GRCKTv29IzTe96QDVL3EExYOvg7/+4BsAH4/rwxaCg0aboPZ4fdHNA+ZSezFo4H59XIF
         6YgL3Ztsxu7NdaF62XFuH+8rQKy6pIHash3BieKanuFtjzs07HWpQii/lNhRuYgekHNs
         jZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9UilNQk9S4BvXv27MvSXEo2VXDVsyD3FnEfjySXek3Q=;
        b=UQR0AZ/P2kwkmMt2A9eMhDYUprxz5fKZvw7yyFXGGwjAwW3Iu6nXpNsZWD1tKTEJ7i
         Gjh2da+oS2CnEN714NenNIOHvY0T+ZKig++SVRlHL8dVEa2KisFU1jDXcv9g4OK3VZTZ
         U6Z/yYRkGN0Iu5pb0hE1dDRd9wBgWXAfayduGzT2W+daVCC0dZPl7SQEk6/44fnxAsyu
         +HPpZj4qE2r8P31MgGxpirWEyQGChcJs9QoWZ58O8y9EG5PbfJbVSkSFUQ1Yj+PkfVxo
         lith+I78BzO7+2qU+KDKBODxfClof6l0cpeAt2Vp17qkZKB+Zk0racM4u3wLUtB/0Cdk
         Ma5w==
X-Gm-Message-State: AGi0PubIeEl/2UePTtPL88JqelLhfGRFjk3QOYiTDFOMGK9l3W9VIQHj
        jUNExPPdw27YicL3lDHPxWP7bnfpfQN0axSFIJTWEQ==
X-Google-Smtp-Source: APiQypLSKZpPbpZGWbIa6OCLB4vXnavWGW3O9jfduY7qGPjrWI211lZ+fRr7Evkrpn1Sok32KOFfgRA0O4qxfjO7Hmw=
X-Received: by 2002:a05:6602:2dd4:: with SMTP id l20mr1335649iow.13.1589357388989;
 Wed, 13 May 2020 01:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl> <20200505140231.16600-2-brgl@bgdev.pl>
 <20200513023855.GA23714@bogus>
In-Reply-To: <20200513023855.GA23714@bogus>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 May 2020 10:09:38 +0200
Message-ID: <CAMRc=MfScMKPMNeFAMA=6ObhFkU8T=8a+dVyiUyvGOXyBG8H=g@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: add a binding document for MediaTek
 PERICFG controller
To:     Rob Herring <robh@kernel.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=C5=9Br., 13 maj 2020 o 04:38 Rob Herring <robh@kernel.org> napisa=C5=82(a)=
:
>
> On Tue, May 05, 2020 at 04:02:21PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This adds a binding document for the PERICFG controller present on
> > MediaTek SoCs. For now the only variant supported is 'mt8516-pericfg'.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../arm/mediatek/mediatek,pericfg.yaml        | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/medi=
atek,pericfg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pe=
ricfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericf=
g.yaml
> > new file mode 100644
> > index 000000000000..74b2a6173ffb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.y=
aml
> > @@ -0,0 +1,34 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,pericfg.yaml=
#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: MediaTek Peripheral Configuration Controller
> > +
> > +maintainers:
> > +  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
>
> Don't need oneOf.
>
> > +      - items:
> > +        - enum:
> > +          - mediatek,pericfg
>
> PERICFG is exactly the same register set and functions on all Mediatek
> SoCs? Needs to be more specific.
>
> > +        - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pericfg: pericfg@10003050 {
> > +        compatible =3D "mediatek,mt8516-pericfg", "syscon";
> > +        reg =3D <0 0x10003050 0 0x1000>;
>
> Default for examples is 1 cell for addr and size.
>
> > +    };
> > --
> > 2.25.0
> >

Hi Rob,

I somehow missed the fact that there already is an old-style txt
binding document for pericfg. I'll first convert it and then add the
new compatible.

Bart
