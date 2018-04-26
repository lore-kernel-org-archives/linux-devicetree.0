Return-Path: <SRS0=7G3g=HP=baylibre.com=narmstrong@kernel.org>
Subject: Re: [PATCH] dt-bindings: meson-uart: DT fix
 s/clocks-names/clock-names/
References: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <8ca5eed0-8dd6-b411-32a6-d63c62ff9e04@baylibre.com>
Date: Thu, 26 Apr 2018 10:40:56 +0200
MIME-Version: 1.0
In-Reply-To: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On 23/04/2018 09:32, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
> index 8ff65fa632fdedd7..c06c045126fc9070 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
> @@ -21,7 +21,7 @@ Required properties:
>  - interrupts : identifier to the device interrupt
>  - clocks : a list of phandle + clock-specifier pairs, one for each
>  	   entry in clock names.
> -- clocks-names :
> +- clock-names :
>     * "xtal" for external xtal clock identifier
>     * "pclk" for the bus core clock, either the clk81 clock or the gate clock
>     * "baud" for the source of the baudrate generator, can be either the xtal
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
