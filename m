From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: enable pinctrl
Date: Mon, 21 Jan 2019 19:11:19 +0100
Message-ID: <d8b4eaa459108471ceaf821937dc857c83bb8487.camel@baylibre.com>
References: <20190117103151.3349-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117103151.3349-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-17 at 11:31 +0100, Jerome Brunet wrote:
> This patchset enables pinctrl on the g12a and adds the necessary
> pinctrl settings to the u200 uart
> 
> Kevin, please note that this patchset depends on the:
> * dts bus fixup: [0]
> * pinctrl region fixes [1].
> 
> [0]: https://lkml.kernel.org/r/20190116165236.8330-1-jbrunet@baylibre.com
> [1]: https://lkml.kernel.org/r/20190117102315.1833-1-jbrunet@baylibre.com
> 
> Cheers.

Hi Kevin,

Please ignore this series. It is missing gpio-ranges.
I'll add it in the v2

> 
> Jerome Brunet (2):
>   arm64: dts: meson: g12a: add pinctrl support controllers
>   arm64: dts: meson: g12a: add uart_ao_a pinctrl
> 
>  .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 +
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 67 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
