From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Date: Wed, 31 Jul 2019 11:12:09 +0300
Message-ID: <20190731081209.GA5080@pendragon.ideasonboard.com>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190731074801.5706-1-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

(CC'ing the device tree mailing list)

Thank you for the patch.

On Wed, Jul 31, 2019 at 09:48:01AM +0200, Geert Uytterhoeven wrote:
> Currently there are two nodes named "regulator1" in the Draak DTS: a
> 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> for the backlight.  This causes the former to be overwritten by the
> latter.
> 
> Fix this by renaming all regulators with numerical suffixes to use named
> suffixes, which are less likely to conflict.

Aren't DT node names supposed to describe the device type, not a
particular instance of the device ? This is something that has bothered
me too, but I believe the naming scheme should be decided globally, not
per board. Is there precedent for using this scheme that has been
explicitly approved by the DT maintainers ?

> Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I guess this is a fix for v5.3?
> 
> This fix takes a slightly different approach than commit
> 12105cec654cf906 ("arm64: dts: renesas: r8a77990: ebisu: Fix backlight
> regulator numbering"), which just fixed the conflicting numerical
> suffix.
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 0711170b26b1fe1c..3aa2564dfdc25fff 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -97,7 +97,7 @@
>  		reg = <0x0 0x48000000 0x0 0x18000000>;
>  	};
>  
> -	reg_1p8v: regulator0 {
> +	reg_1p8v: regulator-1p8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
>  		regulator-min-microvolt = <1800000>;
> @@ -106,7 +106,7 @@
>  		regulator-always-on;
>  	};
>  
> -	reg_3p3v: regulator1 {
> +	reg_3p3v: regulator-3p3v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-3.3V";
>  		regulator-min-microvolt = <3300000>;
> @@ -115,7 +115,7 @@
>  		regulator-always-on;
>  	};
>  
> -	reg_12p0v: regulator1 {
> +	reg_12p0v: regulator-12p0v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "D12.0V";
>  		regulator-min-microvolt = <12000000>;

-- 
Regards,

Laurent Pinchart
