Return-Path: <SRS0=4d9G=5W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A2C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Apr 2020 19:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00D7120753
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Apr 2020 19:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="WhAwEyU6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDFTFy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Apr 2020 15:05:54 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35936 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFTFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Apr 2020 15:05:54 -0400
Received: by mail-vs1-f68.google.com with SMTP id 184so592078vsu.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2020 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CQD+C9Kg+kaXZdnpmDMOsE8KjUIcSylxGT9eltj8hNc=;
        b=WhAwEyU65nt+MH7u4Sm52detAfx9AIKlU92gMP8ZZjnP/YTmwEGd/LbcN7xKL2hE51
         k33IGFnYJNF81bp0cgu0ieHEO2nG2fgKfkeph9q5+J1j823v87d70SIQf5G5cmin7U33
         fJ595tv9GlciDWOEG78lrS0WKo0atnz3Pf9p5SgHb24u7KJue2mUW3Rj8gaaTBMZfkZ3
         tO1eq65TrQU0gUuBsACWKiy/EeyYYoJBz5BX/ZJFmU7pZ5BpCrs00HvnPh5d3nk0XN7M
         QiMV9X/r+33J0rScDcEvCa6HdGp9/8CL/c9ItWBlLbfswn4+hM9psHLM0KescvXJSasR
         5izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQD+C9Kg+kaXZdnpmDMOsE8KjUIcSylxGT9eltj8hNc=;
        b=Gv+/CKpM5zA5eJXxH1G7ISIhLruvOflINRnlWxM6TXrD1l+M+J59rKJRg+qC98Bu7A
         VyieA4ar58wlFcvQfOiVFcsBsT2m62AacEuJq8FmLGn/3l2zRay01wF6bH+RHMODmLp4
         5gULg6Dueoz+pjTA1nGMH5Aj5g+agetBTPy0AybdvHSVJLs+8Pwp9QrXn39i7v+QAtv6
         VUJrIMgB1QoP8v8p/sfMGl9G7vSBcOuOXvcogOWwZwlbtjC9Am6VbLaPnBx31JBmPulx
         VHVCpGd4fovYEyoy1Si97mx9PDCWCJ7IjPmZGY9pQI9K512armB4dCLZw7CdFQoBt1r+
         mROw==
X-Gm-Message-State: AGi0PubCPojwI1cvGENcZCpqJQbWZxH7WxlRTd5KAqbdFopJARybxKj8
        lyFhNaZWFIOg8All6ISDMhRlkqKzxGrnaFsZXBO/6g==
X-Google-Smtp-Source: APiQypLdrhoD1+TZ4jdw1dsDSA7rmF0tkHvtxRtrwnEQz6g0MHUDl4HPqBpBqlQNHeEaYI9LDwzy6jJDIgV2779T/zM=
X-Received: by 2002:a05:6102:5c5:: with SMTP id v5mr1064068vsf.9.1586199952066;
 Mon, 06 Apr 2020 12:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200331075356.19171-1-j-keerthy@ti.com> <20200331075356.19171-5-j-keerthy@ti.com>
In-Reply-To: <20200331075356.19171-5-j-keerthy@ti.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 7 Apr 2020 00:35:41 +0530
Message-ID: <CAHLCerOwqOmGRotiofs_xtB9XEa-YUwYWFgJGNMXQqifW+azAA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: am6: Add VTM node
To:     Keerthy <j-keerthy@ti.com>
Cc:     Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>, t-kristo@ti.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 31, 2020 at 1:24 PM Keerthy <j-keerthy@ti.com> wrote:
>
> VTM stands for voltage and thermal management. Add the vtm node and
> the associated thermal zones on the SoC.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
> index f4227e2743f2..54a133fa1bf2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
> @@ -89,4 +89,15 @@
>                 clocks = <&k3_clks 59 0>;
>                 clock-names = "gpio";
>         };
> +
> +       wkup_vtm0: thermal@42050000 {
> +               compatible = "ti,am654-vtm";
> +               reg = <0x42050000 0x25c>;
> +               power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
> +               #thermal-sensor-cells = <1>;
> +       };
> +

Make this patch 3

> +       thermal_zones: thermal-zones {
> +               #include "k3-am654-industrial-thermal.dtsi"
> +       };
>  };

Move this with what is currently patch 3.

> --
> 2.17.1
>
