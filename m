From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: reset: Add bindings for the Meson
 SoC Reset Controller
Date: Wed, 25 May 2016 14:10:26 -0500
Message-ID: <20160525191026.GA24249@rob-hp-laptop>
References: <1464169758-26975-1-git-send-email-narmstrong@baylibre.com>
 <1464169758-26975-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464169758-26975-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, jerry.cao@amlogic.com, devicetree@vger.kernel.org, xing.xu@amlogic.com, victor.wan@amlogic.com
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2016 at 11:49:16AM +0200, Neil Armstrong wrote:
> Add DT bindings for the Meson SoC Reset Controller documentation and the
> associated include file.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/reset/amlogic,meson-reset.txt         |  18 ++
>  .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 210 +++++++++++++++++++++
>  include/dt-bindings/reset/amlogic,meson8b-reset.h  | 175 +++++++++++++++++
>  3 files changed, 403 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson8b-reset.h

Please add acks when posting new versions.

Rob
