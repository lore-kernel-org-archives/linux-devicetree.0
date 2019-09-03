From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv2-next 1/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to P5V0 regulator
Date: Tue, 3 Sep 2019 21:03:03 +0200
Message-ID: <CAFBinCDSbWedtH6mtdyw2Oy3ZxHU160-NUMa3nBXn4B9BJ--pg@mail.gmail.com>
References: <20190902085821.1263-1-linux.amoon@gmail.com> <20190902085821.1263-2-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902085821.1263-2-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Mon, Sep 2, 2019 at 10:58 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per schematics VDDIO_AO18, VDDIO_AO3V3/VDD3V3 DDR3_1V5/DDR_VDDC:
> fixed regulator output which is supplied by P5V0.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
one comment below, but overall this looks good:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       vddc_ddr: regulator-vddc-ddr {
> +               compatible = "regulator-fixed";
> +               regulator-name = "DDR3_1V5";
I prefer if the node name matches the regulator name, so in this case
I would write above:
  ddr3_1v5: regulator-ddr-1v5 {


Martin
