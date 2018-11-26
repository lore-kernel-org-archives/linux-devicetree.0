From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: amlogic: Add Internal Clock Measurer
 bindings
Date: Mon, 26 Nov 2018 10:05:59 -0600
Message-ID: <20181126160559.GA8094@bogus>
References: <20181118135024.30720-1-narmstrong@baylibre.com>
 <20181118135310.31458-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118135310.31458-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 02:53:10PM +0100, Neil Armstrong wrote:
> The Amlogic Meson SoCs embeds a clock measurer IP to measure the internal
> clock paths frequencies.
> 
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Rob,
> 
> I didn't take your v2 Reviewed-by since I changed the compatible list,
> tell me if i can still keep the tag.

Reviewed-by: Rob Herring <robh@kernel.org>

>  
> Thanks,
> Neil
> 
>  .../bindings/soc/amlogic/clk-measure.txt       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
