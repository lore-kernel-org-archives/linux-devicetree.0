Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCEAC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 05:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E590921D91
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 05:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQ/GVbGN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgDQFbo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 01:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgDQFbn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 01:31:43 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5453C061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 22:31:43 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id f13so428875ybk.7
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 22:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0c8CU6UtpIsumixgH+9DRIIViSBvNa3IxwwnOZGcCmw=;
        b=AQ/GVbGNHAYyBWRynOxtQpPmnLcJ4m7oVq7VKtLqWIHzQhRk9K9VNNGYZgR6y7hmjT
         M45dhSwYIeSdCAO2w3tgdgdH2LqrFH08AcNpXtwLp7uJxCg8vV5i5qjd/PvsHjwFFA82
         umsF8jdUh5v77q5OpLgbRlHuHY98q4v0T28O6e+HWV8b1imx5N0Vi5t/49HR3gQOrYWS
         334IZvkq9V5k8SxtDD1kH2+47g2GNk1yBgXc9nV5bziL7mVTIzfQi/m7d1WUvmucltNM
         EMjLdS1IIL1XYUZZ7MHrDKGMh/Pws0NMYwBk+tIepzcf1BG5wOoW9SGSnV+deD5T05dS
         0/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0c8CU6UtpIsumixgH+9DRIIViSBvNa3IxwwnOZGcCmw=;
        b=e+023/SIWxLkitXgCba8VhjAkuLS+k/vyWxClyJbWq4CO5a+l/OH7iwAmOvf0Z7pIt
         XkhrygPowpC/4OcGp+gmGb8QfdOrcmx41douBAwbfna88rRa4q5USl44L4jEnW3u+VDU
         4tLF6xZABvy5aPtFuKm8DKiF7Mt29hg9L57Eta2muFw8KmKLQMbLW4YwS4a8aJWvsxZK
         n1C8vdqgWdVR94MUsV6YG1TUc2nj1Xf+nCMB3L4mKvjZXGsc78X/hNVXKDmWWtkMhoUY
         iBqRSF3nSLTGdQimqXGaRcy5bMx3jfSro3UwchP9AYczLJ0M7vV+rK4qngF1+9TYcAOj
         qLfg==
X-Gm-Message-State: AGi0PubCA8Sgq3awNssMy017BUyCoB1BhuqvgCXWlRy2Yt9EE3cfUuaN
        Aodr1YNdzyP+ouFRTUrR+njr/ROx2f4lkY9LAkUX5Q==
X-Google-Smtp-Source: APiQypKVUFJl3i6hUC9fHF/BYwWjbOVWRL+Iwke1m9Z28VscxwNwjqfki0hg8NR7UST1ZPct2R+6OMV4z7i4usyW4X8=
X-Received: by 2002:a25:9cc3:: with SMTP id z3mr3266192ybo.234.1587101502803;
 Thu, 16 Apr 2020 22:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <158614147708.29424.2884940487411120526.stgit@localhost>
In-Reply-To: <158614147708.29424.2884940487411120526.stgit@localhost>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Fri, 17 Apr 2020 14:31:31 +0900
Message-ID: <CAA93ih2ineuFYzA_uhGwmzsznDKacEG=7rK1beWsCkrnR0opuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] dts: uniphier: Add Akebi96 Board support
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Yamada-san,

Could you review this series?

Thank you,

2020=E5=B9=B44=E6=9C=886=E6=97=A5(=E6=9C=88) 11:52 Masami Hiramatsu <masami=
.hiramatsu@linaro.org>:
>
> Hello,
>
> Here is a couple of patches to add a devicetree for Akebi96 board.
> The Akebi96 is a certified 96boards which is based on Socionext
> UniPhier LD20 SoC. Most of the part is similar to LD20 reference
> board, but there are some changes.
>
>   - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
>   - Simple frame buffer with 1080p fixed resolution.
>   - I2S port which is connected to aout1b instead of aout1.
>   - 3 serial ports, only serial3 has CTS/RTS.
>   - No NAND, only eMMC on the board.
>   - OP-TEE support.
>
> See https://www.96boards.org/product/akebi96/ for details.
>
> Thank you,
>
> ---
>
> Masami Hiramatsu (2):
>       dt-bindings: arm: Add Akebi96 board support
>       arm64: dts: uniphier: Add support for Akebi96
>
>
>  .../bindings/arm/socionext/uniphier.yaml           |    1
>  arch/arm64/boot/dts/socionext/Makefile             |    1
>  .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  200 ++++++++++++++=
++++++
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |    2
>  4 files changed, 203 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.d=
ts
>
> --
> Masami Hiramatsu <masami.hiramatsu@linaro.org>
>


--=20
Masami Hiramatsu
