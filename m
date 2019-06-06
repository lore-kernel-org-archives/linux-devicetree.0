Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34723 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfFFUC4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Jun 2019 16:02:56 -0400
Received: by mail-ot1-f68.google.com with SMTP id z24so3185901oto.1
        for <devicetree@vger.kernel.org>; Thu, 06 Jun 2019 13:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com> <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
In-Reply-To: <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 22:02:44 +0200
Message-ID: <CAFBinCB+W8F9PL4ZgiQJxXu7qmgfORgbPB=6AM-kzXmChpjWyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Enable secure monitor on gxl
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Krzysztof Michonski <michonskikrzysztof@gmail.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, afenkart@gmail.com
List-ID: <devicetree@vger.kernel.org>

Hi Krzysztof,

the subject should start with: "arm64: dts: meson-gxl:", see the git
history (note that there was a rule change to use "arm64" instead of
"ARM64")

On Thu, Jun 6, 2019 at 3:24 PM Krzysztof Michonski
<michonskikrzysztof@gmail.com> wrote:
>
> From: Krzysztof Michonski <michonskikrzysztof@gmail.com>
>
> Add secure monitor node in the gxl dtsi file.
I assume that this is to enable the GXL and GXM specific commands?

> Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 3093ae421b17..fd75538ee9f9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -37,6 +37,10 @@
>                         };
>                 };
>         };
> +
> +       sm: secure-monitor {
> +               compatible = "amlogic,meson-gxl-sm";
> +       };
>  };
if you keep the secure-monitor node in meson-gx.dtsi then you can use
something like:
&sm {
    compatible = "amlogic,meson-gxl-sm";
};

the compatible string has to be added to the documentation in
Documentation/devicetree/bindings/firmware/meson/meson_sm.txt with a
separate patch
devicetree bindings should be backwards compatible (at least that's
the rule of thumb)
you can use a fallback compatible string so this new .dts/.dtb also
works with old kernels (which don't support the new, GXL specific,
compatible string yet):
  compatible = "amlogic,meson-gxl-sm", "amlogic,meson-gxbb-sm";


Martin
