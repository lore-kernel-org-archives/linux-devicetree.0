From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] ARM64: Add Vega S96 board support
Date: Tue, 19 Sep 2017 17:03:32 +0200
Message-ID: <1505833412.2703.85.camel@baylibre.com>
References: <1505822748-23431-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505822748-23431-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, balbes-150@yandex.ru
List-Id: devicetree@vger.kernel.org

On Tue, 2017-09-19 at 14:05 +0200, Neil Armstrong wrote:
> This patchset adds support for the Tronsmart Vega S96 TV Box based
> on the Q200 Amlogic Reference design.
> 
> Neil Armstrong (2):
>   ARM64: dts: meson-gxm: Add Vega S96 board
>   dt-bindings: arm: amlogic: Add Tronsmart Vega S96 binding
> 
>  Documentation/devicetree/bindings/arm/amlogic.txt  |  1 +
>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>  arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts | 39
> ++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
> 

Apart from the 2 comments on patch 1, Series looks good to me
With this fixed, feel free to add

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
