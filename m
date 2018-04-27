Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 16:53:17 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: meson-uart: DT fix
 s/clocks-names/clock-names/
Message-ID: <20180427215317.u4ueypn5vhm5xmcw@rob-hp-laptop>
References: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 23, 2018 at 09:32:40AM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As this is only binding change, I've applied it.

Rob
