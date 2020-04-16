Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6671CC2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D95921734
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 11:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632980AbgDPLUg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 07:20:36 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53779 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632975AbgDPLUd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 07:20:33 -0400
Received: from mail-qv1-f49.google.com ([209.85.219.49]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MuDPh-1j6o4C3Hq9-00uaJK; Thu, 16 Apr 2020 13:12:01 +0200
Received: by mail-qv1-f49.google.com with SMTP id y19so1575640qvv.4;
        Thu, 16 Apr 2020 04:12:01 -0700 (PDT)
X-Gm-Message-State: AGi0PubRT2SdYTkhIEjJSZmqyTc0qSMC/rqcVrbySVmMnMRFiBtUWHra
        4u3zl+sq1SfKxlSNwIzblvmJJAtajZ24vv1trIg=
X-Google-Smtp-Source: APiQypKUBOB6XQd2d+M75WuZ0DqJUTG/HnuwXa8550Av2Y6bO9ZONTvLBnhPRU7U+ROebImWwMBgxhHTnpmmhVTBibs=
X-Received: by 2002:a0c:a602:: with SMTP id s2mr9756889qva.222.1587035520523;
 Thu, 16 Apr 2020 04:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <1586937773-5836-1-git-send-email-abel.vesa@nxp.com> <1586937773-5836-3-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1586937773-5836-3-git-send-email-abel.vesa@nxp.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Apr 2020 13:11:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Zd8Pctn9ra9dH7bTUSSMoTOwmDNOc6JwmKQA4fgdpWw@mail.gmail.com>
Message-ID: <CAK8P3a1Zd8Pctn9ra9dH7bTUSSMoTOwmDNOc6JwmKQA4fgdpWw@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] Documentation: mfd: Add DT bindings for i.MX Mix
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+sq+YMxtlC9OU/qKkZhu9BGJJ5gWuzZ4Ytnc0jfFhmWzcXtl8+M
 Q95Yh2SeJzbVsDYPxBAg+r4yfopOTdjV65qorKsHYDqfkavkuHc23AZjKcoTXN1ULekS/Rh
 gKZ/WDwKJkGbVkbIcexDMUqmPwWYE64i/VuZ/s7HV8H7v3g7stGbn9SBDKw46MmNCPp/Eej
 s6MydABCpcfdbZ9dV0LGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jl6vHJ1V/1U=:ZRcBPpxFiW8p6MVpmN+zWk
 vLa9OvxZlR++s2KsGj9CVS97sxOvY5RtyeydcB6yqPhX/GHCQ4QqxhFRgwcPynLi2BwKjYQ8y
 lC6vN1FOC0d1XFVxIr+NKw2x5KjOGBEpCbw66Imvy82I7MVRWoqxzn+w0wbeFlfSLMAvjhJH5
 hFkpvP1YQ8OGvaZLcdXHqwrLI9dm//dihHjtQ7lQDY+V+pXggZmKPqMI4bToXYpTq9R7TYI9J
 sKIPXp5O2Y7oYSSSUP/ZRTcinGKPnvWdmrdRGbWuhANyAdtwsTaWHamBtALAkMqooJOfm/kPO
 OhK1jtf/bvS0pl2bevgXLp3kPACc3dVWuQl8jrbbzgAMv66FHXYPtRM/Wr4pjFIYidT4tPsRv
 0VxBukLrHu6D41PtIDXrBHrNvdA23eaqurvC8P9ryw1OLlW3bbxVrDurq15YfUvH/OLj1RMtR
 Ge/BbtKNR1p+IjkkB24sxTogz/mzCq2KUFQA9H8sjMOFl3E97dftnqjkFriIkFDP7yQ2rvz6j
 UvzRMvmkNiuCY1NpdI265tgf9sv70YrjHgTB0Fh4RZD2SKJzgzvyUvDlwHxI/D9j4iihy3F98
 2xw7HXocfJJg88iApoLL0O6u3+/qVyEASwcpeGZltPSt68SM0Q5AjbEBFvUgtJwIyfmMQSLAp
 Obs2l0SZ7R8ChbjDtpwOWGhJWHftND2YHsacezHBS8hqEE6+xYU5MgxlsgaLoNWzct8nd9jWd
 it18o5V9h+7X+Biu4RQXDAdZ2LROc2tcof6LLn6Nqjy/P8kRUXg0aWHYulhpDuQKVLId2Sxhw
 ieam0ikNqycLPNn26At34F3EuMvm1zEwrjRHax2bOoz/HL6cUs=
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 15, 2020 at 10:05 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> Documnent the i.MX Mix with its devicetree properties.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  .../devicetree/bindings/mfd/fsl,imx-mix.yaml       | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx-mix.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx-mix.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx-mix.yaml
> new file mode 100644
> index 00000000..8b1870e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fsl,imx-mix.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/fsl,imx-mix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX mix
> +
> +description: |
> +  i.MX mix is a conglomerate of different GPRs that are
> +  usually dedicated to one subsystem. These GPRs can be
> +  further split between different types of drivers, once
> +  the MFD populates all the devices based on its devicetree
> +  subnodes.

This does not describe the hardware but the implementation in Linux.
Please rephrase it to not independent of the software that interprets
the DT nodes.

       Arnd
