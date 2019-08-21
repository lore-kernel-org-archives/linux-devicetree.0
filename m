From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm-boards: Update pointer to ARM CPU
 bindings
Date: Wed, 21 Aug 2019 13:24:45 -0500
Message-ID: <20190821182445.GA9101@bogus>
References: <20190731114201.7884-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190731114201.7884-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Wed, 31 Jul 2019 13:42:01 +0200, Geert Uytterhoeven wrote:
> The ARM CPU DT bindings were converted from plain text to YAML, but not
> all referrers were updated.
> 
> Fixes: 672951cbd1b70a9e ("dt-bindings: arm: Convert cpu binding to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v2:
>   - Add Acked-by.
> ---
>  Documentation/devicetree/bindings/arm/arm-boards | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
