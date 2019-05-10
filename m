From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/5] arm64: dts: meson: g12a: add network support
Date: Fri, 10 May 2019 18:52:21 +0200
Message-ID: <7b8ddc8de64b6d8947ac869ccd09ebb7e995130a.camel@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510164940.13496-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-05-10 at 18:49 +0200, Jerome Brunet wrote:
> Add network support for the g12a

I forgot to mention that series applies on top of the node
re-order series [0]

[0]: https://lkml.kernel.org/r/20190510155327.5759-1-jbrunet@baylibre.com

> 
> Jerome Brunet (5):
>   arm64: dts: meson: g12a: add ethernet mac controller
>   arm64: dts: meson: g12a: add ethernet pinctrl definitions
>   arm64: dts: meson: g12a: add mdio multiplexer
>   arm64: dts: meson: u200: add internal network
>   arm64: dts: meson: sei510: add network support
> 
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    |  7 ++
>  .../boot/dts/amlogic/meson-g12a-u200.dts      |  7 ++
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 90 +++++++++++++++++++
>  3 files changed, 104 insertions(+)
> 
