Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:43432 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753951Ab3G2QPn (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2013 12:15:43 -0400
Received: by mail-oa0-f50.google.com with SMTP id i4so744043oah.37
        for <devicetree@vger.kernel.org>; Mon, 29 Jul 2013 09:15:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1374564964-1281-1-git-send-email-ldewangan@nvidia.com>
References: <1374564964-1281-1-git-send-email-ldewangan@nvidia.com>
Date: Mon, 29 Jul 2013 18:15:42 +0200
Message-ID: <CACRpkdaemxzMmenWVN6H3Bq2O-_AB2Qb0Oj+xBOwhscr2_VGTA@mail.gmail.com>
Subject: Re: [PATCH V4] gpio: palmas: add dt support
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kishon@ti.com, j-keerthy@ti.com, Graeme Gregory <gg@slimlogic.co.uk>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 23, 2013 at 9:36 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Add of_device_id table for Palma GPIO to be enable the
> driver from DT file.
>
> The driver can be registered from DT file as:
>         palmas: tps65913@58 {
>                 :::::::::::
>                 palmas_gpio: palmas_gpio {
>                         compatible = "ti,palmas-gpio";
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                 };
>         };
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Long back, I sent the similar patch but it was paused due to the DT binding.
> http://lkml.indiana.edu/hypermail/linux/kernel/1304.2/00261.html
>
> Now, PMIC DT binding is already finalised and as per mfd binding, we can
> go ahead with similar approach for gpios. pmic and other palams sub devices
> are already following the same approach.
>
> Sending 3rd version of the change which is same as per code is related but
> adding devicetree binding document for gpio also at this time.
>
> Changes from V3:
> - Added description in DT binding document for second arg of gpio cells.

Patch applied with Stephen's ACK.

Yours,
Linus Walleij
