From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 01/14] arm64: dts: meson: fix ethernet mac reg format
Date: Tue, 20 Aug 2019 22:21:41 +0200
Message-ID: <CAFBinCA5dPztTZ6kUBWK1XgjQPDY6FVsLHytMdncThHnf4Z+8g@mail.gmail.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com> <20190814142918.11636-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814142918.11636-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2019 at 4:30 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-axg-s400.dt.yaml: soc: ethernet@ff3f0000:reg:0: [0, 4282318848, 0, 65536, 0, 4284695872, 0, 8] is too long
> meson-axg-s400.dt.yaml: ethernet@ff3f0000: reg: [[0, 4282318848, 0, 65536, 0, 4284695872, 0, 8]] is too short
> meson-g12a-u200.dt.yaml: soc: ethernet@ff3f0000:reg:0: [0, 4282318848, 0, 65536, 0, 4284695872, 0, 8] is too long
> meson-g12a-u200.dt.yaml: ethernet@ff3f0000: reg: [[0, 4282318848, 0, 65536, 0, 4284695872, 0, 8]] is too short
> meson-gxbb-nanopi-k2.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too long
> meson-gxl-s805x-libretech-ac.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too lon
if you have to re-send it for whatever reason I would appreciate if
you could add:
"while here, also drop the redundant reg property from meson-gxl.dtsi
because it had the same value as meson-gx.dtsi from which it inherits"

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
