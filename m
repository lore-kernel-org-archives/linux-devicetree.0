Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BACBCA9EC0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 23:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D95A4208C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 23:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572305381;
	bh=7Gaaf6qwiBEYhOFxiCWLOekDtJw6Ox4++B/1fEyh4/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=WWW6D2WtN5KpJbeLx0YWYw4oBUhJ/fj9ad/2RXp4Jp3JQWDoeH5TxJV7E/WhuiEnf
	 8xtOFb1RY3Pp0TLzcAJl8g2TpCto84p4pvraDeqYdaYQUf7fsXK7Tijgf5+sCO7VbC
	 0l/iajAQ6ntzaWqzh2ThvX+j6MvASkkiU1sR0kCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfJ1X3l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 19:29:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfJ1X3l (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 28 Oct 2019 19:29:41 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DB83208C0
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572305380;
        bh=7Gaaf6qwiBEYhOFxiCWLOekDtJw6Ox4++B/1fEyh4/k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r6Be/t5h+cVOxrGvrcglVP5hJwDvjL5PLKNDq90oCNRJLp9UcsbiZpQ/MqVTTFM7D
         MPfnkF5Oh2r9PkgqTr1XvHrvyE9ICsO86YKWf9p2o/vI04SyzrzoOc6wbIkJ/rU7KC
         iwwFa19gEZ3MuO1igXE9398TuK4RMhNOST+UF9fc=
Received: by mail-qt1-f180.google.com with SMTP id t8so17344102qtc.6
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 16:29:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVwOYVJtzNSf2imPxRSWS82aKhztm5GfVQbkf2pYDkiolrXJ/MZ
        5BKhSKAZgDTKeKfxG3CMU5wWwYoHCx2ZXaIc/A==
X-Google-Smtp-Source: APXvYqw0R7s1hrV6VYjOGPRDkr+OyJrA+Qw1rwyUmS5BM2DLn9OgWHjM15sPoWVzEF/ayMDFYuIjBF4P3C3Nu05OPqg=
X-Received: by 2002:a0c:ed29:: with SMTP id u9mr4303137qvq.136.1572305379547;
 Mon, 28 Oct 2019 16:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191021140816.262401-1-nuno.sa@analog.com> <20191021140816.262401-2-nuno.sa@analog.com>
In-Reply-To: <20191021140816.262401-2-nuno.sa@analog.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 28 Oct 2019 18:29:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_9pWQMbqyBuKGJQuxaoeUSbPGj4Y22z0yUK-oa1OSAQ@mail.gmail.com>
Message-ID: <CAL_JsqL_9pWQMbqyBuKGJQuxaoeUSbPGj4Y22z0yUK-oa1OSAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Oct 21, 2019 at 9:08 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> This changes are in accordance with the review done to this bindings.
> This is a follow-up patch to 969d49b2cdc8.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  .../bindings/sound/adi,adau7118.yaml          | 25 ++++++++-----------
>  1 file changed, 10 insertions(+), 15 deletions(-)

Still some issues here...

>
> diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/=
Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> index cfcef602b3d9..c3f10afbdd6f 100644
> --- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> +++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> @@ -26,13 +26,11 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>
> -  IOVDD-supply:
> +  iovdd-supply:
>      description: Digital Input/Output Power Supply.
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
>
> -  DVDD-supply:
> +  dvdd-supply:
>      description: Internal Core Digital Power Supply.
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
>
>    adi,decimation-ratio:
>      description: |
> @@ -58,23 +56,21 @@ properties:
>  required:
>    - "#sound-dai-cells"
>    - compatible
> -  - IOVDD-supply
> -  - DVDD-supply
> +  - iovdd-supply
> +  - dvdd-supply
>
>  examples:
>    - |
> -    i2c0 {
> +    i2c {
>          /* example with i2c support */
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> -        status =3D "okay";
> -        adau7118_codec: adau7118-codec@14 {
> +        adau7118_codec: audio-codec@14 {

Documentation/devicetree/bindings/sound/adi,adau7118.example.dts:21.44-29.1=
5:
Warning (i2c_bus_reg): /example-0/i2c/audio-codec@14: I2C bus unit
address format error, expected "e"

Unit-address should be in hex.

>                  compatible =3D "adi,adau7118";
>                  reg =3D <14>;
>                  #sound-dai-cells =3D <0>;
> -                status =3D "okay";
> -                IOVDD-supply =3D <&supply>;
> -                DVDD-supply =3D <&supply>;
> +                iovdd-supply =3D <&supply>;
> +                dvdd-supply =3D <&supply>;
>                  adi,pdm-clk-map =3D <1 1 0 0>;
>                  adi,decimation-ratio =3D <16>;
>          };
> @@ -84,7 +80,6 @@ examples:
>      adau7118_codec_hw: adau7118-codec-hw {
>              compatible =3D "adi,adau7118";
>              #sound-dai-cells =3D <0>;
> -            status =3D "okay";
> -            IOVDD-supply =3D <&supply>;
> -            DVDD-supply =3D <&supply>;
> +            iovdd-supply =3D <&supply>;
> +            dvdd-supply =3D <&supply>;
>      };
> --
> 2.23.0
>
