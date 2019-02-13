From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: gnss: add mediatek binding
Date: Wed, 13 Feb 2019 14:19:29 -0600
Message-ID: <20190213201929.GA21948@bogus>
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
 <1550070569-18588-3-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550070569-18588-3-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 04:09:27PM +0100, Loys Ollivier wrote:
> Add binding for Mediatek-based GNSS receivers.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> v4:
> Use standard names for reset-gpios and gnss-fix-gpios
> s/an/a UART
> 
> v3:
> Removed the I2C and SPI interfaces references.
> Removed the "mediatek,mt3339" compatible line.
> Added the optional propertied (reset, fix)
> Added the pin names for the optional properties.
> 
> v2:
> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
> Moved current-speed as an optional propertie.
> Removed the status line in the example.
> Added "mediatek,mt3339" compatible.
> 
>  .../devicetree/bindings/gnss/mediatek.txt          | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt

Reviewed-by: Rob Herring <robh@kernel.org>
