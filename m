Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53716C2D0B1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 04:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2655820720
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 04:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="d5i1wkGo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgBFEYc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 23:24:32 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43082 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgBFEYc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 23:24:32 -0500
Received: by mail-pg1-f195.google.com with SMTP id u131so2052193pgc.10
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 20:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=r/EB8vKdOIGyVfGGy6ndAk8y4CEDnzKKwajRB6fo/Ug=;
        b=d5i1wkGoQkBN525LDzVEZ0hZ3DF4hypWZWxm1A/fAHdx6Yjz4Pp12sPCvi0cvD6YyD
         i2BI57Hq8nrXcrgN1cwi2p1c1lruK315q9JpHznHXWUeZt8Xd93Manl205Bj2NmklVqk
         4fWlakzK2wmpDXvM4/ur/68mr3jWamNU/zHug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=r/EB8vKdOIGyVfGGy6ndAk8y4CEDnzKKwajRB6fo/Ug=;
        b=anWY6aj7niih8LgEHbHrAc3fI1es+YG224NFsxd2Q20ZY+oKtiTN/gcWCdVGjHpFbD
         SvQCnRN2YSHEoSCBsBdePiW+h9mA4umSlwQziM5r7V/CEHEjUp0XD2+pIRHiaGVULPLf
         ivWVInVYGYA1vnhYMvvIM2j/EYQXBm8s3Anx9is7I5R2/UeViblSSmIrAIbo7+uOAmLh
         gc26oDED/9zQQiVKetwZifUSfSn7dWjDWE/HL11IuM7ck6levM98aSHEgm+xFqWW6OnO
         C/5Cm4B42wV9msxf6tFsGR2twL130b7/1UlvyT83Q2tWkSF/zfVxBYfZ3pJAeOYOtwkl
         KuGQ==
X-Gm-Message-State: APjAAAWyXx5J3pCaIbOpW/R+AgHh82LzZe4Mq7FNryP++wgpt0ouAU1l
        yNqGQ0LAkqnmtcMBw3aSB2x1ig==
X-Google-Smtp-Source: APXvYqw5d4n+gmSHrGnvae8L9c3b94CQRh9KoCreL3P3Td4dguhV2Ah/+dFtVSjeCvz9jw7f3R0bPw==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr1750129pfh.92.1580963071778;
        Wed, 05 Feb 2020 20:24:31 -0800 (PST)
Received: from [192.168.139.53] (50-196-3-218-static.hfc.comcastbusiness.net. [50.196.3.218])
        by smtp.gmail.com with ESMTPSA id r145sm1126382pfr.5.2020.02.05.20.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 20:24:31 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 3/3] dt-bindings: iio: chemical: consolidate atlas-sensor docs
Date:   Wed, 5 Feb 2020 20:24:30 -0800
Message-Id: <214E66BE-6839-45DA-A676-103CC10FAF4A@konsulko.com>
References: <20200205164027.GA1992@bogus>
Cc:     linux-iio@vger.kernel.org, jic23@kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20200205164027.GA1992@bogus>
To:     Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (17D50)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



> On Feb 5, 2020, at 08:40, Rob Herring <robh@kernel.org> wrote:
>=20
> =EF=BB=BFOn Wed,  5 Feb 2020 11:04:21 +0200, Matt Ranostay wrote:
>> Since Atlas Scientific device support only varies from the compatible
>> string is ideal all the respective docs are merged into a single doc
>> named atlas,sensor.yaml
>>=20
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
>> ---
>> .../bindings/iio/chemical/atlas,ec-sm.txt     | 21 --------
>> .../bindings/iio/chemical/atlas,orp-sm.txt    | 21 --------
>> .../bindings/iio/chemical/atlas,ph-sm.txt     | 21 --------
>> .../bindings/iio/chemical/atlas,sensor.yaml   | 53 +++++++++++++++++++
>> 4 files changed, 53 insertions(+), 63 deletions(-)
>> delete mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,e=
c-sm.txt
>> delete mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,o=
rp-sm.txt
>> delete mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,p=
h-sm.txt
>> create mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,s=
ensor.yaml
>>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> warning: no schema found in file: Documentation/devicetree/bindings/iio/ch=
emical/atlas,sensor.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/c=
hemical/atlas,sensor.yaml: ignoring, error in schema: $id
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:2=
1.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node mu=
st be at root node
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/c=
hemical/atlas,sensor.yaml: $id: 'http://devicetree.org/schemas/iio/chemical/=
atlas,sensor.yaml##' is not a 'uri-reference'
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Document=
ation/devicetree/bindings/iio/chemical/atlas,sensor.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/iio/chemical/atlas,sensor.=
example.dts] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>=20
> See https://patchwork.ozlabs.org/patch/1233724
> Please check and re-submit.

Gah will do...=20

- Matt=
