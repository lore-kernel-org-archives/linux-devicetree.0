From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Amlogic SM1 based
 Khadas VIM3L bindings
Date: Thu, 29 Aug 2019 07:26:58 -0500
Message-ID: <20190829122658.GA10660@bogus>
References: <20190828141816.16328-1-narmstrong@baylibre.com>
 <20190828141816.16328-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828141816.16328-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 04:18:15PM +0200, Neil Armstrong wrote:
> The Khadas VIM3 is also available as VIM3L with the Pin-to-pin compatible
> Amlogic SM1 SoC in the S905D3 variant package.
> 
> Change the description to match the S905X3/D3/Y3 variants like the G12A
> description, and add the khadas,vim3l compatible.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
