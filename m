From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add tdm resets
Date: Wed, 21 Aug 2019 16:23:36 +0200
Message-ID: <69a85842-3933-3965-9f4b-9d6a8432f766@baylibre.com>
References: <20190820121551.18398-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820121551.18398-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20/08/2019 14:15, Jerome Brunet wrote:
> This patchset adds the dedicated reset of the tdm formatters which
> have been added on the g12a SoC family. Using these help with the channel
> mapping when the formatter uses more than 1 i2s lane.
> 
> Kevin, please note that to build, this patchset depends on the new reset
> bindings of the audio clock controller. I've prepared a tag for you [0]
> 
> [0]: git://github.com/BayLibre/clk-meson.git - clk-meson-dt-v5.4-2
> 
> Jerome Brunet (2):
>   arm64: dts: meson: g12a: audio clock controller provides resets
>   arm64: dts: meson: g12a: add reset to tdm formatters
> 
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

For the serie,

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
