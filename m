From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2] DT: net: document Ethernet bindings in one place
Date: Tue, 28 Jan 2014 07:38:49 -0600
Message-ID: <CAL_JsqLH6j=eGPr53myATQ+ySwr4P1y7Lnvqa9Y+-YAqqWa_FA@mail.gmail.com>
References: <201401280150.32456.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201401280150.32456.sergei.shtylyov@cogentembedded.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 4:50 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> This patch is an attempt to gather the Ethernet related bindings in one file,
> like it's done in the MMC and some other subsystems. It should save some of
> the trouble of documenting several properties over and over in each binding
> document, instead only making reference to the main file.
>
> I have used the Embedded Power Architecture(TM) Platform Requirements (ePAPR)
> standard as a base for the properties description, also documenting some ad-hoc
> properties that have been introduced over time despite having direct analogs in
> ePAPR; hence I also attempt to make emphasis on using the standard properties
> and marking ad-hoc properties as not recommended for new bindings.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> The patch is against DaveM's 'net-next.git' repo.
> However, I'm not posting to netdev@vger.kernel.org this time or Dave will scold
> me. :-)
>
> Changes in version 2:
> - restored the mentions of the common properties in the individual bindings, but
>   made them reference the common file instead;
> - edited some property descriptions in the common file, indicating preferred and  not recommended properties;
> - moved the "max-frame-size" property definition to the common file, noting
>   about its contradictory definition in ePAPR 1.1;
> - resolved rejects, refreshed the patch.
>
>  Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt    |    5 --
>  Documentation/devicetree/bindings/net/arc_emac.txt                |   10 +---
>  Documentation/devicetree/bindings/net/cavium-mix.txt              |    7 +--
>  Documentation/devicetree/bindings/net/cavium-pip.txt              |    7 +--
>  Documentation/devicetree/bindings/net/cdns-emac.txt               |    5 --
>  Documentation/devicetree/bindings/net/cpsw.txt                    |    5 --
>  Documentation/devicetree/bindings/net/davicom-dm9000.txt          |    3 -
>  Documentation/devicetree/bindings/net/davinci_emac.txt            |    4 -
>  Documentation/devicetree/bindings/net/ethernet.txt                |   22 ++++++++++
>  Documentation/devicetree/bindings/net/fsl-fec.txt                 |    6 --
>  Documentation/devicetree/bindings/net/fsl-tsec-phy.txt            |   14 ++----
>  Documentation/devicetree/bindings/net/lpc-eth.txt                 |    6 +-
>  Documentation/devicetree/bindings/net/macb.txt                    |    5 --
>  Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt |    6 --
>  Documentation/devicetree/bindings/net/marvell-orion-net.txt       |    4 -
>  Documentation/devicetree/bindings/net/micrel-ks8851.txt           |    2
>  Documentation/devicetree/bindings/net/smsc-lan91c111.txt          |    2
>  Documentation/devicetree/bindings/net/smsc911x.txt                |    6 --
>  Documentation/devicetree/bindings/net/stmmac.txt                  |    8 +--
>  19 files changed, 63 insertions(+), 64 deletions(-)
>
> Index: net-next/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
> ===================================================================
> --- net-next.orig/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
> +++ net-next/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
> @@ -4,12 +4,11 @@ Required properties:
>  - compatible: should be "allwinner,sun4i-emac".
>  - reg: address and length of the register set for the device.
>  - interrupts: interrupt for the device
> -- phy: A phandle to a phy node defining the PHY address (as the reg
> -  property, a single integer).
> +- phy: see ethernet.txt file in the same directory.
>  - clocks: A phandle to the reference clock for this device
>
>  Optional properties:
> -- (local-)mac-address: mac address to be used by this driver
> +- [local-]mac-address: see ethernet.txt file in the same directory

Sorry, but I meant you should just have a single statement like:

This binding uses standard ethernet properties defined in ethernet.txt.

Rob
