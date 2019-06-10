From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: sort sdio nodes correctly
Date: Mon, 10 Jun 2019 17:37:54 +0200
Message-ID: <CAFBinCC4g1WVFyTgQrDUcYs13HDYp7Ggn=eSQ+X=LnpEoGg--w@mail.gmail.com>
References: <20190610124931.17422-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610124931.17422-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Mon, Jun 10, 2019 at 2:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Fix sdio node order in the soc device tree
good catch, thank you for fixing this!

> Fixes: a1737347250e ("arm64: dts: meson: g12a: add SDIO controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +                                       sdio_pins: sdio {

[...]
strictly speaking we're not using alphabetical sorting here
I'm fine with it though because it's consistent with the pattern
{sdio,emmc,sd}{,_ds,_clk,...}_pins (and thus all other definitions
here)


Martin
