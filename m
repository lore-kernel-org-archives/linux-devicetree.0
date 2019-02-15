From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: gnss: add mediatek binding
Date: Fri, 15 Feb 2019 17:04:57 +0100
Message-ID: <20190215160457.GO28278@localhost>
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
 <1550070569-18588-3-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550070569-18588-3-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
> 
> diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
> new file mode 100644
> index 000000000000..12283d429baa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
> @@ -0,0 +1,37 @@
> +Mediatek-based GNSS Receiver DT binding
> +
> +Mediatek chipsets are used in GNSS-receiver modules produced by several
> +vendors and can use a UART interface.
> +
> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
> +properties.
> +
> +Required properties:
> +
> +- compatible	: Must be
> +
> +			"globaltop,pa6h"
> +
> +- vcc-supply	: Main voltage regulator (pin name: VCC)
> +
> +Optional properties:
> +
> +- current-speed		: Default UART baud rate
> +- gnss-fix-gpios	: GPIO used to determine device position fix state
> +			  (pin name: FIX, 3D_FIX)
> +- reset-gpios		: GPIO used to reset the device
> +  		  	  (pin name: RESET, NRESET)
> +- timepulse-gpios	: Time pulse GPIO (pin name: PPS1, 1PPS)
> +- v-bckp-supply		: Backup voltage regulator
> +  			  (pin name: VBAT, VBACKUP)

As we discussed, I changed this to "vbackup-supply" (here and in the
driver) before applying.

Note that git reported some whitespace errors above too (spaces before
tabs) that I fixed up. Not sure why checkpatch doesn't complain.

All now applied.

Thanks,
Johan
