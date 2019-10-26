Return-Path: <SRS0=rl0j=YT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E76CA9EBD
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 11:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A3E82070B
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 11:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="qCUMmIo0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfJZLyj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 26 Oct 2019 07:54:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35227 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJZLyj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 26 Oct 2019 07:54:39 -0400
Received: by mail-io1-f67.google.com with SMTP id h9so5480601ioh.2
        for <devicetree@vger.kernel.org>; Sat, 26 Oct 2019 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=95NF6ya59NaDwQCRMTuT7+DIGgKDYS13smU5I7TrWOE=;
        b=qCUMmIo0BbhCOq9lMzlReiKmqepVYdzM2YHifoI12iUkwr37TnSbvdjsnrTHq6ddmv
         bcNdWTRhsJCrcu7H+ZCbftfrVYkGrejXQxUsYqr0QnOt1tpYtB5fhjD+VdHrd1I4JVAH
         6A1H7nzmZSFyJykoe7ZXgjzmD1QlscU7jWstKtx1hQb0yQV1NCvVZmzgvp6XTgkrdojg
         BUcQh6tjpP7wwpI4YysReDIgQl3n2hB2IrwEpkfFIoVP4NOpQ/5bmGbGDqSwfXcn28+A
         cYAAqbFjVBQV/Ld6TFnMXKFf1zfkBRNDH5cO8RBSUUt6TuGkDcW+xW9PSAQ/48drX/SD
         eXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=95NF6ya59NaDwQCRMTuT7+DIGgKDYS13smU5I7TrWOE=;
        b=afRusUN7pzIUUYTuVvBOrBL0vlpFtEeCBHe0Mm6rYO58GYRA1H2lQSDiumNke6TLF2
         +3uOoPOGLU6zLKmefQvz2oDU9FDnZJL40C8/Xy9a+OzJoxAtexGmK2cFVwMONU4hMFql
         jbUl0+uIwteTeIAw2AAuDX1Ugel2pNVoxWFV+hzxA+vjptRbKwU6rd+K41i7jtat1//v
         03iRs0m5YZ0gpaeDSze4zfIE4aNM3aGgbkks2nOWvGu3vZVP0JUluaZYW+H6FcXLePax
         sRtctNLfkhG1GxMG3vobyPjXA87LeBwNPW9kzShHMKNrPaGzuB617mnEtpSitGLpd37d
         b6tQ==
X-Gm-Message-State: APjAAAWHinNJPUAJOoxA2vYY5gr39e1yVUkPbqcuPikmohJtM3UFhkhz
        U0ATTnz/D+95Fb5CnT9Kyf8o6oKpRP7biyWgtu2V8A==
X-Google-Smtp-Source: APXvYqxZwvpfOq9dYpYH92DZtvwRF1oK54mc+XbTMo9ELET5163QFqgxXpr4ovIlOhCTlZMuVH2hrmtKW1p9kGU4FRk=
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr6377672ioc.189.1572090877362;
 Sat, 26 Oct 2019 04:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191021124428.2541-1-brgl@bgdev.pl>
In-Reply-To: <20191021124428.2541-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 26 Oct 2019 13:54:26 +0200
Message-ID: <CAMRc=MeYS+rQMCEc_z1FudnremUhUsXnxdcB2heF6qdtOkH9uQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] dt-bindings: max77650: convert the device-tree
 bindings to yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

pon., 21 pa=C5=BA 2019 o 14:44 Bartosz Golaszewski <brgl@bgdev.pl> napisa=
=C5=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series converts all DT binding documents for MAX77650 PMIC to YAML.
>
> v1 -> v2:
> - use upper case for abbreviations in commit messages
>
> v2 -> v3:
> - pull all example fragments into the binding document for the core MFD m=
odule
> - fix all dt_binding_check errors
> - add references to submodules to the main binding document
> - drop the type for gpio-line-names
> - drop the description for the interrupts property
> - completely delete the previous txt files
>
> v3 -> v4:
> - remove unnecessary parts of descriptions, added details on the chip
> - correct file references (.txt -> .yaml)
> - fix mixing scalar and array constraints
> - dropped type refs for globally defined properties
>
> Bartosz Golaszewski (6):
>   dt-bindings: input: max77650: convert the binding document to yaml
>   dt-bindings: regulator: max77650: convert the binding document to yaml
>   dt-bindings: power: max77650: convert the binding document to yaml
>   dt-bindings: leds: max77650: convert the binding document to yaml
>   dt-bindings: mfd: max77650: convert the binding document to yaml
>   MAINTAINERS: update the list of maintained files for max77650
>
>  .../bindings/input/max77650-onkey.txt         |  26 ---
>  .../bindings/input/max77650-onkey.yaml        |  35 ++++
>  .../bindings/leds/leds-max77650.txt           |  57 -------
>  .../bindings/leds/leds-max77650.yaml          |  51 ++++++
>  .../devicetree/bindings/mfd/max77650.txt      |  46 ------
>  .../devicetree/bindings/mfd/max77650.yaml     | 149 ++++++++++++++++++
>  .../power/supply/max77650-charger.txt         |  28 ----
>  .../power/supply/max77650-charger.yaml        |  34 ++++
>  .../bindings/regulator/max77650-regulator.txt |  41 -----
>  .../regulator/max77650-regulator.yaml         |  31 ++++
>  MAINTAINERS                                   |   4 +-
>  11 files changed, 302 insertions(+), 200 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/max77650-onke=
y.txt
>  create mode 100644 Documentation/devicetree/bindings/input/max77650-onke=
y.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.=
txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.=
yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77650.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/power/supply/max776=
50-charger.txt
>  create mode 100644 Documentation/devicetree/bindings/power/supply/max776=
50-charger.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max77650-=
regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/max77650-=
regulator.yaml
>
> --
> 2.23.0
>

Hi Rob,

thanks for reviewing the series. Can you please take it through your
tree for v5.5? I think it'll be easier than bothering all the
respective maintainers and it only touches on bindings anyway.

Thanks,
Bartosz
