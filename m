From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 G12A compatible and ports
Date: Thu, 28 Mar 2019 10:17:50 -0500
Message-ID: <20190328151750.GA21381@bogus>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
 <20190313141030.5958-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313141030.5958-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 Mar 2019 15:10:29 +0100, Neil Armstrong wrote:
> The Amlogic G12A SoC has a slighly modified DW-HDMI Glue with
> support for HDMI 2.1 and a different DW-HDMI register access.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
