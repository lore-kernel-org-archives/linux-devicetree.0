From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] ARM64: dts: amlogic: Add basic support for Amlogic
 S905D
Date: Mon, 12 Sep 2016 10:42:01 -0500
Message-ID: <20160912154201.GA29389@rob-hp-laptop>
References: <20160903082227.30559-1-narmstrong@baylibre.com>
 <20160903082227.30559-4-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160903082227.30559-4-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: afaerber@suse.de, khilman@baylibre.com, carlo@caione.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 03, 2016 at 10:22:26AM +0200, Neil Armstrong wrote:
> This patch introduces the basic support for the Amlogic S905D (MesonGXL)
> and for the Amlogic evaluation boards P230 and P231.
> No documentation has been released yet for this SoC, so for now only the
> bare minimum has been added in the DT.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt  |  3 +
>  arch/arm64/boot/dts/amlogic/Makefile               |  2 +
>  .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      | 51 +++++++++++++++++
>  .../boot/dts/amlogic/meson-gxl-s905d-p231.dts      | 51 +++++++++++++++++
>  .../boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi     | 64 ++++++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi   | 48 ++++++++++++++++
>  6 files changed, 219 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d.dtsi

Acked-by: Rob Herring <robh@kernel.org>
