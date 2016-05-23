From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: reset: Add bindings for the Meson GXBB
 Reset Controller
Date: Mon, 23 May 2016 16:04:06 -0500
Message-ID: <20160523210406.GA26743@rob-hp-laptop>
References: <1463732875-23141-1-git-send-email-narmstrong@baylibre.com>
 <1463732875-23141-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463732875-23141-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, xing.xu@amlogic.com, victor.wan@amlogic.com, jerry.cao@amlogic.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2016 at 10:27:54AM +0200, Neil Armstrong wrote:
> Add DT bindings for the Meson GXBB SoC Reset Controller documentation and the
> associated include file.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/reset/amlogic,meson-gxbb-reset.txt    |  18 ++
>  .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 199 +++++++++++++++++++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-gxbb-reset.txt
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h

Other than the whitespace comments,

Acked-by: Rob Herring <robh@kernel.org>
