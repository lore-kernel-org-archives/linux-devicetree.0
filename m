From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Tue, 26 Dec 2017 17:05:27 -0600
Message-ID: <CAL_JsqL5-ZSB1Pqhjw2YkVpgFKWWu3myYXpL0O7TZQ1aKML4pw@mail.gmail.com>
References: <1514007876-16617-1-git-send-email-jassisinghbrar@gmail.com> <1514007911-16674-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514007911-16674-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 22, 2017 at 11:45 PM,  <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This patch adds documentation for Device-Tree bindings for the
> Socionext NetSec Controller driver.
>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/net/socionext-netsec.txt   | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt

One other comment besides issues discussed on v2...

> diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> new file mode 100644
> index 0000000..adc7bfa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
> @@ -0,0 +1,55 @@
> +* Socionext NetSec Ethernet Controller IP
> +
> +Required properties:
> +- compatible: Should be "socionext,synquacer-netsec"
> +- reg: Address and length of the control register area, followed by the
> +       address and length of the EEPROM holding the MAC address and
> +       microengine firmware
> +- interrupts: Should contain ethernet controller interrupt
> +- clocks: phandle to the PHY reference clock, and any other clocks to be
> +          switched by runtime_pm
> +- clock-names: Required only if more than a single clock is listed in 'clocks'.
> +               The PHY reference clock must be named 'phy_refclk'
> +- phy-mode: See ethernet.txt file in the same directory
> +- phy-handle: See ethernet.txt in the same directory.
> +
> +- mdio device tree subnode: When the Netsec has a phy connected to its local
> +               mdio, there must be device tree subnode with the following
> +               required properties:
> +
> +       - #address-cells: Must be <1>.
> +       - #size-cells: Must be <0>.
> +
> +       For each phy on the mdio bus, there must be a node with the following
> +       fields:
> +       - compatible: Refer to phy.txt
> +       - reg: phy id used to communicate to phy.
> +
> +Optional properties: (See ethernet.txt file in the same directory)
> +- dma-coherent: Boolean property, must only be present if memory
> +       accesses performed by the device are cache coherent.
> +- local-mac-address: See ethernet.txt in the same directory.
> +- mac-address: See ethernet.txt in the same directory.
> +- max-speed: See ethernet.txt in the same directory.
> +- max-frame-size: See ethernet.txt in the same directory.
> +
> +Example:
> +       eth0: netsec@522d0000 {

ethernet@...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
