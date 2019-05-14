From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: add Amlogic Video Decoder Bindings
Date: Tue, 14 May 2019 20:46:56 +0200
Message-ID: <CAFBinCBm=zJb9Ap3XL03X4LUAPcPQ2u=gJsBhBdHSUXYD5BMpw@mail.gmail.com>
References: <20190514135612.30822-1-mjourdan@baylibre.com> <20190514135612.30822-2-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514135612.30822-2-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-media <linux-media@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Tue, May 14, 2019 at 3:56 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Add documentation for the meson vdec dts node.
thank you for working on this!

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +Required properties:
> +- compatible: value should be different for each SoC family as :
> +       - GXBB (S905) : "amlogic,gxbb-vdec"
> +       - GXL (S905X, S905D) : "amlogic,gxl-vdec"
> +       - GXM (S912) : "amlogic,gxm-vdec"
> +- reg: base address and size of he following memory-mapped regions :
> +       - dos
> +       - esparser
> +- reg-names: should contain the names of the previous memory regions
> +- interrupts: should contain the following IRQs:
> +       - vdec
> +       - esparser
> +- interrupt-names: should contain the names of the previous interrupts
Maxime already mentioned in the RFC version that there may be more
interrupts in the future. I'm fine with adding the missing ones on
demand

> +- amlogic,ao-sysctrl: should point to the AOBUS sysctrl node
my goal is to remove this property at some point and replace it with
references to the power-domains.
however, we don't have a power-domain driver for this yet (it's
somewhere on my TODO-list - it involves splitting the current
meson-gx-pwrc-vpu into two separate drivers, so we need to do it
carefully so we don't break HDMI support)


Regards
Martin
