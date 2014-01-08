From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 6/9] mtd: nand: add sunxi NFC dt bindings doc
Date: Wed, 8 Jan 2014 22:28:55 +0100
Message-ID: <201401082228.55807.arnd@arndb.de>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389190924-26226-7-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1389190924-26226-7-git-send-email-b.brezillon@overkiz.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 08 January 2014, Boris BREZILLON wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> @@ -0,0 +1,71 @@
> +Allwinner NAND Flash Controller (NFC)
> +
> +Required properties:
> +- compatible : "allwinner,sun4i-nfc".
> +- reg : shall contain registers location and length for data and reg.
> +- interrupts : shall define the NFC interrupt.
> +- #address-cells: shall be set to 1. Encode the nand CS.
> +- #size-cells : shall be set to 0.
> +- clocks : shall reference NFC clocks.
> +- clock-names : NFC internal clock names. Shall contain :
> +    * "ahb_clk" : AHB gating clock
> +    * "sclk" : NFC clock
> +

One small request: Can we try to avoid the "NFC" name here? I think it's
too overloaded and people may confuse it with near-field communication,
which I'm sure will be supported in sunxi based devices at some point.

It doesn't hurt to also mention that the function block is called
nfc, but I think references to it are better named "nand", which is
less confusing.

	Arnd
