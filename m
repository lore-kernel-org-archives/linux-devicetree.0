From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gxm: Add support for Khadas VIM2
Date: Thu, 21 Sep 2017 18:47:34 -0500
Message-ID: <20170921234734.nbjvpz2vukywyrci@rob-hp-laptop>
References: <1505832820-3517-1-git-send-email-narmstrong@baylibre.com>
 <1505832820-3517-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505832820-3517-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gouwa <gouwa@szwesion.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 19, 2017 at 04:53:40PM +0200, Neil Armstrong wrote:
> The Khadas VIM2 is a Single Board Computer, respin of the origin
> Khadas VIM board, using an Amlogic S912 SoC and more server oriented.
> 
> It provides the same external connectors and header pinout, plus a SPI
> NOR Flash, a reprogrammable STM8S003 MCU, FPC Connector, Cooling FAN header
> and Pogo Pads Arrays.
> 
> Cc: Gouwa <gouwa@szwesion.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     | 401 +++++++++++++++++++++
>  3 files changed, 403 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts

Acked-by: Rob Herring <robh@kernel.org>
